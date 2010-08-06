ok 1 - setup
ok 2 - no changes are a nop
ok 3 - test the [branch] option
ok 4 - test --onto <branch>
ok 5 - rebase on top of a non-conflicting commit
ok 6 - reflog for the branch shows state before rebase
ok 7 - exchange two commits
ok 8 - stop on conflicting pick
ok 9 - abort
ok 10 - abort with error when new base cannot be checked out
ok 11 - retain authorship
ok 12 - squash
ok 13 - retain authorship when squashing
ok 14 - -p handles "no changes" gracefully
not ok 15 - exchange two commits with -p # TODO known breakage
ok 16 - preserve merges with -p
ok 17 - edit ancestor with -p
ok 18 - --continue tries to commit
ok 19 - verbose flag is heeded, even after --continue
ok 20 - multi-squash only fires up editor once
ok 21 - multi-fixup does not fire up editor
ok 22 - commit message used after conflict
ok 23 - commit message retained after conflict
ok 24 - squash and fixup generate correct log messages
ok 25 - squash ignores comments
ok 26 - squash ignores blank lines
ok 27 - squash works as expected
ok 28 - interrupted squash works as expected
ok 29 - interrupted squash works as expected (case 2)
ok 30 - ignore patch if in upstream
ok 31 - --continue tries to commit, even for "edit"
ok 32 - aborted --continue does not squash commits after "edit"
ok 33 - auto-amend only edited commits after "edit"
ok 34 - rebase a detached HEAD
ok 35 - rebase a commit violating pre-commit
ok 36 - rebase with a file named HEAD in worktree
ok 37 - do "noop" when there is nothing to cherry-pick
ok 38 - submodule rebase setup
ok 39 - submodule rebase -i
ok 40 - avoid unnecessary reset
ok 41 - reword
ok 42 - rebase -i can copy notes
ok 43 - rebase -i can copy notes over a fixup
ok 44 - rebase while detaching HEAD
ok 45 - always cherry-pick with --no-ff
ok 46 - set up commits with funny messages
ok 47 - rebase-i history with funny messages
# still have 1 known breakage(s)
# passed all remaining 46 test(s)
1..47
