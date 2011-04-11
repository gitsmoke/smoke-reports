ok 1 - setup
ok 2 - saying "n" does nothing
ok 3 - git checkout -p
ok 4 - git checkout -p with staged changes
ok 5 - git checkout -p HEAD with NO staged changes: abort
ok 6 - git checkout -p HEAD with NO staged changes: apply
ok 7 - git checkout -p HEAD with change already staged
ok 8 - git checkout -p HEAD^
ok 9 - git checkout -p handles deletion
ok 10 - path limiting works: dir
ok 11 - path limiting works: -- dir
ok 12 - path limiting works: HEAD^ -- dir
ok 13 - path limiting works: foo inside dir
ok 14 - none of this moved HEAD
# passed all 14 test(s)
1..14
