Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4113-apply-ending/.git/
expecting success: git update-index --add file
ok 1 - setup

expecting success: test_must_fail git apply --index test-patch
ok 2 - apply at the end
expecting success: test_must_fail git apply --index test-patch
ok 3 - apply at the beginning

# passed all 3 test(s)
1..3
