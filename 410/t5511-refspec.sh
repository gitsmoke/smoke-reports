Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5511-refspec/.git/
expecting success: test_must_fail git ls-remote frotz

ok 1 - push  (invalid)

expecting success: git ls-remote frotz

ok 2 - push :
expecting success: test_must_fail git ls-remote frotz
ok 3 - push :: (invalid)
expecting success: git ls-remote frotz

ok 4 - push +:
expecting success: git ls-remote frotz
ok 5 - fetch 
expecting success: git ls-remote frotz
ok 6 - fetch :
expecting success: test_must_fail git ls-remote frotz
ok 7 - fetch :: (invalid)
expecting success: git ls-remote frotz

ok 8 - push refs/heads/*:refs/remotes/frotz/*
expecting success: test_must_fail git ls-remote frotz

ok 9 - push refs/heads/*:refs/remotes/frotz (invalid)
expecting success: test_must_fail git ls-remote frotz

ok 10 - push refs/heads:refs/remotes/frotz/* (invalid)
expecting success: git ls-remote frotz
ok 11 - push refs/heads/master:refs/remotes/frotz/xyzzy
expecting success: git ls-remote frotz
ok 12 - fetch refs/heads/*:refs/remotes/frotz/*
expecting success: test_must_fail git ls-remote frotz
ok 13 - fetch refs/heads/*:refs/remotes/frotz (invalid)
expecting success: test_must_fail git ls-remote frotz

ok 14 - fetch refs/heads:refs/remotes/frotz/* (invalid)
expecting success: git ls-remote frotz

ok 15 - fetch refs/heads/master:refs/remotes/frotz/xyzzy
expecting success: test_must_fail git ls-remote frotz

ok 16 - fetch refs/heads/master::refs/remotes/frotz/xyzzy (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 17 - fetch refs/heads/maste :refs/remotes/frotz/xyzzy (invalid)

expecting success: git ls-remote frotz

ok 18 - push master~1:refs/remotes/frotz/backup
expecting success: test_must_fail git ls-remote frotz

ok 19 - fetch master~1:refs/remotes/frotz/backup (invalid)
expecting success: git ls-remote frotz

ok 20 - push HEAD~4:refs/remotes/frotz/new
expecting success: test_must_fail git ls-remote frotz
ok 21 - fetch HEAD~4:refs/remotes/frotz/new (invalid)
expecting success: git ls-remote frotz

ok 22 - push HEAD
expecting success: git ls-remote frotz

ok 23 - fetch HEAD
expecting success: test_must_fail git ls-remote frotz
ok 24 - push refs/heads/ nitfol (invalid)
expecting success: test_must_fail git ls-remote frotz

ok 25 - fetch refs/heads/ nitfol (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 26 - push HEAD: (invalid)
expecting success: git ls-remote frotz

ok 27 - fetch HEAD:
expecting success: test_must_fail git ls-remote frotz
ok 28 - push refs/heads/ nitfol: (invalid)
expecting success: test_must_fail git ls-remote frotz
ok 29 - fetch refs/heads/ nitfol: (invalid)
expecting success: git ls-remote frotz

ok 30 - push :refs/remotes/frotz/deleteme
expecting success: git ls-remote frotz

ok 31 - fetch :refs/remotes/frotz/HEAD-to-me
expecting success: test_must_fail git ls-remote frotz

ok 32 - push :refs/remotes/frotz/delete me (invalid)
expecting success: test_must_fail git ls-remote frotz
ok 33 - fetch :refs/remotes/frotz/HEAD to me (invalid)
expecting success: test_must_fail git ls-remote frotz

ok 34 - fetch refs/heads/*/for-linus:refs/remotes/mine/*-blah (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 35 - push refs/heads/*/for-linus:refs/remotes/mine/*-blah (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 36 - fetch refs/heads*/for-linus:refs/remotes/mine/* (invalid)
expecting success: test_must_fail git ls-remote frotz

ok 37 - push refs/heads*/for-linus:refs/remotes/mine/* (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 38 - fetch refs/heads/*/*/for-linus:refs/remotes/mine/* (invalid)

expecting success: test_must_fail git ls-remote frotz

ok 39 - push refs/heads/*/*/for-linus:refs/remotes/mine/* (invalid)

expecting success: git ls-remote frotz
ok 40 - fetch refs/heads/*/for-linus:refs/remotes/mine/*
expecting success: git ls-remote frotz

ok 41 - push refs/heads/*/for-linus:refs/remotes/mine/*

# passed all 41 test(s)
1..41
