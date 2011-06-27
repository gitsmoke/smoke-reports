ok 1 - setup
not ok - 2 cherry-pick a non-merge with -m should fail
#	
#	
#		git reset --hard &&
#		git checkout a^0 &&
#		test_must_fail git cherry-pick -m 1 b &&
#		git cherry-pick --skip-all &&
#		git diff --exit-code a --
#	
#	
ok 3 - cherry pick a merge without -m should fail
ok 4 - cherry pick a merge (1)
ok 5 - cherry pick a merge (2)
ok 6 - cherry pick a merge relative to nonexistent parent should fail
not ok - 7 revert a non-merge with -m should fail
#	
#	
#		git reset --hard &&
#		git checkout c^0 &&
#		test_must_fail git revert -m 1 b &&
#		git cherry-pick --skip-all &&
#		git diff --exit-code c
#	
#	
ok 8 - revert a merge without -m should fail
ok 9 - revert a merge (1)
ok 10 - revert a merge (2)
ok 11 - revert a merge relative to nonexistent parent should fail
# failed 2 among 11 test(s)
1..11
