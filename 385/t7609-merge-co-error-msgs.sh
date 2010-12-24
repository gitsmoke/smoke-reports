Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7609-merge-co-error-msgs/.git/
expecting success: 
	echo one >one &&
	git add one &&
	git commit -a -m First &&

	git checkout -b branch &&
	echo two >two &&
	echo three >three &&
	echo four >four &&
	echo five >five &&
	git add two three four five &&
	git commit -m Second &&

	git checkout master &&
	echo other >two &&
	echo other >three &&
	echo other >four &&
	echo other >five
[master (root-commit) 7d59940] First
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one
[branch 270dba2] Second
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 five
 create mode 100644 four
 create mode 100644 three
 create mode 100644 two

ok 1 - setup

expecting success: 
	test_must_fail git merge branch 2>out &&
	test_cmp out expect &&
	git commit --allow-empty -m empty &&
	(
		GIT_MERGE_VERBOSITY=0 &&
		export GIT_MERGE_VERBOSITY &&
		test_must_fail git merge branch 2>out2
	) &&
	test_cmp out2 expect &&
	git reset --hard HEAD^

Updating 7d59940..270dba2
Aborting
[master 32b14bf] empty
 Author: A U Thor <author@example.com>
Aborting
HEAD is now at 7d59940 First

ok 2 - untracked files overwritten by merge (fast and non-fast forward)

expecting success: 
	git add two &&
	git add three &&
	git add four &&
	test_must_fail git merge branch 2>out &&
	test_cmp out expect
Updating 7d59940..270dba2
Aborting

ok 3 - untracked files or local changes ovewritten by merge

expecting success: 
	git add five &&
	mkdir rep &&
	echo one >rep/one &&
	echo two >rep/two &&
	git add rep/one rep/two &&
	git commit -m Fourth &&
	git checkout master &&
	echo uno >rep/one &&
	echo dos >rep/two &&
	test_must_fail git checkout branch 2>out &&
	test_cmp out expect
[master a16b526] Fourth
 Author: A U Thor <author@example.com>
 6 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 five
 create mode 100644 four
 create mode 100644 rep/one
 create mode 100644 rep/two
 create mode 100644 three
 create mode 100644 two
Aborting

ok 4 - cannot switch branches because of local changes

expecting success: 
	git add rep/one rep/two &&
	test_must_fail git checkout branch 2>out &&
	test_cmp out expect
Aborting
ok 5 - not uptodate file porcelain checkout error
expecting success: 
	git init uptodate &&
	cd uptodate &&
	mkdir rep &&
	mkdir rep2 &&
	touch rep/foo &&
	touch rep2/foo &&
	git add rep/foo rep2/foo &&
	git commit -m init &&
	git checkout -b branch &&
	git rm rep -r &&
	git rm rep2 -r &&
	>rep &&
	>rep2 &&
	git add rep rep2&&
	git commit -m "added test as a file" &&
	git checkout master &&
	>rep/untracked-file &&
	>rep2/untracked-file &&
	test_must_fail git checkout branch 2>out &&
	test_cmp out ../expect
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7609-merge-co-error-msgs/uptodate/.git/
[master (root-commit) 71b8925] init
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 rep/foo
 create mode 100644 rep2/foo
rm 'rep/foo'
rm 'rep2/foo'
[branch e845e3c] added test as a file
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename rep/foo => rep (100%)
 rename rep2/foo => rep2 (100%)
Aborting
ok 6 - not_uptodate_dir porcelain checkout error
# passed all 6 test(s)
1..6
