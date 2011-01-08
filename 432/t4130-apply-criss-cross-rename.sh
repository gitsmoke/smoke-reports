Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4130-apply-criss-cross-rename/.git/
expecting success: 
	create_file file1 "File1 contents" &&
	create_file file2 "File2 contents" &&
	create_file file3 "File3 contents" &&
	git add file1 file2 file3 &&
	git commit -m 1
[master (root-commit) fd50ffb] 1
 Author: A U Thor <author@example.com>
 3 files changed, 303 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
 create mode 100644 file3

ok 1 - setup

expecting success: 
	mv file1 tmp &&
	mv file2 file1 &&
	mv tmp file2 &&
	cp file1 file1-swapped &&
	cp file2 file2-swapped

ok 2 - criss-cross rename

expecting success: 
	git diff -M -B > diff &&
	git reset --hard
HEAD is now at fd50ffb 1

ok 3 - diff -M -B

expecting success: 
	git apply diff &&
	test_cmp file1 file1-swapped &&
	test_cmp file2 file2-swapped


ok 4 - apply

expecting success: 
	git reset --hard &&
	mv file1 tmp &&
	mv file2 file1 &&
	mv file3 file2 &&
	mv tmp file3 &&
	cp file1 file1-swapped &&
	cp file2 file2-swapped &&
	cp file3 file3-swapped

HEAD is now at fd50ffb 1

ok 5 - criss-cross rename

expecting success: 
	git diff -M -B > diff &&
	git reset --hard
HEAD is now at fd50ffb 1
ok 6 - diff -M -B
expecting success: 
	git apply diff &&
	test_cmp file1 file1-swapped &&
	test_cmp file2 file2-swapped &&
	test_cmp file3 file3-swapped

ok 7 - apply

# passed all 7 test(s)
1..7
