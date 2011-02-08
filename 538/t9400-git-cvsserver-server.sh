ok 1 - setup
ok 2 - basic checkout
ok 3 - pserver authentication
ok 4 - pserver authentication failure (non-anonymous user)
ok 5 - pserver authentication success (non-anonymous user with password)
ok 6 - pserver authentication (login)
ok 7 - pserver authentication failure (login/non-anonymous user)
ok 8 - req_Root failure (relative pathname)
ok 9 - req_Root failure (conflicting roots)
ok 10 - req_Root (strict paths)
ok 11 - req_Root failure (strict-paths)
ok 12 - req_Root (w/o strict-paths)
ok 13 - req_Root failure (w/o strict-paths)
ok 14 - req_Root (base-path)
ok 15 - req_Root failure (base-path)
ok 16 - req_Root (export-all)
ok 17 - req_Root failure (export-all w/o whitelist)
ok 18 - req_Root (everything together)
ok 19 - gitcvs.enabled = false
ok 20 - gitcvs.ext.enabled = true
ok 21 - gitcvs.ext.enabled = false
ok 22 - gitcvs.dbname
ok 23 - gitcvs.ext.dbname
ok 24 - cvs update (create new file)
ok 25 - cvs update (update existing file)
not ok 26 - cvs update w/o -d doesn't create subdir (TODO) # TODO known breakage
ok 27 - cvs update (subdirectories)
ok 28 - cvs update (delete file)
ok 29 - cvs update (re-add deleted file)
ok 30 - cvs update (merge)
ok 31 - cvs update (conflict merge)
ok 32 - cvs update (-C)
ok 33 - cvs update (merge no-op)
ok 34 - cvs update (-p)
ok 35 - cvs update (module list supports packed refs)
ok 36 - cvs status
ok 37 - cvs status (nonrecursive)
ok 38 - cvs status (no subdirs in header)
ok 39 - cvs co -c (shows module database)
ok 40 - cvs annotate
# still have 1 known breakage(s)
# passed all remaining 39 test(s)
1..40
