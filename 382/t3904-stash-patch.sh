Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3904-stash-patch/.git/
expecting success: 
	mkdir dir &&
	echo parent > dir/foo &&
	echo dummy > bar &&
	git add bar dir/foo &&
	git commit -m initial &&
	test_tick &&
	test_commit second dir/foo head &&
	echo index > dir/foo &&
	git add dir/foo &&
	set_and_save_state bar bar_work bar_index &&
	save_head
[master (root-commit) b064c42] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 dir/foo
[master 1378120] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	set_state dir/foo work index &&
	(echo n; echo n) | test_must_fail git stash save -p &&
	verify_state dir/foo work index &&
	verify_saved_state bar
diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Stash this hunk [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Stash this hunk [y,n,q,a,d,/,e,?]? 

ok 2 - saying "n" does nothing

expecting success: 
	(echo n; echo y) | git stash save -p &&
	verify_state dir/foo head index &&
	verify_saved_state bar &&
	git reset --hard &&
	git stash apply &&
	verify_state dir/foo work head &&
	verify_state bar dummy dummy

diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Stash this hunk [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Stash this hunk [y,n,q,a,d,/,e,?]? 
Saved working directory and index state WIP on master: 1378120 second
HEAD is now at 1378120 second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 9657bbbb9af23b5a9a629f66dd23b9c7cc5dfc00
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   dir/foo
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	_head
#	_index_bar
#	_worktree_bar
no changes added to commit (use "git add" and/or "git commit -a")

ok 3 - git stash -p

expecting success: 
	set_state dir/foo work index &&
	set_state bar bar_work bar_index &&
	(echo n; echo y) | git stash save -p --no-keep-index &&
	verify_state dir/foo head head &&
	verify_state bar bar_work dummy &&
	git reset --hard &&
	git stash apply --index &&
	verify_state dir/foo work index &&
	verify_state bar dummy bar_index

diff --git a/bar b/bar
index 421376d..8c999e6 100644
--- a/bar
+++ b/bar
@@ -1 +1 @@
-dummy
+bar_work
Stash this hunk [y,n,q,a,d,/,e,?]? 
diff --git a/dir/foo b/dir/foo
index 564b12f..b8f99f5 100644
--- a/dir/foo
+++ b/dir/foo
@@ -1 +1 @@
-head
+work
Stash this hunk [y,n,q,a,d,/,e,?]? 
Saved working directory and index state WIP on master: 1378120 second
Unstaged changes after reset:
M	bar
HEAD is now at 1378120 second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 9657bbbb9af23b5a9a629f66dd23b9c7cc5dfc00
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	modified:   bar
#	modified:   dir/foo
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   bar
#	modified:   dir/foo
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	_head
#	_index_bar
#	_worktree_bar

ok 4 - git stash -p --no-keep-index

expecting success: 
	verify_saved_head


ok 5 - none of this moved HEAD

# passed all 5 test(s)
1..5
