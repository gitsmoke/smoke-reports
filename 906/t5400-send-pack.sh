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
ok 14 - verify that limit-commit-count capability is not advertised by default
ok 15 - verify that receive.commitCountLimit triggers limit-commit-count capability
ok 16 - deny pushing when receive.commitCountLimit is exceeded
ok 17 - repeated push failure proves that objects were not stored remotely
ok 18 - increase receive.commitCountLimit
ok 19 - push is allowed when commit limit is not exceeded
ok 20 - verify that limit-pack-size capability is not advertised by default
ok 21 - verify that receive.packSizeLimit triggers limit-pack-size capability
ok 22 - deny pushing when receive.packSizeLimit is exceeded
ok 23 - repeated push failure proves that objects were not stored remotely
ok 24 - increase receive.packSizeLimit
ok 25 - push is allowed when pack size is not exceeded
ok 26 - deny pushing when receive.objectCountLimit is exceeded
ok 27 - repeated push failure proves that objects were not stored remotely
ok 28 - push is allowed when object limit is increased
# passed all 28 test(s)
1..28
