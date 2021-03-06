ok 1 - setup
ok 2 - checkout -b to a new branch, set to HEAD
ok 3 - checkout -b to a new branch, set to an explicit ref
ok 4 - checkout -b to a new branch with unmergeable changes fails
ok 5 - checkout -f -b to a new branch with unmergeable changes discards changes
ok 6 - checkout -b to a new branch preserves mergeable changes
ok 7 - checkout -f -b to a new branch with mergeable changes discards changes
ok 8 - checkout -b to an existing branch fails
ok 9 - checkout -B to an existing branch resets branch to HEAD
ok 10 - checkout -B to an existing branch from detached HEAD resets branch to HEAD
ok 11 - checkout -B to an existing branch with an explicit ref resets branch to that ref
ok 12 - checkout -B to an existing branch with unmergeable changes fails
ok 13 - checkout -f -B to an existing branch with unmergeable changes discards changes
ok 14 - checkout -B to an existing branch preserves mergeable changes
ok 15 - checkout -f -B to an existing branch with mergeable changes discards changes
ok 16 - checkout -b <describe>
# passed all 16 test(s)
1..16
