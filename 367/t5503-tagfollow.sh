ok 1 - setup
ok 2 - setup expect
ok 3 - fetch A (new commit : 1 connection)
ok 4 - create tag T on A, create C on branch cat
ok 5 - setup expect
ok 6 - fetch C, T (new branch, tag : 1 connection)
ok 7 - create commits O, B, tag S on B
ok 8 - setup expect
ok 9 - fetch B, S (commit and tag : 1 connection)
ok 10 - setup expect
ok 11 - new clone fetch master and tags
# passed all 11 test(s)
1..11
