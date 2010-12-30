Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7011-skip-worktree-reading/.git/
expecting success: 
	test_commit init &&
	mkdir sub &&
	touch ./1 ./2 sub/1 sub/2 &&
	git add 1 2 sub/1 sub/2 &&
	git update-index --skip-worktree 1 sub/1 &&
	git ls-files -t > result &&
	test_cmp expect.skip result
[master (root-commit) 2519212] init
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 init.t

ok 1 - setup

expecting success: 
	setup_absent &&
	git update-index 1 &&
	test_absent


ok 2 - update-index

expecting success: 
	setup_dirty &&
	git update-index 1 &&
	test_dirty


ok 3 - update-index

expecting success: 
	setup_absent &&
	git update-index --remove 1 &&
	test -z "$(git ls-files 1)" &&
	test ! -f 1

ok 4 - update-index --remove

expecting success: 
	setup_dirty &&
	git update-index --remove 1 &&
	test -z "$(git ls-files 1)" &&
	echo dirty > expected &&
	test_cmp expected 1


ok 5 - update-index --remove

expecting success: 
	setup_absent &&
	test -z "$(git ls-files -d)"


ok 6 - ls-files --delete

expecting success: 
	setup_dirty &&
	test -z "$(git ls-files -d)"


ok 7 - ls-files --delete

expecting success: 
	setup_absent &&
	test -z "$(git ls-files -m)"


ok 8 - ls-files --modified

expecting success: 
	setup_dirty &&
	test -z "$(git ls-files -m)"


ok 9 - ls-files --modified

expecting success: 
	git update-index --no-skip-worktree 1 &&
	echo test > 1 &&
	git update-index 1 &&
	git update-index --skip-worktree 1 &&
	rm 1 &&
	test "$(git grep --no-ext-grep test)" = "1:test"


ok 10 - grep with skip-worktree file

expecting success: 
	setup_absent &&
	git diff-index HEAD -- 1 > result &&
	test_cmp expected result


ok 11 - diff-index does not examine skip-worktree absent entries

expecting success: 
	setup_dirty &&
	git diff-index HEAD -- 1 > result &&
	test_cmp expected result


ok 12 - diff-index does not examine skip-worktree dirty entries

expecting success: 
	setup_absent &&
	test -z "$(git diff-files -- one)"


ok 13 - diff-files does not examine skip-worktree absent entries

expecting success: 
	setup_dirty &&
	test -z "$(git diff-files -- one)"


ok 14 - diff-files does not examine skip-worktree dirty entries

expecting success: 
	setup_absent &&
	git rm 1

rm '1'

ok 15 - git-rm succeeds on skip-worktree absent entries

expecting success: 
	git reset &&
	setup_absent &&
	test_must_fail git commit -m null 1

# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	2
#	expect.full
#	expect.skip
#	expected
#	result
#	sub/
nothing added to commit but untracked files present (use "git add" to track)

ok 16 - commit on skip-worktree absent entries

expecting success: 
	git reset &&
	setup_dirty &&
	test_must_fail git commit -m null 1

# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	1
#	2
#	expect.full
#	expect.skip
#	expected
#	result
#	sub/
nothing added to commit but untracked files present (use "git add" to track)

ok 17 - commit on skip-worktree dirty entries

# passed all 17 test(s)
1..17
