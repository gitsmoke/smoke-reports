Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4134-apply-submodule/.git/
expecting success: 
	cat > create-sm.patch <<EOF &&
diff --git a/dir/sm b/dir/sm
new file mode 160000
index 0000000..0123456
--- /dev/null
+++ b/dir/sm
@@ -0,0 +1 @@
+Subproject commit 0123456789abcdef0123456789abcdef01234567
EOF
	cat > remove-sm.patch <<EOF
diff --git a/dir/sm b/dir/sm
deleted file mode 160000
index 0123456..0000000
--- a/dir/sm
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 0123456789abcdef0123456789abcdef01234567
EOF

ok 1 - setup

expecting success: 
	git apply --index create-sm.patch &&
	test -d dir/sm &&
	git apply --index remove-sm.patch &&
	test \! -d dir


ok 2 - removing a submodule also removes all leading subdirectories

# passed all 2 test(s)
1..2
