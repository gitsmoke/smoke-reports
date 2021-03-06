Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4117-apply-reject/.git/
expecting success: 
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21
	do
		echo $i
	done >file1 &&
	cat file1 >saved.file1 &&
	git update-index --add file1 &&
	git commit -m initial &&

	for i in 1 2 A B 4 5 6 7 8 9 10 11 12 C 13 14 15 16 17 18 19 20 D 21
	do
		echo $i
	done >file1 &&
	git diff >patch.1 &&
	cat file1 >clean &&

	for i in 1 E 2 3 4 5 6 7 8 9 10 11 12 C 13 14 15 16 17 18 19 20 F 21
	do
		echo $i
	done >expected &&

	mv file1 file2 &&
	git update-index --add --remove file1 file2 &&
	git diff -M HEAD >patch.2 &&

	rm -f file1 file2 &&
	mv saved.file1 file1 &&
	git update-index --add --remove file1 file2 &&

	for i in 1 E 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 F 21
	do
		echo $i
	done >file1 &&

	cat file1 >saved.file1
[master (root-commit) d5377c8] initial
 Author: A U Thor <author@example.com>
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 1 - setup

expecting success: 

	if git apply patch.1
	then
		echo "Eh? Why?"
		exit 1
	fi

	test_cmp file1 saved.file1

ok 2 - apply without --reject should fail

expecting success: 

	if git apply --verbose patch.1
	then
		echo "Eh? Why?"
		exit 1
	fi

	test_cmp file1 saved.file1


ok 3 - apply without --reject should fail

expecting success: 

	cat saved.file1 >file1 &&
	rm -f file1.rej file2.rej &&

	if git apply --reject patch.1
	then
		echo "succeeds with --reject?"
		exit 1
	fi

	test_cmp file1 expected &&

	cat file1.rej &&

	if test -f file2.rej
	then
		echo "file2 should not have been touched"
		exit 1
	fi

diff a/file1 b/file1	(rejected hunks)
@@ -1,6 +1,7 @@
 1
 2
-3
+A
+B
 4
 5
 6
@@ -18,4 +20,5 @@
 18
 19
 20
+D
 21

ok 4 - apply with --reject should fail but update the file

expecting success: 

	cat saved.file1 >file1 &&
	rm -f file1.rej file2.rej file2 &&

	if git apply --reject patch.2 >rejects
	then
		echo "succeeds with --reject?"
		exit 1
	fi

	test -f file1 && {
		echo "file1 still exists?"
		exit 1
	}
	test_cmp file2 expected &&

	cat file2.rej &&

	if test -f file1.rej
	then
		echo "file2 should not have been touched"
		exit 1
	fi
diff a/file2 b/file2	(rejected hunks)
@@ -1,6 +1,7 @@
 1
 2
-3
+A
+B
 4
 5
 6
@@ -18,4 +20,5 @@
 18
 19
 20
+D
 21

ok 5 - apply with --reject should fail but update the file

expecting success: 

	cat saved.file1 >file1 &&
	rm -f file1.rej file2.rej file2 &&

	if git apply --reject --verbose patch.2 >rejects
	then
		echo "succeeds with --reject?"
		exit 1
	fi

	test -f file1 && {
		echo "file1 still exists?"
		exit 1
	}
	test_cmp file2 expected &&

	cat file2.rej &&

	if test -f file1.rej
	then
		echo "file2 should not have been touched"
		exit 1
	fi


diff a/file2 b/file2	(rejected hunks)
@@ -1,6 +1,7 @@
 1
 2
-3
+A
+B
 4
 5
 6
@@ -18,4 +20,5 @@
 18
 19
 20
+D
 21

ok 6 - the same test with --verbose

expecting success: 

	git cat-file -p HEAD:file1 >file1 &&
	rm -f file?.rej file2 &&

	git apply --verbose patch.1 &&

	test_cmp file1 clean


ok 7 - apply cleanly with --verbose

# passed all 7 test(s)
1..7
