ok 1 - update-index --nonsense fails
not ok - 2 update-index --nonsense dumps usage
#	
#		test_expect_code 129 git update-index --nonsense 2>err &&
#		grep "[Uu]sage: git update-index" err
#	
not ok - 3 update-index -h with corrupt index
#	
#		mkdir broken &&
#		(
#			cd broken &&
#			git init &&
#			>.git/index &&
#			test_expect_code 129 git update-index -h >usage 2>&1
#		) &&
#		grep "[Uu]sage: git update-index" broken/usage
#	
# failed 2 among 3 test(s)
1..3
