Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4206-log-follow-harder-copies/.git/
expecting success: git add path0 &&
     git commit -m "Add path0"
[master (root-commit) 514e7c9] Add path0
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 path0

ok 1 - add a file path0 and commit.
expecting success: git add path0 &&
     git commit -m "Change path0"
[master f9d45f7] Change path0
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 3 deletions(-)

ok 2 - Change path0.

expecting success: git add path1 &&
     git commit -m "Copy path1 from path0"
[master c29a1ba] Copy path1 from path0
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 path1

ok 3 - copy path0 to path1.

expecting success: git log --follow --name-status --pretty="format:%s"  path1 > current

ok 4 - find the copy path0 -> path1 harder
expecting success: compare_diff_patch current expected

ok 5 - validate the output.

# passed all 5 test(s)
1..5
