ok 1 - stash some dirty working directory
ok 2 - parents of stash
ok 3 - applying bogus stash does nothing
ok 4 - apply does not need clean working directory
ok 5 - apply does not clobber working directory changes
ok 6 - apply stashed changes
ok 7 - apply stashed changes (including index)
ok 8 - unstashing in a subdirectory
ok 9 - drop top stash
ok 10 - drop middle stash
ok 11 - stash pop
ok 12 - stash branch
ok 13 - apply -q is quiet
ok 14 - save -q is quiet
ok 15 - pop -q is quiet
ok 16 - pop -q --index works and is quiet
ok 17 - drop -q is quiet
ok 18 - stash -k
ok 19 - stash --invalid-option
ok 20 - stash an added file
ok 21 - stash rm then recreate
ok 22 - stash rm and ignore
ok 23 - stash rm and ignore (stage .gitignore)
ok 24 - stash file to symlink
ok 25 - stash file to symlink (stage rm)
ok 26 - stash file to symlink (full stage)
ok 27 - stash symlink to file
ok 28 - stash symlink to file (stage rm)
ok 29 - stash symlink to file (full stage)
not ok 30 - stash directory to file # TODO known breakage
not ok 31 - stash file to directory # TODO known breakage
ok 32 - stash branch - no stashes on stack, stash-like argument
ok 33 - stash branch - stashes on stack, stash-like argument
ok 34 - stash show - stashes on stack, stash-like argument
ok 35 - stash show -p - stashes on stack, stash-like argument
ok 36 - stash show - no stashes on stack, stash-like argument
ok 37 - stash show -p - no stashes on stack, stash-like argument
ok 38 - stash drop - fail early if specified stash is not a stash reference
ok 39 - stash pop - fail early if specified stash is not a stash reference
ok 40 - ref with non-existant reflog
ok 41 - invalid ref of the form stash@{n}, n >= N
ok 42 - stash branch should not drop the stash if the branch exists
ok 43 - stash apply shows status same as git status (relative to current directory)
# still have 2 known breakage(s)
# passed all remaining 41 test(s)
1..43
