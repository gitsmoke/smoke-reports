ok 1 - initialize repo
ok 2 - commit change from svn side
ok 3 - commit conflicting change from git
ok 4 - commit complementing change from git
ok 5 - dcommit fails to commit because of conflict
ok 6 - dcommit does the svn equivalent of an index merge
ok 7 - commit another change from svn side
ok 8 - multiple dcommit from git svn will not clobber svn
ok 9 - check that rebase really failed
ok 10 - resolve, continue the rebase and dcommit
# passed all 10 test(s)
1..10
