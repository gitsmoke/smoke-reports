ok 1 - prepare repository with topic branches
ok 2 - rebase on dirty worktree
ok 3 - rebase on dirty cache
ok 4 - rebase against master
ok 5 - rebase against master twice
ok 6 - rebase against master twice with --force
ok 7 - rebase against master twice from another branch
ok 8 - rebase fast-forward to master
ok 9 - the rebase operation should not have destroyed author information
not ok - 10 the rebase operation should not have destroyed author information (2)
#	
#		git log -1 |
#		grep 'Author: author@name <bogus@email@address>'
#	
ok 11 - HEAD was detached during rebase
ok 12 - rebase after merge master
ok 13 - rebase of history with merges is linearized
ok 14 - rebase of history with merges after upstream merge is linearized
ok 15 - rebase a single mode change
not ok - 16 rebase is not broken by diff.renames
#	
#		git config diff.renames copies &&
#		test_when_finished "git config --unset diff.renames" &&
#		git checkout filemove &&
#		GIT_TRACE=1 git rebase force-3way
#	
ok 17 - setup: recover
not ok - 18 Show verbose error when HEAD could not be detached
#	
#		>B &&
#		test_must_fail git rebase topic 2>output.err >output.out &&
#		grep "The following untracked working tree files would be overwritten by checkout:" output.err &&
#		grep B output.err
#	
ok 19 - dump usage when upstream arg is missing
ok 20 - rebase -q is quiet
ok 21 - Rebase a commit that sprinkles CRs in
ok 22 - rebase can copy notes
ok 23 - rebase -m can copy notes
# failed 3 among 23 test(s)
1..23
