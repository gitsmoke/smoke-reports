ok 1 - shared = 0400 (faulty permission u-w)
ok 2 - shared=1 does not clear bits preset by umask 002
ok 3 - shared=1 does not clear bits preset by umask 022
ok 4 - shared=all
ok 5 - update-server-info honors core.sharedRepository
ok 6 - shared = 0660 (r--r-----) ro
ok 7 - shared = 0660 (rw-rw----) rw
ok 8 - shared = 0640 (r--r-----) ro
ok 9 - shared = 0640 (rw-r-----) rw
ok 10 - shared = 0600 (r--------) ro
ok 11 - shared = 0600 (rw-------) rw
ok 12 - shared = 0666 (r--r--r--) ro
ok 13 - shared = 0666 (rw-rw-rw-) rw
ok 14 - shared = 0664 (r--r--r--) ro
ok 15 - shared = 0664 (rw-rw-r--) rw
ok 16 - git reflog expire honors core.sharedRepository
ok 17 - forced modes
# passed all 17 test(s)
1..17
