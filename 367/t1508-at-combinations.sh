ok 1 - setup
ok 2 - HEAD = new-two
ok 3 - @{1} = new-one
ok 4 - @{-1} = old-two
ok 5 - @{-1}@{1} = old-one
ok 6 - @{u} = upstream-two
ok 7 - @{u}@{1} = upstream-one
ok 8 - @{-1}@{u} = master-two
ok 9 - @{-1}@{u}@{1} = master-one
ok 10 - @{u}@{-1} is nonsensical
ok 11 - @{1}@{u} is nonsensical
# passed all 11 test(s)
1..11
