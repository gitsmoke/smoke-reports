Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4040-whitespace-status/.git/
expecting success: 
	mkdir a b &&
	echo >c &&
	echo >a/d &&
	echo >b/e &&
	git add . &&
	test_tick &&
	git commit -m initial &&
	echo " " >a/d &&
	test_tick &&
	git commit -a -m second &&
	echo "  " >a/d &&
	echo " " >b/e &&
	git add a/d
[master (root-commit) b80f2e3] initial
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 a/d
 create mode 100644 b/e
 create mode 100644 c
[master 13a0478] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	test_must_fail git diff --exit-code HEAD^ HEAD &&
	test_must_fail git diff-tree --exit-code HEAD^ HEAD

diff --git a/a/d b/a/d
index 8b13789..8d1c8b6 100644
--- a/a/d
+++ b/a/d
@@ -1 +1 @@
-
+ 
:040000 040000 13061aad4970f02b314943ec46981e9ef332cae2 ac592974c686387705f2617b895d6585cc0a0d46 M	a

ok 2 - diff-tree --exit-code

expecting success: 
	git diff -b --exit-code HEAD^ HEAD &&
	git diff-tree -b -p --exit-code HEAD^ HEAD &&
	git diff-tree -b --exit-code HEAD^ HEAD
:040000 040000 13061aad4970f02b314943ec46981e9ef332cae2 ac592974c686387705f2617b895d6585cc0a0d46 M	a

ok 3 - diff-tree -b --exit-code

expecting success: 
	test_must_fail git diff --cached --exit-code HEAD &&
	test_must_fail git diff-index --cached --exit-code HEAD
diff --git a/a/d b/a/d
index 8d1c8b6..1a4baf5 100644
--- a/a/d
+++ b/a/d
@@ -1 +1 @@
- 
+  
:100644 100644 8d1c8b69c3fce7bea45c73efd06983e3c419a92f 1a4baf536d705b9c814847cb7a708a0e63d5b976 M	a/d

ok 4 - diff-index --cached --exit-code

expecting success: 
	git diff -b --cached --exit-code HEAD &&
	git diff-index -b -p --cached --exit-code HEAD

ok 5 - diff-index -b -p --cached --exit-code

expecting success: 
	test_must_fail git diff --exit-code HEAD &&
	test_must_fail git diff-index --exit-code HEAD
diff --git a/a/d b/a/d
index 8d1c8b6..1a4baf5 100644
--- a/a/d
+++ b/a/d
@@ -1 +1 @@
- 
+  
diff --git a/b/e b/b/e
index 8b13789..8d1c8b6 100644
--- a/b/e
+++ b/b/e
@@ -1 +1 @@
-
+ 
:100644 100644 8d1c8b69c3fce7bea45c73efd06983e3c419a92f 1a4baf536d705b9c814847cb7a708a0e63d5b976 M	a/d
:100644 100644 8b137891791fe96927ad78e64b0aad7bded08bdc 0000000000000000000000000000000000000000 M	b/e

ok 6 - diff-index --exit-code

expecting success: 
	git diff -b --exit-code HEAD &&
	git diff-index -b -p --exit-code HEAD

ok 7 - diff-index -b -p --exit-code

expecting success: 
	test_must_fail git diff --exit-code &&
	test_must_fail git diff-files --exit-code
diff --git a/b/e b/b/e
index 8b13789..8d1c8b6 100644
--- a/b/e
+++ b/b/e
@@ -1 +1 @@
-
+ 
:100644 100644 8b137891791fe96927ad78e64b0aad7bded08bdc 0000000000000000000000000000000000000000 M	b/e

ok 8 - diff-files --exit-code

expecting success: 
	git diff -b --exit-code &&
	git diff-files -b -p --exit-code

ok 9 - diff-files -b -p --exit-code

# passed all 9 test(s)
1..9
