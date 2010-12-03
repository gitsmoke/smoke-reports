ok 1 - setup
ok 2 - verify initial notes (x)
ok 3 - fail to merge empty notes ref into empty notes ref (z => y)
ok 4 - fail to merge into various non-notes refs
ok 5 - fail to merge various non-note-trees
ok 6 - merge notes into empty notes ref (x => y)
ok 7 - merge empty notes ref (z => y)
ok 8 - change notes on other notes ref (y)
ok 9 - merge previous notes commit (y^ => y) => No-op
ok 10 - verify changed notes on other notes ref (y)
ok 11 - verify unchanged notes on original notes ref (x)
ok 12 - merge original notes (x) into changed notes (y) => No-op
ok 13 - merge changed (y) into original (x) => Fast-forward
ok 14 - merge empty notes ref (z => y)
ok 15 - change notes on other notes ref (y)
ok 16 - change notes on notes ref (x)
ok 17 - merge y into x => Non-conflicting 3-way merge
ok 18 - create notes on new, separate notes ref (w)
ok 19 - merge w into x => Non-conflicting history-less merge
# passed all 19 test(s)
1..19
