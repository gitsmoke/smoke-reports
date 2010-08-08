ok 1 - setup
ok 2 - git grep ina a
ok 3 - git grep -ah ina a
ok 4 - git grep -I ina a
ok 5 - git grep -c ina a
ok 6 - git grep -l ina a
ok 7 - git grep -L bar a
ok 8 - git grep -q ina a
ok 9 - git grep -F ile a
ok 10 - git grep -Fi iLE a
ok 11 - git grep ile a # TODO known breakage
ok 12 - git grep .fi a # TODO known breakage
ok 13 - git grep -F y<NUL>f a
ok 14 - git grep -F y<NUL>x a
ok 15 - git grep -Fi Y<NUL>f a
not ok 16 - git grep -Fi Y<NUL>x a # TODO known breakage
ok 17 - git grep y<NUL>f a
not ok 18 - git grep y<NUL>x a # TODO known breakage
# fixed 2 known breakage(s)
# still have 2 known breakage(s)
# passed all remaining 16 test(s)
1..18
