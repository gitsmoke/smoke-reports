ok 1 - setup
ok 2 - rebase -i with the exec command
ok 3 - rebase -i with the exec command runs from tree root
ok 4 - rebase -i with the exec command checks tree cleanness
ok 5 - no changes are a nop
ok 6 - test the [branch] option
ok 7 - test --onto <branch>
ok 8 - rebase on top of a non-conflicting commit
ok 9 - reflog for the branch shows state before rebase
ok 10 - exchange two commits
ok 11 - stop on conflicting pick
ok 12 - abort
ok 13 - abort with error when new base cannot be checked out
ok 14 - retain authorship
ok 15 - squash
ok 16 - retain authorship when squashing
ok 17 - -p handles "no changes" gracefully
not ok 18 - exchange two commits with -p # TODO known breakage
ok 19 - preserve merges with -p
ok 20 - edit ancestor with -p
ok 21 - --continue tries to commit
ok 22 - verbose flag is heeded, even after --continue
ok 23 - multi-squash only fires up editor once
ok 24 - multi-fixup does not fire up editor
ok 25 - commit message used after conflict
ok 26 - commit message retained after conflict
ok 27 - squash and fixup generate correct log messages
ok 28 - squash ignores comments
ok 29 - squash ignores blank lines
ok 30 - squash works as expected
ok 31 - interrupted squash works as expected
ok 32 - interrupted squash works as expected (case 2)
ok 33 - ignore patch if in upstream
ok 34 - --continue tries to commit, even for "edit"
ok 35 - aborted --continue does not squash commits after "edit"
ok 36 - auto-amend only edited commits after "edit"
ok 37 - rebase a detached HEAD
ok 38 - rebase a commit violating pre-commit
ok 39 - rebase with a file named HEAD in worktree
ok 40 - do "noop" when there is nothing to cherry-pick
ok 41 - submodule rebase setup
ok 42 - submodule rebase -i
ok 43 - avoid unnecessary reset
ok 44 - reword
ok 45 - rebase -i can copy notes
ok 46 - rebase -i can copy notes over a fixup
not ok - 47 rebase while detaching HEAD
#	
#		git symbolic-ref HEAD &&
#		grandparent=$(git rev-parse HEAD~2) &&
#		test_tick &&
#		FAKE_LINES="2 1" git rebase -i HEAD~2 HEAD^0 &&
#		test $grandparent = $(git rev-parse HEAD~2) &&
#		test_must_fail git symbolic-ref HEAD
#	
not ok - 48 always cherry-pick with --no-ff
#	
#		git checkout no-ff-branch &&
#		git tag original-no-ff-branch &&
#		git rebase -i --no-ff A &&
#		touch empty &&
#		for p in 0 1 2
#		do
#			test ! $(git rev-parse HEAD~$p) = $(git rev-parse original-no-ff-branch~$p) &&
#			git diff HEAD~$p original-no-ff-branch~$p > out &&
#			test_cmp empty out
#		done &&
#		test $(git rev-parse HEAD~3) = $(git rev-parse original-no-ff-branch~3) &&
#		git diff HEAD~3 original-no-ff-branch~3 > out &&
#		test_cmp empty out
#	
ok 49 - set up commits with funny messages
not ok - 50 rebase-i history with funny messages
#	
#		git rev-list A..funny >expect &&
#		test_tick &&
#		FAKE_LINES="1 2 3 4" git rebase -i A &&
#		git rev-list A.. >actual &&
#		test_cmp expect actual
#	
# still have 1 known breakage(s)
# failed 3 among remaining 49 test(s)
1..50
