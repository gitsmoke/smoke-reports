Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4041-diff-submodule-option/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4041-diff-submodule-option/sm1/.git/
expecting success: 
	git add sm1 &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 0000000...a2c4dab (new submodule)
EOF
	test_cmp expected actual

ok 1 - added submodule
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 a2c4dab..4c8d358:
  > Add foo3
EOF
	test_cmp expected actual

ok 2 - modified submodule(forward)

expecting success: 
	git diff --submodule=log >actual &&
	cat >expected <<-EOF &&
Submodule sm1 a2c4dab..4c8d358:
  > Add foo3
EOF
	test_cmp expected actual

ok 3 - modified submodule(forward)

expecting success: 
	git diff --submodule >actual &&
	cat >expected <<-EOF &&
Submodule sm1 a2c4dab..4c8d358:
  > Add foo3
EOF
	test_cmp expected actual

ok 4 - modified submodule(forward) --submodule
expecting success: 
	git diff --submodule=short >actual &&
	cat >expected <<-EOF &&
diff --git a/sm1 b/sm1
index a2c4dab..4c8d358 160000
--- a/sm1
+++ b/sm1
@@ -1 +1 @@
-Subproject commit a2c4dab1ebec1c66f5ff827f38405841edf300d5
+Subproject commit 4c8d3589e545409640bc1918a74f454698e69462
EOF
	test_cmp expected actual

ok 5 - modified submodule(forward) --submodule=short
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 4c8d358..db425b6 (rewind):
  < Add foo3
  < Add foo2
EOF
	test_cmp expected actual

ok 6 - modified submodule(backward)
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 4c8d358...41fbea9:
  > Add foo5
  > Add foo4
  < Add foo3
  < Add foo2
EOF
	test_cmp expected actual

ok 7 - modified submodule(backward and forward)
expecting success: 
	git diff --submodule=log --cached >actual &&
	cat >expected <<-EOF &&
Submodule sm1 41fbea9...0000000 (submodule deleted)
diff --git a/sm1 b/sm1
new file mode 100644
index 0000000..9da5fb8
--- /dev/null
+++ b/sm1
@@ -0,0 +1 @@
+sm1
EOF
	test_cmp expected actual

ok 8 - typechanged submodule(submodule->blob), --cached

expecting success: 
	git diff --submodule=log >actual &&
	cat >expected <<-EOF &&
diff --git a/sm1 b/sm1
deleted file mode 100644
index 9da5fb8..0000000
--- a/sm1
+++ /dev/null
@@ -1 +0,0 @@
-sm1
Submodule sm1 0000000...41fbea9 (new submodule)
EOF
	test_cmp expected actual

ok 9 - typechanged submodule(submodule->blob)
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 41fbea9...0000000 (submodule deleted)
diff --git a/sm1 b/sm1
new file mode 100644
index 0000000..9da5fb8
--- /dev/null
+++ b/sm1
@@ -0,0 +1 @@
+sm1
EOF
	test_cmp expected actual

ok 10 - typechanged submodule(submodule->blob)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4041-diff-submodule-option/sm1/.git/
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 41fbea9...6858906 (commits not present)
EOF
	test_cmp expected actual

ok 11 - nonexistent commit
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
diff --git a/sm1 b/sm1
deleted file mode 100644
index 9da5fb8..0000000
--- a/sm1
+++ /dev/null
@@ -1 +0,0 @@
-sm1
Submodule sm1 0000000...6858906 (new submodule)
EOF
	test_cmp expected actual


ok 12 - typechanged submodule(blob->submodule)

expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
EOF
	test_cmp expected actual

ok 13 - submodule is up to date

expecting success: 
	echo new > sm1/new-file &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains untracked content
EOF
	test_cmp expected actual

ok 14 - submodule contains untracked content

expecting success: 
	git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
	! test -s actual

ok 15 - submodule contains untracked content (untracked ignored)

expecting success: 
	git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
	! test -s actual

ok 16 - submodule contains untracked content (dirty ignored)

expecting success: 
	git diff-index -p --ignore-submodules=all --submodule=log HEAD >actual &&
	! test -s actual

ok 17 - submodule contains untracked content (all ignored)

expecting success: 
	echo new > sm1/foo6 &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains untracked content
Submodule sm1 contains modified content
EOF
	test_cmp expected actual

ok 18 - submodule contains untracked and modifed content

expecting success: 
	echo new > sm1/foo6 &&
	git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains modified content
EOF
	test_cmp expected actual

ok 19 - submodule contains untracked and modifed content (untracked ignored)

expecting success: 
	echo new > sm1/foo6 &&
	git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
	! test -s actual

ok 20 - submodule contains untracked and modifed content (dirty ignored)

expecting success: 
	echo new > sm1/foo6 &&
	git diff-index -p --ignore-submodules --submodule=log HEAD >actual &&
	! test -s actual

ok 21 - submodule contains untracked and modifed content (all ignored)

expecting success: 
	rm -f sm1/new-file &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains modified content
EOF
	test_cmp expected actual

ok 22 - submodule contains modifed content
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual


ok 23 - submodule is modified

expecting success: 
	echo new > sm1/new-file &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains untracked content
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 24 - modified submodule contains untracked content

expecting success: 
	git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 25 - modified submodule contains untracked content (untracked ignored)

expecting success: 
	git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 26 - modified submodule contains untracked content (dirty ignored)

expecting success: 
	git diff-index -p --ignore-submodules=all --submodule=log HEAD >actual &&
	! test -s actual

ok 27 - modified submodule contains untracked content (all ignored)

expecting success: 
	echo modification >> sm1/foo6 &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains untracked content
Submodule sm1 contains modified content
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 28 - modified submodule contains untracked and modifed content

expecting success: 
	echo modification >> sm1/foo6 &&
	git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains modified content
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 29 - modified submodule contains untracked and modifed content (untracked ignored)

expecting success: 
	echo modification >> sm1/foo6 &&
	git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 30 - modified submodule contains untracked and modifed content (dirty ignored)

expecting success: 
	echo modification >> sm1/foo6 &&
	git diff-index -p --ignore-submodules --submodule=log HEAD >actual &&
	! test -s actual


ok 31 - modified submodule contains untracked and modifed content (all ignored)

expecting success: 
	rm -f sm1/new-file &&
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 contains modified content
Submodule sm1 6858906..0a95e88:
  > change
EOF
	test_cmp expected actual

ok 32 - modified submodule contains modifed content
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906...0000000 (submodule deleted)
EOF
	test_cmp expected actual

ok 33 - deleted submodule
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4041-diff-submodule-option/sm2/.git/
expecting success: 
	git diff-index -p --submodule=log HEAD >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906...0000000 (submodule deleted)
Submodule sm2 0000000...fa9eeaf (new submodule)
EOF
	test_cmp expected actual

ok 34 - multiple submodules

expecting success: 
	git diff-index -p --submodule=log HEAD sm2 >actual &&
	cat >expected <<-EOF &&
Submodule sm2 0000000...fa9eeaf (new submodule)
EOF
	test_cmp expected actual

ok 35 - path filter
expecting success: 
	git diff-index -p --submodule=log HEAD^ >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906...0000000 (submodule deleted)
Submodule sm2 0000000...fa9eeaf (new submodule)
EOF
	test_cmp expected actual

ok 36 - given commit

expecting success: 
	git diff-index -p --submodule HEAD^ >actual &&
	cat >expected <<-EOF &&
Submodule sm1 6858906...0000000 (submodule deleted)
Submodule sm2 0000000...fa9eeaf (new submodule)
EOF
	test_cmp expected actual

ok 37 - given commit --submodule

expecting success: 
	git diff-index -p --submodule=short HEAD^ >actual &&
	cat >expected <<-EOF &&
diff --git a/sm1 b/sm1
deleted file mode 160000
index 6858906..0000000
--- a/sm1
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 68589064c2af4b97c5f5bd414bd33570c3646058
diff --git a/sm2 b/sm2
new file mode 160000
index 0000000..fa9eeaf
--- /dev/null
+++ b/sm2
@@ -0,0 +1 @@
+Subproject commit fa9eeaf3332f65f785e9ccbe1c72d4eb4eb49926
EOF
	test_cmp expected actual


ok 38 - given commit --submodule=short

expecting success: 
	(cd sm2 &&
	 REAL="$(pwd)/../.real" &&
	 mv .git "$REAL"
	 echo "gitdir: $REAL" >.git)


ok 39 - setup .git file for sm2

expecting success: 
	git diff --submodule HEAD^ >actual &&
	cat >expected <<-EOF &&
Submodule sm1 $head6...0000000 (submodule deleted)
Submodule sm2 0000000...$head7 (new submodule)
EOF
	test_cmp expected actual

ok 40 - diff --submodule with .git file

# passed all 40 test(s)
1..40
