ok 1 - setup 
ok 2 - no filter specified
ok 3 - setup textconv filters
ok 4 - blame with --no-textconv
not ok - 5 basic blame on last commit
#	
#		git blame one.bin >blame &&
#		find_blame  <blame >result &&
#		test_cmp expected result
#	
not ok - 6 blame --textconv going through revisions
#	
#		git blame --textconv two.bin >blame &&
#		find_blame <blame >result &&
#		test_cmp expected result
#	
ok 7 - make a new commit
not ok - 8 blame from previous revision
#	
#		git blame HEAD^ two.bin >blame &&
#		find_blame <blame >result &&
#		test_cmp expected result
#	
# failed 3 among 8 test(s)
1..8
