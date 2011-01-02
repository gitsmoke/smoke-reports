Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7101-reset/.git/
expecting success: mkdir path0 &&
     cp "$TEST_DIRECTORY"/../COPYING path0/COPYING &&
     git add path0/COPYING &&
     git commit -m add -a
[master (root-commit) 0c36f52] add
 Author: A U Thor <author@example.com>
 1 files changed, 360 insertions(+), 0 deletions(-)
 create mode 100644 path0/COPYING

ok 1 - creating initial files

expecting success: mkdir path1 &&
     mkdir path1/path2 &&
     cp "$TEST_DIRECTORY"/../COPYING path1/path2/COPYING &&
     cp "$TEST_DIRECTORY"/../COPYING path1/COPYING &&
     cp "$TEST_DIRECTORY"/../COPYING COPYING &&
     cp "$TEST_DIRECTORY"/../COPYING path0/COPYING-TOO &&
     git add path1/path2/COPYING &&
     git add path1/COPYING &&
     git add COPYING &&
     git add path0/COPYING-TOO &&
     git commit -m change -a
[master 02320fe] change
 Author: A U Thor <author@example.com>
 4 files changed, 1440 insertions(+), 0 deletions(-)
 create mode 100644 COPYING
 create mode 100644 path0/COPYING-TOO
 create mode 100644 path1/COPYING
 create mode 100644 path1/path2/COPYING

ok 2 - creating second files

expecting success: git reset --hard HEAD^
HEAD is now at 0c36f52 add

ok 3 - resetting tree HEAD^

expecting success: test -d path0 &&
     test -f path0/COPYING

ok 4 - checking initial files exist after rewind

expecting success: ! test -f path1/path2/COPYING

ok 5 - checking lack of path1/path2/COPYING

expecting success: ! test -f path1/COPYING

ok 6 - checking lack of path1/COPYING

expecting success: ! test -f COPYING

ok 7 - checking lack of COPYING

expecting success: ! test -f path0/COPYING-TOO

ok 8 - checking checking lack of path1/COPYING-TOO

expecting success: ! test -d path1/path2

ok 9 - checking lack of path1/path2

expecting success: ! test -d path1

ok 10 - checking lack of path1

# passed all 10 test(s)
1..10
