ok 1 - setup commits
ok 2 - setup merge base (x)
ok 3 - setup local branch (y)
ok 4 - setup remote branch (z)
ok 5 - merge z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
ok 6 - change notes in z
ok 7 - cannot do merge w/conflicts when previous merge is unfinished
ok 8 - setup unrelated notes ref (w)
ok 9 - can do merge without conflicts even if previous merge is unfinished (x => w)
ok 10 - finalize conflicting merge (z => m)
ok 11 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
ok 12 - abort notes merge
ok 13 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
ok 14 - add + remove notes in finalized merge (z => m)
ok 15 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
ok 16 - reset notes ref m to somewhere else (w)
ok 17 - fail to finalize conflicting merge if underlying ref has moved in the meantime (m != NOTES_MERGE_PARTIAL^1)
ok 18 - resolve situation by aborting the notes merge
# passed all 18 test(s)
1..18
