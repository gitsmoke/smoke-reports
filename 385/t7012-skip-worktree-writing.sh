Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7012-skip-worktree-writing/.git/
expecting success: 
	test_commit init &&
	echo modified >> init.t &&
	touch added &&
	git add init.t added &&
	git commit -m "modified and added" &&
	git tag top

[master (root-commit) 2519212] init
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 init.t
[master fa1ce8e] modified and added
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 added

ok 1 - setup

expecting success: 
	git checkout -f top &&
	git update-index --skip-worktree init.t &&
	rm init.t &&
	git read-tree -m -u HEAD^ &&
	echo init > expected &&
	test_cmp expected init.t


ok 2 - read-tree updates worktree, absent case

expecting success: 
	git checkout -f top &&
	git update-index --skip-worktree init.t &&
	echo dirty >> init.t &&
	test_must_fail git read-tree -m -u HEAD^ &&
	grep -q dirty init.t &&
	test "$(git ls-files -t init.t)" = "S init.t" &&
	git update-index --no-skip-worktree init.t


ok 3 - read-tree updates worktree, dirty case

expecting success: 
	git checkout -f top &&
	git update-index --skip-worktree added &&
	rm added &&
	git read-tree -m -u HEAD^ &&
	test ! -f added
ok 4 - read-tree removes worktree, absent case
expecting success: 
	git checkout -f top &&
	git update-index --skip-worktree added &&
	echo dirty >> added &&
	test_must_fail git read-tree -m -u HEAD^ &&
	grep -q dirty added &&
	test "$(git ls-files -t added)" = "S added" &&
	git update-index --no-skip-worktree added

ok 5 - read-tree removes worktree, dirty case

expecting success: 
	git checkout -f init &&
	mkdir sub &&
	touch ./1 ./2 sub/1 sub/2 &&
	git add 1 2 sub/1 sub/2 &&
	git update-index --skip-worktree 1 sub/1 &&
	git ls-files -t > result &&
	test_cmp expected result
ok 6 - index setup

expecting success: 
	setup_absent &&
	git add 1 &&
	test_absent

ok 7 - git-add ignores worktree content

expecting success: 
	setup_dirty &&
	git add 1 &&
	test_dirty

ok 8 - git-add ignores worktree content

expecting success: 
	setup_dirty &&
	test_must_fail git rm 1 &&
	test_dirty
ok 9 - git-rm fails if worktree is dirty
expecting success: 
	setup_absent &&
	git clean -n > result &&
	test_cmp expected result

ok 10 - git-clean, absent case

expecting success: 
	setup_dirty &&
	git clean -n > result &&
	test_cmp expected result

ok 11 - git-clean, dirty case

# passed all 11 test(s)
1..11
