Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7606-merge-custom/.git/
expecting success: 
	cat >git-merge-theirs <<-EOF &&
	#!$SHELL_PATH
	eval git read-tree --reset -u \\$\$#
	EOF

	chmod +x git-merge-theirs &&
	PATH=.:$PATH &&
	export PATH

ok 1 - set up custom strategy

expecting success: 
	test_commit c0 c0.c &&
	test_commit c1 c1.c &&
	git reset --keep c0 &&
	echo c1c1 >c1.c &&
	git add c1.c &&
	test_commit c2 c2.c &&
	git reset --keep c0 &&
	test_commit c3 c3.c
[master (root-commit) 934056f] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master 7b51d7c] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
[master f06910a] c2
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
 create mode 100644 c2.c
[master 934e277] c3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c3.c

ok 2 - setup

expecting success: 
	git reset --hard c1 &&

	git rev-parse c1 >head.old &&
	git rev-parse c2 >second-parent.expected &&
	git rev-parse c2^{tree} >tree.expected &&
	git merge -s theirs c2 &&

	git rev-parse HEAD >head.new &&
	git rev-parse HEAD^1 >first-parent &&
	git rev-parse HEAD^2 >second-parent &&
	git rev-parse HEAD^{tree} >tree &&
	git update-index --refresh &&
	git diff --exit-code &&
	git diff --exit-code c2 HEAD &&
	git diff --exit-code c2 &&

	! test_cmp head.old head.new &&
	test_cmp head.old first-parent &&
	test_cmp second-parent.expected second-parent &&
	test_cmp tree.expected tree &&
	test -f c0.c &&
	grep c1c1 c1.c &&
	test -f c2.c

HEAD is now at 7b51d7c c1
Merge made by theirs.
 c1.c |    2 +-
 c2.c |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 c2.c
--- head.old	2011-01-13 04:08:54.000000000 +0000
+++ head.new	2011-01-13 04:08:54.000000000 +0000
@@ -1 +1 @@
-7b51d7cdbd54b8c470d864639e1136d88ce718ef
+5be261565d292369b3014b4da6bbc8e31e3587ed
c1c1

ok 3 - merge c2 with a custom strategy

expecting success: 
	git reset --hard c1 &&

	git rev-parse c1 >head.old &&
	git rev-parse c3 >second-parent.expected &&
	git rev-parse c3^{tree} >tree.expected &&
	git merge -s theirs c3 &&

	git rev-parse HEAD >head.new &&
	git rev-parse HEAD^1 >first-parent &&
	git rev-parse HEAD^2 >second-parent &&
	git rev-parse HEAD^{tree} >tree &&
	git update-index --refresh &&
	git diff --exit-code &&
	git diff --exit-code c3 HEAD &&
	git diff --exit-code c3 &&

	! test_cmp head.old head.new &&
	test_cmp head.old first-parent &&
	test_cmp second-parent.expected second-parent &&
	test_cmp tree.expected tree &&
	test -f c0.c &&
	! test -e c1.c &&
	test -f c3.c

HEAD is now at 7b51d7c c1
Merge made by theirs.
 c1.c |    1 -
 c3.c |    1 +
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 c1.c
 create mode 100644 c3.c
--- head.old	2011-01-13 04:08:54.000000000 +0000
+++ head.new	2011-01-13 04:08:54.000000000 +0000
@@ -1 +1 @@
-7b51d7cdbd54b8c470d864639e1136d88ce718ef
+c8fec3d8a692cd4d216006c70e6f2e380bf104fd

ok 4 - trivial merge with custom strategy

# passed all 4 test(s)
1..4
