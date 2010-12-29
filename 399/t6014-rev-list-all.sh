Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6014-rev-list-all/.git/
expecting success: 

	commit one &&
	commit two &&
	git checkout HEAD^ &&
	commit detached
[master (root-commit) 86412ff] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 4931c53] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[detached HEAD 13d8fe0] detached
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	test 3 = $(git rev-list --all | wc -l)

ok 2 - rev-list --all lists detached HEAD

expecting success: 

	git gc &&
	git prune --expire=now &&
	git show HEAD
commit 13d8fe0bae4079d4dedb755a88319ddebda9a07b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:15:13 2005 -0700

    detached

diff --git a/foo b/foo
index 5626abf..9aa4e2b 100644
--- a/foo
+++ b/foo
@@ -1 +1 @@
-one
+detached

ok 3 - repack does not lose detached HEAD
# passed all 3 test(s)
1..3
