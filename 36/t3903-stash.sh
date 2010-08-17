ok 1 - stash some dirty working directory
ok 2 - parents of stash
ok 3 - apply needs clean working directory
ok 4 - apply stashed changes
ok 5 - apply stashed changes (including index)
ok 6 - unstashing in a subdirectory
ok 7 - drop top stash
ok 8 - drop middle stash
ok 9 - stash pop
ok 10 - stash branch
ok 11 - apply -q is quiet
ok 12 - save -q is quiet
ok 13 - pop -q is quiet
ok 14 - pop -q --index works and is quiet
ok 15 - drop -q is quiet
ok 16 - stash -k
ok 17 - stash --invalid-option
ok 18 - stash an added file
ok 19 - stash rm then recreate
ok 20 - stash rm and ignore
ok 21 - stash rm and ignore (stage .gitignore)
ok 22 - stash file to symlink
ok 23 - stash file to symlink (stage rm)
ok 24 - stash file to symlink (full stage)
ok 25 - stash symlink to file
ok 26 - stash symlink to file (stage rm)
ok 27 - stash symlink to file (full stage)
not ok 28 - stash directory to file # TODO known breakage
not ok 29 - stash file to directory # TODO known breakage
ok 30 - stash branch - no stashes on stack, stash-like argument
ok 31 - stash branch - stashes on stack, stash-like argument
ok 32 - stash show - stashes on stack, stash-like argument
ok 33 - stash show - no stashes on stack, stash-like argument
ok 34 - stash drop - fail early if specified stash is not a stash reference
ok 35 - stash pop - fail early if specified stash is not a stash reference
# still have 2 known breakage(s)
# passed all remaining 33 test(s)
1..35
