Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7507-commit-verbose/.git/
expecting success: 
	echo content >file &&
	git add file &&
	git commit -F message
[master (root-commit) ab031bc] subject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup
expecting success: 
	git commit --amend -v
diff --git a/file b/file
[master ab031bc] subject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 2 - initial commit shows verbose diff

expecting success: 
	echo content modified >file &&
	git add file &&
	git commit -F message
[master dd13d71] subject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - second commit

expecting success: 
	git commit --amend -v &&
	check_message message
diff --git a/file b/file
[master dd13d71] subject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 4 - verbose diff is stripped out
expecting success: 
	git config diff.mnemonicprefix true &&
	git commit --amend -v &&
	check_message message
diff --git c/file i/file
[master dd13d71] subject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - verbose diff is stripped out (mnemonicprefix)
expecting success: 
	git commit --amend -F diff &&
	check_message diff
[master 71f0ced] This is an example commit message that contains a diff.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - diff in message is retained without -v
checking known breakage: 
	git commit --amend -F diff -v &&
	check_message diff
[master 6f8ef7f] This is an example commit message that contains a diff.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
--- diff	2010-12-30 04:02:52.000000000 +0000
+++ actual	2010-12-30 04:02:52.000000000 +0000
@@ -1,9 +1,2 @@
 This is an example commit message that contains a diff.
 
-diff --git c/file i/file
-new file mode 100644
-index 0000000..f95c11d
---- /dev/null
-+++ i/file
-@@ -0,0 +1 @@
-+this is some content

not ok 7 - diff in message is retained with -v # TODO known breakage

# still have 1 known breakage(s)
# passed all remaining 6 test(s)
1..7
