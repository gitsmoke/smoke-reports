ok 1 - see what we expect
will test on a case insensitive filesystem
will test on a unicode corrupting filesystem
ok 2 - detection of case insensitive filesystem during repo init
ok 3 - detection of filesystem w/o symlink support during repo init
ok 4 - setup case tests
not ok 5 - rename (case change) # TODO known breakage
ok 6 - merge (case change) # TODO known breakage
not ok 7 - add (with different case) # TODO known breakage
ok 8 - setup unicode normalization tests
not ok 9 - rename (silent unicode normalization) # TODO known breakage
not ok 10 - merge (silent unicode normalization) # TODO known breakage
# fixed 1 known breakage(s)
# still have 4 known breakage(s)
# passed all remaining 6 test(s)
1..10
