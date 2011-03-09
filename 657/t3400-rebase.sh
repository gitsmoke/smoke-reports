ok 1 - prepare repository with topic branches
ok 2 - rebase on dirty worktree
ok 3 - rebase on dirty cache
ok 4 - rebase against master
ok 5 - rebase against master twice
ok 6 - rebase against master twice with --force
ok 7 - rebase against master twice from another branch
ok 8 - rebase fast-forward to master
ok 9 - the rebase operation should not have destroyed author information
ok 10 - the rebase operation should not have destroyed author information (2)
ok 11 - HEAD was detached during rebase
ok 12 - rebase after merge master
ok 13 - rebase of history with merges is linearized
ok 14 - rebase of history with merges after upstream merge is linearized
ok 15 - rebase a single mode change
ok 16 - rebase is not broken by diff.renames
ok 17 - setup: recover
ok 18 - Show verbose error when HEAD could not be detached
ok 19 - fail when upstream arg is missing and not on branch
ok 20 - fail when upstream arg is missing and not configured
ok 21 - default to @{upstream} when upstream arg is missing
ok 22 - rebase -q is quiet
ok 23 - Rebase a commit that sprinkles CRs in
ok 24 - rebase can copy notes
ok 25 - rebase -m can copy notes
# passed all 25 test(s)
1..25
