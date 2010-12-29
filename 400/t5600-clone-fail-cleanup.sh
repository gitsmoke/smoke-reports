Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5600-clone-fail-cleanup/.git/
expecting success: test_must_fail git clone foo bar
Cloning into bar

ok 1 - clone of non-existent source should fail

expecting success: ! test -d bar

ok 2 - failed clone should not leave a directory

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5600-clone-fail-cleanup/foo/.git/
expecting success: test_must_fail git clone ../foo baz
Cloning into baz

ok 3 - clone of non-existent (relative to $PWD) source should fail

expecting success: git clone foo bar
Cloning into bar
done.

ok 4 - clone should work now that source exists

expecting success: cd bar

ok 5 - successful clone must leave the directory

# passed all 5 test(s)
1..5
