ok 1 - setup
ok 2 - pack the source repository
ok 3 - pack the destination repository
ok 4 - refuse pushing rewound head without --force
ok 5 - push can be used to delete a ref
ok 6 - refuse deleting push with denyDeletes
ok 7 - cannot override denyDeletes with git -c send-pack
ok 8 - override denyDeletes with git -c receive-pack
ok 9 - denyNonFastforwards trumps --force
ok 10 - push --all excludes remote-tracking hierarchy
ok 11 - pushing explicit refspecs respects forcing
ok 12 - pushing wildcard refspecs respects forcing
ok 13 - deny pushing to delete current branch
# passed all 13 test(s)
1..13
