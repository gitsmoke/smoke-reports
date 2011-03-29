ok 1 - setup
ok 2 - checkout branch does not detach
ok 3 - checkout tag detaches
ok 4 - checkout branch by full name detaches
ok 5 - checkout non-ref detaches
ok 6 - checkout ref^0 detaches
ok 7 - checkout --detach detaches
ok 8 - checkout --detach without branch name
ok 9 - checkout --detach errors out for non-commit
ok 10 - checkout --detach errors out for extra argument
ok 11 - checkout --detached and -b are incompatible
ok 12 - checkout --detach moves HEAD
ok 13 - checkout warns on orphan commits
ok 14 - checkout does not warn leaving ref tip
ok 15 - checkout does not warn leaving reachable commit
ok 16 - tracking count is accurate after orphan check
# passed all 16 test(s)
1..16
