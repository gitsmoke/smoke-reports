ok 1 - stash some dirty working directory
ok 2 - parents of stash
ok 3 - applying bogus stash does nothing
ok 4 - apply needs clean working directory
ok 5 - apply stashed changes
ok 6 - apply stashed changes (including index)
ok 7 - unstashing in a subdirectory
ok 8 - drop top stash
ok 9 - drop middle stash
ok 10 - stash pop
ok 11 - stash branch
ok 12 - apply -q is quiet
ok 13 - save -q is quiet
ok 14 - pop -q is quiet
ok 15 - pop -q --index works and is quiet
ok 16 - drop -q is quiet
ok 17 - stash -k
ok 18 - stash --invalid-option
ok 19 - stash an added file
ok 20 - stash rm then recreate
ok 21 - stash rm and ignore
ok 22 - stash rm and ignore (stage .gitignore)
ok 23 - stash file to symlink
ok 24 - stash file to symlink (stage rm)
ok 25 - stash file to symlink (full stage)
ok 26 - stash symlink to file
ok 27 - stash symlink to file (stage rm)
ok 28 - stash symlink to file (full stage)
not ok 29 - stash directory to file # TODO known breakage
not ok 30 - stash file to directory # TODO known breakage
ok 31 - stash branch - no stashes on stack, stash-like argument
ok 32 - stash branch - stashes on stack, stash-like argument
ok 33 - stash show - stashes on stack, stash-like argument
ok 34 - stash show -p - stashes on stack, stash-like argument
ok 35 - stash show - no stashes on stack, stash-like argument
ok 36 - stash show -p - no stashes on stack, stash-like argument
ok 37 - stash drop - fail early if specified stash is not a stash reference
ok 38 - stash pop - fail early if specified stash is not a stash reference
ok 39 - ref with non-existant reflog
ok 40 - invalid ref of the form stash@{n}, n >= N
ok 41 - stash branch should not drop the stash if the branch exists
ok 42 - stash apply shows status same as git status (relative to current directory)
# still have 2 known breakage(s)
# passed all remaining 40 test(s)
1..42
