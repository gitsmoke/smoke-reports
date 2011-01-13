ok 1 - gc empty repository
ok 2 - gc --gobbledegook
not ok - 3 gc -h with invalid configuration
#	
#		mkdir broken &&
#		(
#			cd broken &&
#			git init &&
#			echo "[gc] pruneexpire = CORRUPT" >>.git/config &&
#			test_expect_code 129 git gc -h >usage 2>&1
#		) &&
#		grep "[Uu]sage" broken/usage
#	
# failed 1 among 3 test(s)
1..3
