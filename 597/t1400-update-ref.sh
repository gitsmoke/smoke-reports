ok 1 - setup
ok 2 - create refs/heads/master
ok 3 - create refs/heads/master
ok 4 - fail to delete refs/heads/master with stale ref
ok 5 - delete refs/heads/master
ok 6 - delete refs/heads/master without oldvalue verification
ok 7 - fail to create refs/heads/gu/fixes
ok 8 - create refs/heads/master (by HEAD)
ok 9 - create refs/heads/master (by HEAD)
ok 10 - fail to delete refs/heads/master (by HEAD) with stale ref
ok 11 - delete refs/heads/master (by HEAD)
ok 12 - delete symref without dereference
ok 13 - delete symref without dereference when the referred ref is packed
ok 14 - (not) create HEAD with old sha1
ok 15 - (not) prior created .git/refs/heads/master
ok 16 - create HEAD
ok 17 - (not) change HEAD with wrong SHA1
ok 18 - (not) changed .git/refs/heads/master
ok 19 - create refs/heads/master (logged by touch)
ok 20 - update refs/heads/master (logged by touch)
ok 21 - set refs/heads/master (logged by touch)
ok 22 - verifying refs/heads/master's log
ok 23 - enable core.logAllRefUpdates
ok 24 - create refs/heads/master (logged by config)
ok 25 - update refs/heads/master (logged by config)
ok 26 - set refs/heads/master (logged by config)
ok 27 - verifying refs/heads/master's log
ok 28 - Query "master@{May 25 2005}" (before history)
ok 29 - Query master@{2005-05-25} (before history)
ok 30 - Query "master@{May 26 2005 23:31:59}" (1 second before history)
ok 31 - Query "master@{May 26 2005 23:32:00}" (exactly history start)
ok 32 - Query "master@{May 26 2005 23:32:30}" (first non-creation change)
ok 33 - Query "master@{2005-05-26 23:33:01}" (middle of history with gap)
ok 34 - Query "master@{2005-05-26 23:38:00}" (middle of history)
ok 35 - Query "master@{2005-05-26 23:43:00}" (exact end of history)
ok 36 - Query "master@{2005-05-28}" (past end of history)
ok 37 - creating initial files
ok 38 - git commit logged updates
ok 39 - git cat-file blob master:F (expect OTHER)
ok 40 - git cat-file blob master@{2005-05-26 23:30}:F (expect TEST)
ok 41 - git cat-file blob master@{2005-05-26 23:42}:F (expect OTHER)
# passed all 41 test(s)
1..41
