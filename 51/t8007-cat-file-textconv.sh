ok 1 - setup 
not ok - 2 no filter specified
#	
#		git cat-file --textconv :one.bin 2>result
#		test_cmp expected result
#	
ok 3 - setup textconv filters
ok 4 - cat-file without --textconv
ok 5 - cat-file without --textconv on previous commit
not ok - 6 cat-file --textconv on last commit
#	
#		git cat-file --textconv :one.bin >result &&
#		test_cmp expected result
#	
not ok - 7 cat-file --textconv on previous commit
#	
#		git cat-file --textconv HEAD^:one.bin >result &&
#		test_cmp expected result
#	
# failed 3 among 7 test(s)
1..7
