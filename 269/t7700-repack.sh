ok 1 - objects in packs marked .keep are not repacked
ok 2 - loose objects in alternate ODB are not repacked
ok 3 - packed obs in alt ODB are repacked even when local repo is packless
ok 4 - packed obs in alt ODB are repacked when local repo has packs
ok 5 - packed obs in alternate ODB kept pack are repacked
ok 6 - packed unreachable obs in alternate ODB are not loosened
ok 7 - local packed unreachable obs that exist in alternate ODB are not loosened
ok 8 - objects made unreachable by grafts only are kept
# passed all 8 test(s)
1..8
