Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4045-diff-relative/.git/
expecting success: 
	git commit --allow-empty -m empty &&
	echo content >file1 &&
	mkdir subdir &&
	echo other content >subdir/file2 &&
	git add . &&
	git commit -m one
[master (root-commit) 16bc5e3] empty
 Author: A U Thor <author@example.com>
[master ecd3c4a] one
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 subdir/file2

ok 1 - setup
expecting success: 
	git diff -p --relative=subdir/ HEAD^ >actual &&
	test_cmp expected actual

ok 2 - -p --relative=subdir/
expecting success: 
	git diff -p --relative=subdir HEAD^ >actual &&
	test_cmp expected actual

ok 3 - -p --relative=subdir
expecting success: 
	git diff -p --relative=sub HEAD^ >actual &&
	test_cmp expected actual

ok 4 - -p --relative=sub
expecting success: 
	git diff --stat --relative=subdir/ HEAD^ >actual &&
	test_cmp expected actual

ok 5 - --stat --relative=subdir/
expecting success: 
	git diff --stat --relative=subdir HEAD^ >actual &&
	test_cmp expected actual

ok 6 - --stat --relative=subdir
expecting success: 
	git diff --stat --relative=sub HEAD^ >actual &&
	test_cmp expected actual

ok 7 - --stat --relative=sub
expecting success: 
	git diff --no-abbrev --raw --relative=subdir/ HEAD^ >actual &&
	test_cmp expected actual

ok 8 - --raw --relative=subdir/
expecting success: 
	git diff --no-abbrev --raw --relative=subdir HEAD^ >actual &&
	test_cmp expected actual

ok 9 - --raw --relative=subdir
expecting success: 
	git diff --no-abbrev --raw --relative=sub HEAD^ >actual &&
	test_cmp expected actual

ok 10 - --raw --relative=sub
# passed all 10 test(s)
1..10
