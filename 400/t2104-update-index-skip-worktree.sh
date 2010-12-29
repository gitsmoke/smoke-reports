Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2104-update-index-skip-worktree/.git/
expecting success: 
	mkdir sub &&
	touch ./1 ./2 sub/1 sub/2 &&
	git add 1 2 sub/1 sub/2 &&
	git ls-files -t | test_cmp expect.full -


ok 1 - setup

expecting success: 
	test "$(test-index-version < .git/index)" = 2


ok 2 - index is at version 2

expecting success: 
	git update-index --skip-worktree 1 sub/1 &&
	git ls-files -t | test_cmp expect.skip -

ok 3 - update-index --skip-worktree

expecting success: 
	test "$(test-index-version < .git/index)" = 3

ok 4 - index is at version 3 after having some skip-worktree entries
expecting success: 
	git ls-files -t | test_cmp expect.skip -

ok 5 - ls-files -t
expecting success: 
	git update-index --no-skip-worktree 1 sub/1 &&
	git ls-files -t | test_cmp expect.full -

ok 6 - update-index --no-skip-worktree
expecting success: 
	test "$(test-index-version < .git/index)" = 2

ok 7 - index version is back to 2 when there is no skip-worktree entry

# passed all 7 test(s)
1..7
