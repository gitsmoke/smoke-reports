ok 1 - push  (invalid)
ok 2 - push :
ok 3 - push :: (invalid)
ok 4 - push +:
ok 5 - fetch 
ok 6 - fetch :
ok 7 - fetch :: (invalid)
ok 8 - push refs/heads/*:refs/remotes/frotz/*
ok 9 - push refs/heads/*:refs/remotes/frotz (invalid)
ok 10 - push refs/heads:refs/remotes/frotz/* (invalid)
ok 11 - push refs/heads/master:refs/remotes/frotz/xyzzy
ok 12 - fetch refs/heads/*:refs/remotes/frotz/*
ok 13 - fetch refs/heads/*:refs/remotes/frotz (invalid)
ok 14 - fetch refs/heads:refs/remotes/frotz/* (invalid)
ok 15 - fetch refs/heads/master:refs/remotes/frotz/xyzzy
ok 16 - fetch refs/heads/master::refs/remotes/frotz/xyzzy (invalid)
ok 17 - fetch refs/heads/maste :refs/remotes/frotz/xyzzy (invalid)
ok 18 - push master~1:refs/remotes/frotz/backup
ok 19 - fetch master~1:refs/remotes/frotz/backup (invalid)
ok 20 - push HEAD~4:refs/remotes/frotz/new
ok 21 - fetch HEAD~4:refs/remotes/frotz/new (invalid)
ok 22 - push HEAD
ok 23 - fetch HEAD
ok 24 - push refs/heads/ nitfol (invalid)
ok 25 - fetch refs/heads/ nitfol (invalid)
ok 26 - push HEAD: (invalid)
ok 27 - fetch HEAD:
ok 28 - push refs/heads/ nitfol: (invalid)
ok 29 - fetch refs/heads/ nitfol: (invalid)
ok 30 - push :refs/remotes/frotz/deleteme
ok 31 - fetch :refs/remotes/frotz/HEAD-to-me
ok 32 - push :refs/remotes/frotz/delete me (invalid)
ok 33 - fetch :refs/remotes/frotz/HEAD to me (invalid)
ok 34 - fetch refs/heads/*/for-linus:refs/remotes/mine/*-blah (invalid)
ok 35 - push refs/heads/*/for-linus:refs/remotes/mine/*-blah (invalid)
ok 36 - fetch refs/heads*/for-linus:refs/remotes/mine/* (invalid)
ok 37 - push refs/heads*/for-linus:refs/remotes/mine/* (invalid)
ok 38 - fetch refs/heads/*/*/for-linus:refs/remotes/mine/* (invalid)
ok 39 - push refs/heads/*/*/for-linus:refs/remotes/mine/* (invalid)
ok 40 - fetch refs/heads/*/for-linus:refs/remotes/mine/*
ok 41 - push refs/heads/*/for-linus:refs/remotes/mine/*
# passed all 41 test(s)
1..41
