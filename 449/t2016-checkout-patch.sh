Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2016-checkout-patch/.git/
expecting success: 
	mkdir dir &&
	echo parent > dir/foo &&
	echo dummy > bar &&
	git add bar dir/foo &&
	git commit -m initial &&
	test_tick &&
	test_commit second dir/foo head &&
	set_and_save_state bar bar_work bar_index &&
	save_head
[master (root-commit) 2da05a0] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 dir/foo
[master 5a82990] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
	set_and_save_state dir/foo work head &&
	(echo n; echo n) | git checkout -p &&
	verify_saved_state bar &&
	verify_saved_state dir/foo
diff --git a/bar b/bar
index 7780244..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-bar_index
+bar_work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 

ok 2 - saying "n" does nothing

expecting success: 
	(echo n; echo y) | git checkout -p &&
	verify_saved_state bar &&
	verify_state dir/foo head head
diff --git a/bar b/bar
index 7780244..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-bar_index
+bar_work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 

ok 3 - git checkout -p

expecting success: 
	set_state dir/foo work index &&
	(echo n; echo y) | git checkout -p &&
	verify_saved_state bar &&
	verify_state dir/foo index index
diff --git a/bar b/bar
index 7780244..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-bar_index
+bar_work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 9015a7a..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-index
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 

ok 4 - git checkout -p with staged changes

expecting success: 
	set_and_save_state dir/foo work head &&
	(echo n; echo y; echo n) | git checkout -p HEAD &&
	verify_saved_state bar &&
	verify_saved_state dir/foo

diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? The selected hunks do not apply to the index!
Apply them to the worktree anyway? Nothing was applied.


ok 5 - git checkout -p HEAD with NO staged changes: abort

expecting success: 
	(echo n; echo y; echo y) | git checkout -p HEAD &&
	verify_saved_state bar &&
	verify_state dir/foo head head

diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? The selected hunks do not apply to the index!
Apply them to the worktree anyway? 

ok 6 - git checkout -p HEAD with NO staged changes: apply

expecting success: 
	set_state dir/foo index index &&
	# the third n is to get out in case it mistakenly does not apply
	(echo n; echo y; echo n) | git checkout -p HEAD &&
	verify_saved_state bar &&
	verify_state dir/foo head head

diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..9015a7a 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+index
Discard this hunk from index and worktree [y,n,q,a,d,/,e,?]? 

ok 7 - git checkout -p HEAD with change already staged

expecting success: 
	# the third n is to get out in case it mistakenly does not apply
	(echo n; echo y; echo n) | git checkout -p HEAD^ &&
	verify_saved_state bar &&
	verify_state dir/foo parent parent
diff --git b/bar a/bar
index 8c999e6..421376d 100644
--- b/bar
+++ a/bar
@@ -1 +1 @@
-bar_work
+dummy
Apply this hunk to index and worktree [y,n,q,a,d,/,e,?]? 
diff --git b/dir/foo a/dir/foo
index 564b12f..9676f5b 100644
--- b/dir/foo
+++ a/dir/foo
@@ -1 +1 @@
-head
+parent
Apply this hunk to index and worktree [y,n,q,a,d,/,e,?]? 

ok 8 - git checkout -p HEAD^

expecting success: 
	set_state dir/foo work index &&
	rm dir/foo &&
	(echo n; echo y) | git checkout -p &&
	verify_saved_state bar &&
	verify_state dir/foo index index
diff --git a/bar b/bar
index 7780244..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-bar_index
+bar_work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 9015a7a..0000000
--- a/dir/foo
+++ /dev/null
deleted file mode 100644
@@ -1 +0,0 @@
-index
Discard deletion from worktree [y,n,q,a,d,/,?]? 

ok 9 - git checkout -p handles deletion

expecting success: 
	set_state dir/foo work head &&
	(echo y; echo n) | git checkout -p dir &&
	verify_saved_state bar &&
	verify_state dir/foo head head
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
ok 10 - path limiting works: dir
expecting success: 
	set_state dir/foo work head &&
	(echo y; echo n) | git checkout -p -- dir &&
	verify_saved_state bar &&
	verify_state dir/foo head head
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
ok 11 - path limiting works: -- dir
expecting success: 
	# the third n is to get out in case it mistakenly does not apply
	(echo y; echo n; echo n) | git checkout -p HEAD^ -- dir &&
	verify_saved_state bar &&
	verify_state dir/foo parent parent
diff --git b/dir/foo a/dir/foo
index 564b12f..9676f5b 100644
--- b/dir/foo
+++ a/dir/foo
@@ -1 +1 @@
-head
+parent
Apply this hunk to index and worktree [y,n,q,a,d,/,e,?]? 

ok 12 - path limiting works: HEAD^ -- dir

expecting success: 
	set_state dir/foo work head &&
	# the third n is to get out in case it mistakenly does not apply
	(echo y; echo n; echo n) | (cd dir && git checkout -p foo) &&
	verify_saved_state bar &&
	verify_state dir/foo head head
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Discard this hunk from worktree [y,n,q,a,d,/,e,?]? 
ok 13 - path limiting works: foo inside dir
expecting success: 
	verify_saved_head

ok 14 - none of this moved HEAD

# passed all 14 test(s)
1..14
