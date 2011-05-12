ok 1 - setup
ok 2 - 1, 2, 3 - no carry forward
ok 3 - 4 - carry forward local addition.
ok 4 - 5 - carry forward local addition.
ok 5 - 6 - local addition already has the same.
ok 6 - 7 - local addition already has the same.
ok 7 - 8 - conflicting addition.
ok 8 - 9 - conflicting addition.
ok 9 - 10 - path removed.
ok 10 - 11 - dirty path removed.
ok 11 - 12 - unmatching local changes being removed.
ok 12 - 13 - unmatching local changes being removed.
ok 13 - 14 - unchanged in two heads.
ok 14 - 15 - unchanged in two heads.
ok 15 - 16 - conflicting local change.
ok 16 - 17 - conflicting local change.
ok 17 - 18 - local change already having a good result.
ok 18 - 19 - local change already having a good result, further modified.
ok 19 - 20 - no local change, use new tree.
ok 20 - 21 - no local change, dirty cache.
ok 21 - DF vs DF/DF case setup.
ok 22 - DF vs DF/DF case test.
ok 23 - -u is not allowed with -n
# passed all 23 test(s)
1..23
