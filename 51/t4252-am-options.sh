ok 1 - setup
ok 2 - interrupted am --whitespace=fix
not ok - 3 interrupted am -C1
#	
#		rm -rf .git/rebase-apply &&
#		git reset --hard initial &&
#		test_must_fail git am -C1 "$tm"/am-test-2-? &&
#		git am --skip &&
#		grep 3 file-1 &&
#		grep "^Three$" file-2
#	
not ok - 4 interrupted am -p2
#	
#		rm -rf .git/rebase-apply &&
#		git reset --hard initial &&
#		test_must_fail git am -p2 "$tm"/am-test-3-? &&
#		git am --skip &&
#		grep 3 file-1 &&
#		grep "^Three$" file-2
#	
not ok - 5 interrupted am -C1 -p2
#	
#		rm -rf .git/rebase-apply &&
#		git reset --hard initial &&
#		test_must_fail git am -p2 -C1 "$tm"/am-test-4-? &&
#		git am --skip &&
#		grep 3 file-1 &&
#		grep "^Three$" file-2
#	
ok 6 - interrupted am --directory="frotz nitfol"
ok 7 - apply to a funny path
ok 8 - am --reject
# failed 3 among 8 test(s)
1..8
