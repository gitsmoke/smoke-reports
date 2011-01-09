Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4133-apply-filenames/.git/
expecting success: 
	cat > bad1.patch <<EOF &&
diff --git a/f b/f
new file mode 100644
index 0000000..d00491f
--- /dev/null
+++ b/f-blah
@@ -0,0 +1 @@
+1
EOF
	cat > bad2.patch <<EOF
diff --git a/f b/f
deleted file mode 100644
index d00491f..0000000
--- b/f-blah
+++ /dev/null
@@ -1 +0,0 @@
-1
EOF

ok 1 - setup

expecting success: 
	test_must_fail git apply bad1.patch 2>err &&
	grep "inconsistent new filename" err &&
	test_must_fail git apply bad2.patch 2>err &&
	grep "inconsistent old filename" err
fatal: git apply: bad git-diff - inconsistent new filename on line 5
fatal: git apply: bad git-diff - inconsistent old filename on line 4

ok 2 - apply diff with inconsistent filenames in headers

# passed all 2 test(s)
1..2
