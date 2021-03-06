Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4103-apply-binary/.git/
expecting success: 
	git update-index --add --remove file1 file2 file4 &&
	git commit -m 'Initial Version' 2>/dev/null &&

	git checkout -b binary &&
	perl -pe 'y/x/ /' <file1 >file3 &&
	cat file3 >file4 &&
	git add file2 &&
	perl -pe 'y/ /v/' <file3 >file1 &&
	rm -f file2 &&
	git update-index --add --remove file1 file2 file3 file4 &&
	git commit -m 'Second Version' &&

	git diff-tree -p master binary >B.diff &&
	git diff-tree -p -C master binary >C.diff &&

	git diff-tree -p --binary master binary >BF.diff &&
	git diff-tree -p --binary -C master binary >CF.diff &&

	git diff-tree -p --full-index master binary >B-index.diff &&
	git diff-tree -p -C --full-index master binary >C-index.diff &&

	git init other-repo &&
	(cd other-repo &&
	 git fetch .. master &&
	 git reset --hard FETCH_HEAD
	)
[master (root-commit) a4341c8] Initial Version
 Author: A U Thor <author@example.com>
 3 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
 create mode 100644 file4
[binary 2bc9e6b] Second Version
 Author: A U Thor <author@example.com>
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename file2 => file3 (57%)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4103-apply-binary/other-repo/.git/
HEAD is now at a4341c8 Initial Version

ok 1 - setup

expecting success: git checkout master &&
	 git apply --stat --summary B.diff
 file1 |    4 ++--
 file2 |    5 -----
 file3 |  Bin
 file4 |  Bin
 4 files changed, 2 insertions(+), 7 deletions(-)
 delete mode 100644 file2
 create mode 100644 file3

ok 2 - stat binary diff -- should not fail.

expecting success: git checkout master &&
	 git apply --stat --summary C.diff
 file1 |    4 ++--
 file3 |  Bin
 file4 |  Bin
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename file2 => file3 (57%)

ok 3 - stat binary diff (copy) -- should not fail.

expecting success: git checkout master &&
	 test_must_fail git apply --check B.diff
ok 4 - check binary diff -- should fail.

expecting success: git checkout master &&
	 test_must_fail git apply --check C.diff
ok 5 - check binary diff (copy) -- should fail.
expecting success: 
	git checkout master &&
	test_must_fail git apply --check --allow-binary-replacement B.diff
ok 6 - check incomplete binary diff with replacement -- should fail.

expecting success: 
	 git checkout master &&
	 test_must_fail git apply --check --allow-binary-replacement C.diff

ok 7 - check incomplete binary diff with replacement (copy) -- should fail.

expecting success: git checkout master &&
	 git apply --check --allow-binary-replacement BF.diff
ok 8 - check binary diff with replacement.

expecting success: git checkout master &&
	 git apply --check --allow-binary-replacement CF.diff
ok 9 - check binary diff with replacement (copy).

expecting success: do_reset &&
	 test_must_fail git apply B.diff
HEAD is now at a4341c8 Initial Version
ok 10 - apply binary diff -- should fail.

expecting success: do_reset &&
	 test_must_fail git apply --index B.diff
HEAD is now at a4341c8 Initial Version
ok 11 - apply binary diff -- should fail.

expecting success: do_reset &&
	 test_must_fail git apply C.diff
HEAD is now at a4341c8 Initial Version
ok 12 - apply binary diff (copy) -- should fail.
expecting success: do_reset &&
	 test_must_fail git apply --index C.diff
HEAD is now at a4341c8 Initial Version
ok 13 - apply binary diff (copy) -- should fail.

expecting success: 
	do_reset &&
	git apply B-index.diff
HEAD is now at a4341c8 Initial Version
ok 14 - apply binary diff with full-index

expecting success: 
	do_reset &&
	git apply C-index.diff
HEAD is now at a4341c8 Initial Version
ok 15 - apply binary diff with full-index (copy)
expecting success: 
	(cd other-repo &&
	 do_reset &&
	 test_must_fail git apply ../B-index.diff)
HEAD is now at a4341c8 Initial Version
ok 16 - apply full-index binary diff in new repo
expecting success: do_reset &&
	 git apply BF.diff
HEAD is now at a4341c8 Initial Version

ok 17 - apply binary diff without replacement.

expecting success: do_reset &&
	 git apply CF.diff
HEAD is now at a4341c8 Initial Version

ok 18 - apply binary diff without replacement (copy).

expecting success: do_reset &&
	 git apply --allow-binary-replacement --index BF.diff &&
	 test -z "$(git diff --name-status binary)"
HEAD is now at a4341c8 Initial Version
ok 19 - apply binary diff.
expecting success: do_reset &&
	 git apply --allow-binary-replacement --index CF.diff &&
	 test -z "$(git diff --name-status binary)"
HEAD is now at a4341c8 Initial Version
ok 20 - apply binary diff (copy).

# passed all 20 test(s)
1..20
