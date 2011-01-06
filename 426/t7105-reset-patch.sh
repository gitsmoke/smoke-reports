Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7105-reset-patch/.git/
expecting success: 
	mkdir dir &&
	echo parent > dir/foo &&
	echo dummy > bar &&
	git add dir &&
	git commit -m initial &&
	test_tick &&
	test_commit second dir/foo head &&
	set_and_save_state bar bar_work bar_index &&
	save_head

[master (root-commit) 10ceb17] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 dir/foo
[master 7f145aa] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	set_and_save_state dir/foo work work &&
	(echo n; echo n) | git reset -p &&
	verify_saved_state dir/foo &&
	verify_saved_state bar
diff --git a/bar b/bar
new file mode 100644
index 0000000..7780244
--- /dev/null
+++ b/bar
@@ -0,0 +1 @@
+bar_index
Unstage this hunk [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Unstage this hunk [y,n,q,a,d,/,e,?]? 

ok 2 - saying "n" does nothing

expecting success: 
	(echo n; echo y) | git reset -p &&
	verify_state dir/foo work head &&
	verify_saved_state bar

diff --git a/bar b/bar
new file mode 100644
index 0000000..7780244
--- /dev/null
+++ b/bar
@@ -0,0 +1 @@
+bar_index
Unstage this hunk [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Unstage this hunk [y,n,q,a,d,/,e,?]? 

ok 3 - git reset -p

expecting success: 
	(echo n; echo y) | git reset -p HEAD^ &&
	verify_state dir/foo work parent &&
	verify_saved_state bar

diff --git b/bar a/bar
index 7780244..0000000
--- b/bar
+++ /dev/null
deleted file mode 100644
@@ -1 +0,0 @@
-bar_index
Apply deletion to index [y,n,q,a,d,/,?]? 
diff --git b/dir/foo a/dir/foo
index 564b12f..9676f5b 100644
--- b/dir/foo
+++ a/dir/foo
@@ -1 +1 @@
-head
+parent
Apply this hunk to index [y,n,q,a,d,/,e,?]? 

ok 4 - git reset -p HEAD^

expecting success: 
	set_state dir/foo work work &&
	(echo y; echo n) | git reset -p dir &&
	verify_state dir/foo work head &&
	verify_saved_state bar

diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Unstage this hunk [y,n,q,a,d,/,e,?]? 

ok 5 - git reset -p dir

expecting success: 
	set_state dir/foo work work &&
	(echo y; echo n) | (cd dir && git reset -p -- foo) &&
	verify_state dir/foo work head &&
	verify_saved_state bar

diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Unstage this hunk [y,n,q,a,d,/,e,?]? 

ok 6 - git reset -p -- foo (inside dir)

expecting success: 
	(echo y; echo n) | git reset -p HEAD^ -- dir &&
	verify_state dir/foo work parent &&
	verify_saved_state bar

diff --git b/dir/foo a/dir/foo
index 564b12f..9676f5b 100644
--- b/dir/foo
+++ a/dir/foo
@@ -1 +1 @@
-head
+parent
Apply this hunk to index [y,n,q,a,d,/,e,?]? 

ok 7 - git reset -p HEAD^ -- dir

expecting success: 
	verify_saved_head


ok 8 - none of this moved HEAD

# passed all 8 test(s)
1..8
