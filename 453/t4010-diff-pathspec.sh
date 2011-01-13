ok 1 - setup
ok 2 - limit to path should show nothing
ok 3 - limit to path1 should show path1/file1
ok 4 - limit to path1/ should show path1/file1
ok 5 - limit to file0 should show file0
ok 6 - limit to file0/ should emit nothing.
ok 7 - diff-tree pathspec
not ok - 8 diff-tree with wildcard shows dir also matches
#	
#		git diff-tree --name-only $EMPTY_TREE $tree -- "f*" >result &&
#		echo file0 >expected &&
#		test_cmp expected result
#	
not ok - 9 diff-tree -r with wildcard
#	
#		git diff-tree -r --name-only $EMPTY_TREE $tree -- "*file1" >result &&
#		echo path1/file1 >expected &&
#		test_cmp expected result
#	
ok 10 - diff-tree with wildcard shows dir also matches
not ok - 11 diff-tree -r with wildcard from beginning
#	
#		git diff-tree -r --name-only $tree $tree2 -- "path1/*file1" >result &&
#		echo path1/file1 >expected &&
#		test_cmp expected result
#	
not ok - 12 diff-tree -r with wildcard
#	
#		git diff-tree -r --name-only $tree $tree2 -- "path1/f*" >result &&
#		echo path1/file1 >expected &&
#		test_cmp expected result
#	
# failed 4 among 12 test(s)
1..12
