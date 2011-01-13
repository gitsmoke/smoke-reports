ok 1 - ls-files in empty repository
ok 2 - ls-files with nonexistent path
ok 3 - ls-files with nonsense option
not ok - 4 ls-files -h in corrupt repository
#	
#		mkdir broken &&
#		(
#			cd broken &&
#			git init &&
#			>.git/index &&
#			test_expect_code 129 git ls-files -h >usage 2>&1
#		) &&
#		grep "[Uu]sage: git ls-files " broken/usage
#	
# failed 1 among 4 test(s)
1..4
