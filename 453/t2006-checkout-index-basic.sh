ok 1 - checkout-index --gobbledegook
not ok - 2 checkout-index -h in broken repository
#	
#		mkdir broken &&
#		(
#			cd broken &&
#			git init &&
#			>.git/index &&
#			test_expect_code 129 git checkout-index -h >usage 2>&1
#		) &&
#		grep "[Uu]sage" broken/usage
#	
# failed 1 among 2 test(s)
1..2
