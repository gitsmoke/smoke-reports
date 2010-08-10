ok 1 - setup
not ok - 2 rebase -i with the exec command
#	
#		git checkout master &&
#		FAKE_LINES="1 exec_touch_touch-one 2 exec_touch_touch-two exec_false exec_touch_touch-three 3 4
#			exec_touch_\"touch-file__name_with_spaces\";_touch_touch-after-semicolon 5" \
#			test_must_fail git rebase -i A &&
#		test -f touch-one &&
#		test -f touch-two &&
#		! test -f touch-three &&
#		test $(git rev-parse C) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of C)"
#			false
#		} &&
#		git rebase --continue &&
#		test -f touch-three &&
#		test -f "touch-file  name with spaces" &&
#		test -f touch-after-semicolon &&
#		test $(git rev-parse master) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of master)"
#			false
#		} &&
#		rm -f touch-*
#	
ok 3 - rebase -i with the exec command runs from tree root
not ok - 4 rebase -i with the exec command checks tree cleanness
#	
#		git checkout master &&
#		FAKE_LINES="exec_echo_foo_>file1 1" \
#			test_must_fail git rebase -i HEAD^ &&
#		test $(git rev-parse master^) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of master^)"
#			false
#		} &&
#		git reset --hard &&
#		git rebase --continue
#	
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
ok 47 - rebase while detaching HEAD
ok 48 - always cherry-pick with --no-ff
ok 49 - set up commits with funny messages
ok 50 - rebase-i history with funny messages
# still have 1 known breakage(s)
# failed 2 among remaining 49 test(s)
1..50
