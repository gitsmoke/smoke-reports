ok 1 - setup commits
ok 2 - setup merge base (x)
ok 3 - verify state of merge base (x)
ok 4 - setup local branch (y)
ok 5 - verify state of local branch (y)
ok 6 - setup remote branch (z)
ok 7 - verify state of remote branch (z)
ok 8 - merge z into y with invalid strategy => Fail/No changes
ok 9 - merge z into y with "ours" strategy => Non-conflicting 3-way merge
ok 10 - reset to pre-merge state (y)
ok 11 - merge z into y with "theirs" strategy => Non-conflicting 3-way merge
ok 12 - reset to pre-merge state (y)
ok 13 - merge z into y with "union" strategy => Non-conflicting 3-way merge
ok 14 - reset to pre-merge state (y)
ok 15 - merge y into z with "union" strategy => Non-conflicting 3-way merge
ok 16 - reset to pre-merge state (z)
ok 17 - merge y into z with "cat_sort_uniq" strategy => Non-conflicting 3-way merge
# passed all 17 test(s)
1..17
