ok 1 - prepare repository
ok 2 - Merge with d/f conflicts
ok 3 - F/D conflict
ok 4 - setup modify/delete + directory/file conflict
not ok - 5 modify/delete + directory/file conflict
#	
#		git checkout delete^0 &&
#		test_must_fail git merge modify &&
#	
#		test 3 = $(git ls-files -s | wc -l) &&
#		test 2 = $(git ls-files -u | wc -l) &&
#		test 1 = $(git ls-files -o | wc -l) &&
#	
#		test -f letters/file &&
#		test -f letters~modify
#	
not ok - 6 modify/delete + directory/file conflict; other way
#	
#		git reset --hard &&
#		git clean -f &&
#		git checkout modify^0 &&
#		test_must_fail git merge delete &&
#	
#		test 3 = $(git ls-files -s | wc -l) &&
#		test 2 = $(git ls-files -u | wc -l) &&
#		test 1 = $(git ls-files -o | wc -l) &&
#	
#		test -f letters/file &&
#		test -f letters~HEAD
#	
# failed 2 among 6 test(s)
1..6
