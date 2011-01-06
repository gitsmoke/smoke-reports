Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4300-merge-tree/.git/
expecting success: 
	test_commit "initial" "initial-file" "initial"
[master (root-commit) c1d16d8] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 initial-file

ok 1 - setup
expecting success: 
	cat >expected <<\EXPECTED &&
added in remote
  their  100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
@@ -0,0 +1 @@
+AAA
EXPECTED

	git reset --hard initial &&
	test_commit "add-a-not-b" "ONE" "AAA" &&
	git merge-tree initial initial add-a-not-b >actual &&
	test_cmp expected actual
HEAD is now at c1d16d8 initial
[master e55b628] add-a-not-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE

ok 2 - file add A, !B

expecting success: 
	cat >expected <<\EXPECTED &&
added in local
  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
EXPECTED

	git reset --hard initial &&
	test_commit "add-not-a-b" "ONE" "AAA" &&
	git merge-tree initial add-not-a-b initial >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master fe72a09] add-not-a-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE

ok 3 - file add !A, B

expecting success: 
	cat >expected <<\EXPECTED &&
added in both
  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  their  100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
EXPECTED

	git reset --hard initial &&
	test_commit "add-a-b-same-A" "ONE" "AAA" &&
	git reset --hard initial &&
	test_commit "add-a-b-same-B" "ONE" "AAA" &&
	git merge-tree initial add-a-b-same-A add-a-b-same-B >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master adad022] add-a-b-same-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
HEAD is now at c1d16d8 initial
[master c566426] add-a-b-same-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE

ok 4 - file add A, B (same)

expecting success: 
	cat >expected <<\EXPECTED &&
added in both
  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  their  100644 ba629238ca89489f2b350e196ca445e09d8bb834 ONE
@@ -1 +1,5 @@
+<<<<<<< .our
 AAA
+=======
+BBB
+>>>>>>> .their
EXPECTED

	git reset --hard initial &&
	test_commit "add-a-b-diff-A" "ONE" "AAA" &&
	git reset --hard initial &&
	test_commit "add-a-b-diff-B" "ONE" "BBB" &&
	git merge-tree initial add-a-b-diff-A add-a-b-diff-B >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 59aa417] add-a-b-diff-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
HEAD is now at c1d16d8 initial
[master 06b549e] add-a-b-diff-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE

ok 5 - file add A, B (different)

expecting success: 
	cat >expected <<\EXPECTED &&
EXPECTED

	git reset --hard initial &&
	test_commit "change-a-not-b" "initial-file" "BBB" &&
	git merge-tree initial change-a-not-b initial >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 46329de] change-a-not-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - file change A, !B

expecting success: 
	cat >expected <<\EXPECTED &&
merged
  result 100644 ba629238ca89489f2b350e196ca445e09d8bb834 initial-file
  our    100644 e79c5e8f964493290a409888d5413a737e8e5dd5 initial-file
@@ -1 +1 @@
-initial
+BBB
EXPECTED

	git reset --hard initial &&
	test_commit "change-not-a-b" "initial-file" "BBB" &&
	git merge-tree initial initial change-not-a-b >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 4667cad] change-not-a-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 7 - file change !A, B

expecting success: 
	cat >expected <<\EXPECTED &&
EXPECTED

	git reset --hard initial &&
	test_commit "change-a-b-same-A" "initial-file" "AAA" &&
	git reset --hard initial &&
	test_commit "change-a-b-same-B" "initial-file" "AAA" &&
	git merge-tree initial change-a-b-same-A change-a-b-same-B >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 17f6774] change-a-b-same-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at c1d16d8 initial
[master c618aaa] change-a-b-same-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 8 - file change A, B (same)

expecting success: 
	cat >expected <<\EXPECTED &&
changed in both
  base   100644 e79c5e8f964493290a409888d5413a737e8e5dd5 initial-file
  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d initial-file
  their  100644 ba629238ca89489f2b350e196ca445e09d8bb834 initial-file
@@ -1 +1,5 @@
+<<<<<<< .our
 AAA
+=======
+BBB
+>>>>>>> .their
EXPECTED

	git reset --hard initial &&
	test_commit "change-a-b-diff-A" "initial-file" "AAA" &&
	git reset --hard initial &&
	test_commit "change-a-b-diff-B" "initial-file" "BBB" &&
	git merge-tree initial change-a-b-diff-A change-a-b-diff-B >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master f14ee41] change-a-b-diff-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at c1d16d8 initial
[master 6faccc3] change-a-b-diff-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 9 - file change A, B (different)

expecting success: 
	cat >expected <<\EXPECTED &&
changed in both
  base   100644 f4f1f998c7776568c4ff38f516d77fef9399b5a7 ONE
  our    100644 af14c2c3475337c73759d561ef70b59e5c731176 ONE
  their  100644 372d761493f524d44d59bd24700c3bdf914c973c ONE
@@ -7,7 +7,11 @@
 AAA
 AAA
 AAA
+<<<<<<< .our
 BBB
+=======
+CCC
+>>>>>>> .their
 AAA
 AAA
 AAA
EXPECTED

	git reset --hard initial &&
	test_commit "change-a-b-mix-base" "ONE" "
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA
AAA" &&
	test_commit "change-a-b-mix-A" "ONE" \
		"$(sed -e "1{s/AAA/BBB/;}" -e "10{s/AAA/BBB/;}" <ONE)" &&
	git reset --hard change-a-b-mix-base &&
	test_commit "change-a-b-mix-B" "ONE" \
		"$(sed -e "1{s/AAA/BBB/;}" -e "10{s/AAA/CCC/;}" <ONE)" &&
	git merge-tree change-a-b-mix-base change-a-b-mix-A change-a-b-mix-B \
		>actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 8f24aa4] change-a-b-mix-base
 Author: A U Thor <author@example.com>
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 ONE
[master 37be425] change-a-b-mix-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 8f24aa4 change-a-b-mix-base
[master 9bb3ceb] change-a-b-mix-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 10 - file change A, B (mixed)

expecting success: 
	cat >expected <<\EXPECTED &&
removed in local
  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  their  100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
EXPECTED

	git reset --hard initial &&
	test_commit "rm-a-not-b-base" "ONE" "AAA" &&
	git rm ONE &&
	git commit -m "rm-a-not-b" &&
	git tag "rm-a-not-b" &&
	git merge-tree rm-a-not-b-base rm-a-not-b rm-a-not-b-base >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 6bc469c] rm-a-not-b-base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
rm 'ONE'
[master eaee347] rm-a-not-b
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 ONE

ok 11 - file remove A, !B

expecting success: 
	cat >expected <<\EXPECTED &&
removed in remote
  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
@@ -1 +0,0 @@
-AAA
EXPECTED

	git reset --hard initial &&
	test_commit "rm-not-a-b-base" "ONE" "AAA" &&
	git rm ONE &&
	git commit -m "rm-not-a-b" &&
	git tag "rm-not-a-b" &&
	git merge-tree rm-a-not-b-base rm-a-not-b-base rm-a-not-b >actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 4c80bfe] rm-not-a-b-base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
rm 'ONE'
[master f5c368c] rm-not-a-b
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 ONE

ok 12 - file remove !A, B

expecting success: 
	cat >expected <<\EXPECTED &&
removed in remote
  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  our    100644 ba629238ca89489f2b350e196ca445e09d8bb834 ONE
@@ -1 +0,0 @@
-BBB
EXPECTED

	git reset --hard initial &&
	test_commit "change-a-rm-b-base" "ONE" "AAA" &&
	test_commit "change-a-rm-b-A" "ONE" "BBB" &&
	git reset --hard change-a-rm-b-base &&
	git rm ONE &&
	git commit -m "change-a-rm-b-B" &&
	git tag "change-a-rm-b-B" &&
	git merge-tree change-a-rm-b-base change-a-rm-b-A change-a-rm-b-B \
		>actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master fc17de2] change-a-rm-b-base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
[master a61fd1a] change-a-rm-b-A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at fc17de2 change-a-rm-b-base
rm 'ONE'
[master 76f01da] change-a-rm-b-B
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 ONE

ok 13 - file change A, remove B

expecting success: 
	cat >expected <<\EXPECTED &&
removed in local
  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
  their  100644 ba629238ca89489f2b350e196ca445e09d8bb834 ONE
EXPECTED

	git reset --hard initial &&
	test_commit "rm-a-change-b-base" "ONE" "AAA" &&

	git rm ONE &&
	git commit -m "rm-a-change-b-A" &&
	git tag "rm-a-change-b-A" &&
	git reset --hard rm-a-change-b-base &&
	test_commit "rm-a-change-b-B" "ONE" "BBB" &&
	git merge-tree rm-a-change-b-base rm-a-change-b-A rm-a-change-b-B \
		>actual &&
	test_cmp expected actual

HEAD is now at c1d16d8 initial
[master 0bd6070] rm-a-change-b-base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ONE
rm 'ONE'
[master 2a5c9be] rm-a-change-b-A
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 ONE
HEAD is now at 0bd6070 rm-a-change-b-base
[master 0779850] rm-a-change-b-B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 14 - file remove A, change B

# passed all 14 test(s)
1..14
