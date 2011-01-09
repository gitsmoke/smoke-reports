Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2018-checkout-branch/.git/
expecting success: 
	test_commit initial file1 &&
	HEAD1=$(git rev-parse --verify HEAD) &&

	test_commit change1 file1 &&
	HEAD2=$(git rev-parse --verify HEAD) &&

	git branch -m branch1

[master (root-commit) ee02a18] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 5be17a9] change1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	do_checkout branch2


ok 2 - checkout -b to a new branch, set to HEAD

expecting success: 
	git checkout branch1 &&
	git branch -D branch2 &&

	do_checkout branch2 $HEAD1
Deleted branch branch2 (was 5be17a9).

ok 3 - checkout -b to a new branch, set to an explicit ref

expecting success: 
	git checkout branch1 &&

	# clean up from previous test
	git branch -D branch2 &&

	setup_dirty_unmergeable &&
	test_must_fail do_checkout branch2 $HEAD1 &&
	test_dirty_unmergeable

Deleted branch branch2 (was ee02a18).
Aborting

ok 4 - checkout -b to a new branch with unmergeable changes fails

expecting success: 
	# still dirty and on branch1
	do_checkout branch2 $HEAD1 "-f -b" &&
	test_must_fail test_dirty_unmergeable


ok 5 - checkout -f -b to a new branch with unmergeable changes discards changes

expecting success: 
	git checkout branch1 &&

	# clean up from previous test
	git branch -D branch2 &&

	setup_dirty_mergeable &&
	do_checkout branch2 $HEAD1 &&
	test_dirty_mergeable

Deleted branch branch2 (was ee02a18).
A	file2
ok 6 - checkout -b to a new branch preserves mergeable changes

expecting success: 
	# clean up from previous test
	git reset --hard &&

	git checkout branch1 &&

	# clean up from previous test
	git branch -D branch2 &&

	setup_dirty_mergeable &&
	do_checkout branch2 $HEAD1 "-f -b" &&
	test_must_fail test_dirty_mergeable

HEAD is now at ee02a18 initial
Deleted branch branch2 (was ee02a18).

ok 7 - checkout -f -b to a new branch with mergeable changes discards changes

expecting success: 
	git reset --hard HEAD &&

	test_must_fail do_checkout branch2 $HEAD2

HEAD is now at ee02a18 initial

ok 8 - checkout -b to an existing branch fails

expecting success: 
	git checkout branch1 &&

	do_checkout branch2 "" -B

ok 9 - checkout -B to an existing branch resets branch to HEAD

expecting success: 
	git checkout $(git rev-parse --verify HEAD) &&

	do_checkout branch2 "" -B


ok 10 - checkout -B to an existing branch from detached HEAD resets branch to HEAD

expecting success: 
	git checkout branch1 &&

	do_checkout branch2 $HEAD1 -B


ok 11 - checkout -B to an existing branch with an explicit ref resets branch to that ref

expecting success: 
	git checkout branch1 &&

	setup_dirty_unmergeable &&
	test_must_fail do_checkout branch2 $HEAD1 -B &&
	test_dirty_unmergeable

Aborting

ok 12 - checkout -B to an existing branch with unmergeable changes fails

expecting success: 
	# still dirty and on branch1
	do_checkout branch2 $HEAD1 "-f -B" &&
	test_must_fail test_dirty_unmergeable

ok 13 - checkout -f -B to an existing branch with unmergeable changes discards changes

expecting success: 
	git checkout branch1 &&

	setup_dirty_mergeable &&
	do_checkout branch2 $HEAD1 -B &&
	test_dirty_mergeable

A	file2

ok 14 - checkout -B to an existing branch preserves mergeable changes

expecting success: 
	# clean up from previous test
	git reset --hard &&

	git checkout branch1 &&

	setup_dirty_mergeable &&
	do_checkout branch2 $HEAD1 "-f -B" &&
	test_must_fail test_dirty_mergeable

HEAD is now at ee02a18 initial

ok 15 - checkout -f -B to an existing branch with mergeable changes discards changes

# passed all 15 test(s)
1..15
