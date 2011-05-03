ok 1 - setup
ok 2 - failed cherry-pick does not advance HEAD
ok 3 - advice from failed cherry-pick
ok 4 - failed cherry-pick sets CHERRY_PICK_HEAD
ok 5 - successful cherry-pick does not set CHERRY_PICK_HEAD
ok 6 - cherry-pick --no-commit does not set CHERRY_PICK_HEAD
ok 7 - GIT_CHERRY_PICK_HELP suppresses CHERRY_PICK_HEAD
ok 8 - git reset clears CHERRY_PICK_HEAD
ok 9 - failed commit does not clear CHERRY_PICK_HEAD
ok 10 - cancelled commit does not clear CHERRY_PICK_HEAD
ok 11 - successful commit clears CHERRY_PICK_HEAD
ok 12 - failed cherry-pick produces dirty index
ok 13 - failed cherry-pick registers participants in index
ok 14 - failed cherry-pick describes conflict in work tree
ok 15 - diff3 -m style
ok 16 - revert also handles conflicts sanely
ok 17 - revert conflict, diff3 -m style
# passed all 17 test(s)
1..17
