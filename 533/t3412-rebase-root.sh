ok 1 - prepare repository
ok 2 - rebase --root expects --onto
ok 3 - setup pre-rebase hook
ok 4 - rebase --root --onto <newbase>
ok 5 - pre-rebase got correct input (1)
ok 6 - rebase --root --onto <newbase> <branch>
ok 7 - pre-rebase got correct input (2)
ok 8 - rebase -i --root --onto <newbase>
ok 9 - pre-rebase got correct input (3)
ok 10 - rebase -i --root --onto <newbase> <branch>
ok 11 - pre-rebase got correct input (4)
ok 12 - rebase -i -p with linear history
ok 13 - pre-rebase got correct input (5)
ok 14 - set up merge history
ok 15 - rebase -i -p with merge
ok 16 - set up second root and merge
ok 17 - rebase -i -p with two roots
ok 18 - setup pre-rebase hook that fails
ok 19 - pre-rebase hook stops rebase
ok 20 - pre-rebase hook stops rebase -i
ok 21 - remove pre-rebase hook
ok 22 - set up a conflict
ok 23 - rebase --root with conflict (first part)
ok 24 - fix the conflict
ok 25 - rebase --root with conflict (second part)
ok 26 - rebase -i --root with conflict (first part)
ok 27 - fix the conflict
ok 28 - rebase -i --root with conflict (second part)
ok 29 - rebase -i -p --root with conflict (first part)
ok 30 - fix the conflict
ok 31 - rebase -i -p --root with conflict (second part)
# passed all 31 test(s)
1..31
