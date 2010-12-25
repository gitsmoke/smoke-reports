Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3701-add-interactive/.git/
expecting success: 
	echo content >file &&
	git add file &&
	echo more >>file &&
	echo lines >>file


ok 1 - setup (initial)

expecting success: 
	git add -i </dev/null >output &&
	grep "+1/-0 *+2/-0 file" output

  1:        +1/-0        +2/-0 file

ok 2 - status works (initial)

expecting success: 
cat >expected <<EOF
new file mode 100644
index 0000000..d95f3ad
--- /dev/null
+++ b/file
@@ -0,0 +1 @@
+content
EOF


ok 3 - setup expected

expecting success: 
	(echo d; echo 1) | git add -i >output &&
	sed -ne "/new file/,/content/p" <output >diff &&
	test_cmp expected diff

ok 4 - diff works (initial)

expecting success: 
	git add file &&
	(echo r; echo 1) | git add -i &&
	git ls-files >output &&
	! grep . output

           staged     unstaged path
  1:        +3/-0      nothing file

*** Commands ***
  1: [s]tatus	  2: [u]pdate	  3: [r]evert	  4: [a]dd untracked
  5: [p]atch	  6: [d]iff	  7: [q]uit	  8: [h]elp
What now>            staged     unstaged path
  1:        +3/-0      nothing [f]ile
Revert>>            staged     unstaged path
* 1:        +3/-0      nothing [f]ile
Revert>> 
rm 'file'
reverted one path

*** Commands ***
  1: [s]tatus	  2: [u]pdate	  3: [r]evert	  4: [a]dd untracked
  5: [p]atch	  6: [d]iff	  7: [q]uit	  8: [h]elp
What now> 
Bye.

ok 5 - revert works (initial)

expecting success: 
	echo baseline >file &&
	git add file &&
	git commit -m commit &&
	echo content >>file &&
	git add file &&
	echo more >>file &&
	echo lines >>file
[master (root-commit) 29bd8fc] commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 6 - setup (commit)
expecting success: 
	git add -i </dev/null >output &&
	grep "+1/-0 *+2/-0 file" output
  1:        +1/-0        +2/-0 file
ok 7 - status works (commit)
expecting success: 
cat >expected <<EOF
index 180b47c..b6f2c08 100644
--- a/file
+++ b/file
@@ -1 +1,2 @@
 baseline
+content
EOF

ok 8 - setup expected

expecting success: 
	(echo d; echo 1) | git add -i >output &&
	sed -ne "/^index/,/content/p" <output >diff &&
	test_cmp expected diff

ok 9 - diff works (commit)

expecting success: 
	git add file &&
	(echo r; echo 1) | git add -i &&
	git add -i </dev/null >output &&
	grep "unchanged *+3/-0 file" output

           staged     unstaged path
  1:        +3/-0      nothing file

*** Commands ***
  1: [s]tatus	  2: [u]pdate	  3: [r]evert	  4: [a]dd untracked
  5: [p]atch	  6: [d]iff	  7: [q]uit	  8: [h]elp
What now>            staged     unstaged path
  1:        +3/-0      nothing [f]ile
Revert>>            staged     unstaged path
* 1:        +3/-0      nothing [f]ile
Revert>> 
reverted one path

*** Commands ***
  1: [s]tatus	  2: [u]pdate	  3: [r]evert	  4: [a]dd untracked
  5: [p]atch	  6: [d]iff	  7: [q]uit	  8: [h]elp
What now> 
Bye.
  1:    unchanged        +3/-0 file

ok 10 - revert works (commit)

expecting success: 
cat >expected <<EOF
EOF


ok 11 - setup expected

expecting success: 
	cat >fake_editor.sh <<EOF
	EOF
	chmod a+x fake_editor.sh &&
	test_set_editor "$(pwd)/fake_editor.sh" &&


ok 12 - setup fake editor

expecting success: 
	(echo e; echo a) | git add -p &&
	git diff > diff &&
	test_cmp expected diff
diff --git a/file b/file
index 180b47c..f910ae9 100644
--- a/file
+++ b/file
@@ -1 +1,4 @@
 baseline
+content
+more
+lines
Stage this hunk [y,n,q,a,d,/,e,?]? 

ok 13 - dummy edit works

expecting success: 
cat >patch <<EOF
@@ -1,1 +1,4 @@
 this
+patch
-does not
 apply
EOF


ok 14 - setup patch

expecting success: 
	echo "#!$SHELL_PATH" >fake_editor.sh &&
	cat >>fake_editor.sh <<\EOF &&
mv -f "$1" oldpatch &&
mv -f patch "$1"
EOF
	chmod a+x fake_editor.sh &&
	test_set_editor "$(pwd)/fake_editor.sh"


ok 15 - setup fake editor

expecting success: 
	git reset &&
	(echo e; echo n; echo d) | git add -p >output &&
	grep "hunk does not apply" output

Unstaged changes after reset:
M	file
Stage this hunk [y,n,q,a,d,/,e,?]? Your edited hunk does not apply. Edit again (saying "no" discards!) [y/n]? @@ -1 +1,4 @@

ok 16 - bad edit rejected

expecting success: 
cat >patch <<EOF
this patch
is garbage
EOF


ok 17 - setup patch

expecting success: 
	git reset &&
	(echo e; echo n; echo d) | git add -p >output &&
	grep "hunk does not apply" output

Unstaged changes after reset:
M	file
Stage this hunk [y,n,q,a,d,/,e,?]? Your edited hunk does not apply. Edit again (saying "no" discards!) [y/n]? @@ -1 +1,4 @@

ok 18 - garbage edit rejected

expecting success: 
cat >patch <<EOF
@@ -1,0 +1,0 @@
 baseline
+content
+newcontent
+lines
EOF


ok 19 - setup patch

expecting success: 
cat >expected <<EOF
diff --git a/file b/file
index b5dd6c9..f910ae9 100644
--- a/file
+++ b/file
@@ -1,4 +1,4 @@
 baseline
 content
-newcontent
+more
 lines
EOF


ok 20 - setup expected

expecting success: 
	(echo e; echo n; echo d) | git add -p &&
	git diff >output &&
	test_cmp expected output

diff --git a/file b/file
index 180b47c..f910ae9 100644
--- a/file
+++ b/file
@@ -1 +1,4 @@
 baseline
+content
+more
+lines
Stage this hunk [y,n,q,a,d,/,e,?]? 

ok 21 - real edit works

expecting success: 
	git reset &&
	echo file >.gitignore &&
	echo changed >file &&
	echo y | git add -p file &&
	git diff >output &&
	git reset &&
	git commit -am commit &&
	git diff >expected &&
	test_cmp expected output &&
	git reset --hard HEAD^

Unstaged changes after reset:
M	file
diff --git a/file b/file
index 180b47c..5ea2ed4 100644
--- a/file
+++ b/file
@@ -1 +1 @@
-baseline
+changed
Stage this hunk [y,n,q,a,d,/,e,?]? 
Unstaged changes after reset:
M	file
[master aec4ed1] commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 29bd8fc commit

ok 22 - skip files similarly as commit -a

expecting success: 
	git reset --hard &&
	echo content >>file &&
	chmod +x file &&
	printf "n\ny\n" | git add -p &&
	git show :file | grep content &&
	git diff file | grep "new mode"

HEAD is now at 29bd8fc commit
diff --git a/file b/file
index 180b47c..b6f2c08
--- a/file
+++ b/file
old mode 100644
new mode 100755
Stage mode change [y,n,q,a,d,/,j,J,g,?]? @@ -1 +1,2 @@
 baseline
+content
Stage this hunk [y,n,q,a,d,/,K,g,e,?]? 
content
new mode 100755

ok 23 - patch does not affect mode

expecting success: 
	git reset --hard &&
	echo content >>file &&
	chmod +x file &&
	printf "y\nn\n" | git add -p &&
	git diff --cached file | grep "new mode" &&
	git diff          file | grep "+content"

HEAD is now at 29bd8fc commit
diff --git a/file b/file
index 180b47c..b6f2c08
--- a/file
+++ b/file
old mode 100644
new mode 100755
Stage mode change [y,n,q,a,d,/,j,J,g,?]? @@ -1 +1,2 @@
 baseline
+content
Stage this hunk [y,n,q,a,d,/,K,g,e,?]? 
new mode 100755
+content

ok 24 - stage mode but not hunk

expecting success: 
	git reset --hard &&
	echo content >>file &&
	chmod +x file &&
	printf "y\ny\n" | git add -p &&
	git diff --cached file | grep "new mode" &&
	git diff --cached file | grep "+content" &&
	test -z "$(git diff file)"

HEAD is now at 29bd8fc commit
diff --git a/file b/file
index 180b47c..b6f2c08
--- a/file
+++ b/file
old mode 100644
new mode 100755
Stage mode change [y,n,q,a,d,/,j,J,g,?]? @@ -1 +1,2 @@
 baseline
+content
Stage this hunk [y,n,q,a,d,/,K,g,e,?]? 
new mode 100755
+content

ok 25 - stage mode and hunk

expecting success: 
	git reset --hard &&
	test_chmod +x file &&
	echo content >>file

HEAD is now at 29bd8fc commit

ok 26 - setup again

expecting success: 
cat >patch <<EOF
index 180b47c..b6f2c08 100644
--- a/file
+++ b/file
@@ -1,2 +1,4 @@
+firstline
 baseline
 content
+lastline
EOF


ok 27 - setup patch

expecting success: 
cat >expected <<EOF
diff --git a/file b/file
index b6f2c08..61b9053 100755
--- a/file
+++ b/file
@@ -1,2 +1,4 @@
+firstline
 baseline
 content
+lastline
EOF


ok 28 - setup expected

expecting success: 
	git commit -am "clear local changes" &&
	git apply patch &&
	(echo s; echo y; echo y) | git add -p file &&
	git diff --cached > diff &&
	test_cmp expected diff

[master 4f6a559] clear local changes
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 file
diff --git a/file b/file
index b6f2c08..61b9053 100755
--- a/file
+++ b/file
@@ -1,2 +1,4 @@
+firstline
 baseline
 content
+lastline
Stage this hunk [y,n,q,a,d,/,s,e,?]? Split into 2 hunks.
@@ -1,2 +1,3 @@
+firstline
 baseline
 content
Stage this hunk [y,n,q,a,d,/,j,J,g,e,?]? @@ -1,2 +2,3 @@
 baseline
 content
+lastline
Stage this hunk [y,n,q,a,d,/,K,g,e,?]? 

ok 29 - add first line works

expecting success: 
cat >expected <<EOF
diff --git a/non-empty b/non-empty
deleted file mode 100644
index d95f3ad..0000000
--- a/non-empty
+++ /dev/null
@@ -1 +0,0 @@
-content
EOF


ok 30 - setup expected

expecting success: 
	git reset --hard &&
	echo content >non-empty &&
	git add non-empty &&
	git commit -m non-empty &&
	rm non-empty &&
	echo y | git add -p non-empty &&
	git diff --cached >diff &&
	test_cmp expected diff

HEAD is now at 4f6a559 clear local changes
[master d159be6] non-empty
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 non-empty
diff --git a/non-empty b/non-empty
index d95f3ad..0000000
--- a/non-empty
+++ /dev/null
deleted file mode 100644
@@ -1 +0,0 @@
-content
Stage deletion [y,n,q,a,d,/,?]? 

ok 31 - deleting a non-empty file

expecting success: 
cat >expected <<EOF
diff --git a/empty b/empty
deleted file mode 100644
index e69de29..0000000
EOF


ok 32 - setup expected

expecting success: 
	git reset --hard &&
	> empty &&
	git add empty &&
	git commit -m empty &&
	rm empty &&
	echo y | git add -p empty &&
	git diff --cached >diff &&
	test_cmp expected diff

HEAD is now at d159be6 non-empty
[master fe81e5a] empty
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 empty
diff --git a/empty b/empty
index e69de29..0000000
deleted file mode 100644
Stage deletion [y,n,q,a,d,/,?]? 

ok 33 - deleting an empty file

# passed all 33 test(s)
1..33
