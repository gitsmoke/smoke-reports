Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4044-diff-index-unique-abbrev/.git/
expecting success: 
	echo 4827 > foo &&
	git add foo &&
	git commit -m "initial" &&
	git cat-file -p HEAD: > actual &&
	test_cmp expect_initial actual &&
	echo 11742 > foo &&
	git commit -a -m "update" &&
	git cat-file -p HEAD: > actual &&
	test_cmp expect_update actual
[master (root-commit) 9559110] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master e8be75f] update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git diff HEAD^..HEAD | grep index > actual &&
	test_cmp expect actual

ok 2 - diff does not produce ambiguous index line

# passed all 2 test(s)
1..2
