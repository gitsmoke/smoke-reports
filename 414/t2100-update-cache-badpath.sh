Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2100-update-cache-badpath/.git/
expecting success: git update-index --add -- path0 path1 path2/file2 path3/file3

ok 1 - git update-index --add to add various paths.

expecting success: test_must_fail git update-index --add -- path0/file0

ok 2 - git update-index to add conflicting path path0/file0 should fail.
expecting success: test_must_fail git update-index --add -- path1/file1
ok 3 - git update-index to add conflicting path path1/file1 should fail.

expecting success: test_must_fail git update-index --add -- path2

ok 4 - git update-index to add conflicting path path2 should fail.

expecting success: test_must_fail git update-index --add -- path3

ok 5 - git update-index to add conflicting path path3 should fail.

# passed all 5 test(s)
1..5
