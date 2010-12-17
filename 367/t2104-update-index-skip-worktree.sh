ok 1 - setup
ok 2 - index is at version 2
ok 3 - update-index --skip-worktree
ok 4 - index is at version 3 after having some skip-worktree entries
ok 5 - ls-files -t
ok 6 - update-index --no-skip-worktree
ok 7 - index version is back to 2 when there is no skip-worktree entry
# passed all 7 test(s)
1..7
