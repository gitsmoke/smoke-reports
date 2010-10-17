ok 1 - setup
ok 2 - verify initial notes (x)
ok 3 - merge notes into empty notes ref (x => y)
ok 4 - change notes on other notes ref (y)
ok 5 - verify changed notes on other notes ref (y)
ok 6 - verify unchanged notes on original notes ref (x)
ok 7 - merge original notes (x) into changed notes (y) => No-op
ok 8 - merge changed (y) into original (x) => Fast-forward
ok 9 - merge empty notes ref (z => y)
ok 10 - change notes on other notes ref (y)
ok 11 - change notes on notes ref (x)
ok 12 - merge y into x => Non-conflicting 3-way merge
ok 13 - create notes on new, separate notes ref (w)
ok 14 - merge w into x => Non-conflicting history-less merge
# passed all 14 test(s)
1..14
