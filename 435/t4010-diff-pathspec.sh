Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4010-diff-pathspec/.git/
expecting success: echo frotz >file0 &&
     mkdir path1 &&
     echo rezrov >path1/file1 &&
     git update-index --add file0 path1/file1 &&
     tree=`git write-tree` &&
     echo "$tree" &&
     echo nitfol >file0 &&
     echo yomin >path1/file1 &&
     git update-index file0 path1/file1
6b4658eda9b6c5385f027bc54abf3276b6effd05

ok 1 - setup

expecting success: git diff-index --cached $tree -- path >current &&
     compare_diff_raw current expected

ok 2 - limit to path should show nothing

expecting success: git diff-index --cached $tree -- path1 >current &&
     compare_diff_raw current expected

ok 3 - limit to path1 should show path1/file1

expecting success: git diff-index --cached $tree -- path1/ >current &&
     compare_diff_raw current expected

ok 4 - limit to path1/ should show path1/file1
expecting success: git diff-index --cached $tree -- file0 >current &&
     compare_diff_raw current expected

ok 5 - limit to file0 should show file0
expecting success: git diff-index --cached $tree -- file0/ >current &&
     compare_diff_raw current expected

ok 6 - limit to file0/ should emit nothing.

expecting success: 
	tree2=$(git write-tree) &&
	echo "$tree2" &&
	git diff-tree -r --name-only $tree $tree2 -- pa path1/a >current &&
	>expected &&
	test_cmp expected current

54d8765b122f32157e847ce3924180cb2ec778fc

ok 7 - diff-tree pathspec

# passed all 7 test(s)
1..7
