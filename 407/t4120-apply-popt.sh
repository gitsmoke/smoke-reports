Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4120-apply-popt/.git/
expecting success: 
	mkdir sub &&
	echo A >sub/file1 &&
	cp sub/file1 file1.saved &&
	git add sub/file1 &&
	echo B >sub/file1 &&
	git diff >patch.file &&
	git checkout -- sub/file1 &&
	git mv sub süb &&
	echo B >süb/file1 &&
	git diff >patch.escaped &&
	grep "[\]" patch.escaped &&
	rm süb/file1 &&
	rmdir süb
diff --git "a/s\303\274b/file1" "b/s\303\274b/file1"
--- "a/s\303\274b/file1"
+++ "b/s\303\274b/file1"

ok 1 - setup
expecting success: 
	cp file1.saved file1 &&
	git apply -p2 patch.file

ok 2 - apply git diff with -p2

expecting success: 
	cp file1.saved file1 &&
	test_must_fail git apply --stat -p3 patch.file 2>err &&
	grep "removing 3 leading" err
fatal: git diff header lacks filename information when removing 3 leading pathname components (line 5)

ok 3 - apply with too large -p

expecting success: 
	cat >patch.quotes <<-\EOF &&
	diff -u "a/"sub/file1 "b/"sub/file1
	--- "a/"sub/file1
	+++ "b/"sub/file1
	@@ -1 +1 @@
	-A
	+B
	EOF
	echo B >expected &&

	cp file1.saved file1 &&
	git apply -p2 patch.quotes &&
	test_cmp expected file1


ok 4 - apply (-p2) traditional diff with funny filenames

expecting success: 
	cp file1.saved file1 &&
	test_must_fail git apply --stat -p3 patch.escaped 2>err &&
	grep "removing 3 leading" err

fatal: git diff header lacks filename information when removing 3 leading pathname components (line 5)

ok 5 - apply with too large -p and fancy filename

expecting success: 
	cat >patch.chmod <<-\EOF &&
	diff --git a/sub/file1 b/sub/file1
	old mode 100644
	new mode 100755
	EOF
	chmod 644 file1 &&
	git apply -p2 patch.chmod &&
	test -x file1


ok 6 - apply (-p2) diff, mode change only

expecting success: 
	cat >patch.rename <<-\EOF &&
	diff --git a/sub/file1 b/sub/file2
	similarity index 100%
	rename from sub/file1
	rename to sub/file2
	EOF
	echo A >expected &&

	cp file1.saved file1 &&
	rm -f file2 &&
	git apply -p2 patch.rename &&
	test_cmp expected file2

ok 7 - apply (-p2) diff, rename

# passed all 7 test(s)
1..7
