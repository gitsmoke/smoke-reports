Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4020-diff-external/.git/
expecting success: 

	test_tick &&
	echo initial >file &&
	git add file &&
	git commit -m initial &&

	test_tick &&
	echo second >file &&
	git add file &&
	git commit -m second &&

	test_tick &&
	echo third >file

[master (root-commit) b6d2089] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master f3562cd] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	GIT_EXTERNAL_DIFF=echo git diff | {
		read path oldfile oldhex oldmode newfile newhex newmode &&
		test "z$path" = zfile &&
		test "z$oldmode" = z100644 &&
		test "z$newhex" = "z$_z40" &&
		test "z$newmode" = z100644 &&
		oh=$(git rev-parse --verify HEAD:file) &&
		test "z$oh" = "z$oldhex"
	}



ok 2 - GIT_EXTERNAL_DIFF environment

expecting success: 

	GIT_EXTERNAL_DIFF=echo git log -p -1 HEAD |
	grep "^diff --git a/file b/file"


diff --git a/file b/file

ok 3 - GIT_EXTERNAL_DIFF environment should apply only to diff

expecting success: 

	GIT_EXTERNAL_DIFF=echo git diff --no-ext-diff |
	grep "^diff --git a/file b/file"


diff --git a/file b/file

ok 4 - GIT_EXTERNAL_DIFF environment and --no-ext-diff

expecting success: 

	git config diff.parrot.command echo &&

	echo >.gitattributes "file diff=parrot" &&

	git diff | {
		read path oldfile oldhex oldmode newfile newhex newmode &&
		test "z$path" = zfile &&
		test "z$oldmode" = z100644 &&
		test "z$newhex" = "z$_z40" &&
		test "z$newmode" = z100644 &&
		oh=$(git rev-parse --verify HEAD:file) &&
		test "z$oh" = "z$oldhex"
	}



ok 5 - diff attribute

expecting success: 

	git log -p -1 HEAD |
	grep "^diff --git a/file b/file"


diff --git a/file b/file

ok 6 - diff attribute should apply only to diff

expecting success: 

	git diff --no-ext-diff |
	grep "^diff --git a/file b/file"


diff --git a/file b/file

ok 7 - diff attribute and --no-ext-diff

expecting success: 

	git config --unset diff.parrot.command &&
	git config diff.color.command echo &&

	echo >.gitattributes "file diff=color" &&

	git diff | {
		read path oldfile oldhex oldmode newfile newhex newmode &&
		test "z$path" = zfile &&
		test "z$oldmode" = z100644 &&
		test "z$newhex" = "z$_z40" &&
		test "z$newmode" = z100644 &&
		oh=$(git rev-parse --verify HEAD:file) &&
		test "z$oh" = "z$oldhex"
	}



ok 8 - diff attribute

expecting success: 

	git log -p -1 HEAD |
	grep "^diff --git a/file b/file"
diff --git a/file b/file

ok 9 - diff attribute should apply only to diff

expecting success: 

	git diff --no-ext-diff |
	grep "^diff --git a/file b/file"


diff --git a/file b/file

ok 10 - diff attribute and --no-ext-diff

expecting success: 
	echo >.gitattributes "file -diff" &&
	git diff | grep Binary

Binary files a/file and b/file differ

ok 11 - no diff with -diff

expecting success: 
	echo >.gitattributes "file diff" &&
	git diff >actual &&
	test_cmp "$TEST_DIRECTORY"/t4020/diff.NUL actual


ok 12 - force diff with "diff"

expecting success: 
	echo anotherfile > file2 &&
	git add file2 &&
	git commit -m "added 2nd file" &&
	echo modified >file2 &&
	GIT_EXTERNAL_DIFF=echo git diff

[master 314ec38] added 2nd file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
file /tmp/HcTt5P_file e019be006cf33489e2d0177a3837a2384eddebc5 100644 file 0000000000000000000000000000000000000000 100644
file2 /tmp/1ke5Xi_file2 abc9fa522731419e7eaa3d472e3cb3d99e475c49 100644 file2 0000000000000000000000000000000000000000 100644

ok 13 - GIT_EXTERNAL_DIFF with more than one changed files

expecting success: 
	touch file.ext &&
	git add file.ext &&
	echo with extension > file.ext &&
	GIT_EXTERNAL_DIFF=echo git diff file.ext | grep ......_file\.ext &&
	git update-index --force-remove file.ext &&
	rm file.ext

file.ext /tmp/M5F4ES_file.ext e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 100644 file.ext 0000000000000000000000000000000000000000 100644

ok 14 - GIT_EXTERNAL_DIFF generates pretty paths

expecting success: 
	git config core.autocrlf true &&
	GIT_EXTERNAL_DIFF=./fake-diff.sh git diff &&
	test $(wc -l < crlfed.txt) = $(cat crlfed.txt | keep_only_cr | wc -c)


ok 15 - external diff with autocrlf = true

expecting success: 
	git add file &&
	git update-index --assume-unchanged file &&
	echo second >file &&
	git diff --cached >actual &&
	test_cmp "$TEST_DIRECTORY"/t4020/diff.NUL actual


ok 16 - diff --cached

# passed all 16 test(s)
1..16
