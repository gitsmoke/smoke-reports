Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2202-add-addremove/.git/
expecting success: 
	(
		echo .gitignore
		echo will-remove
	) >expect &&
	(
		echo actual
		echo expect
		echo ignored
	) >.gitignore &&
	>will-remove &&
	git add --all &&
	test_tick &&
	git commit -m initial &&
	git ls-files >actual &&
	test_cmp expect actual
[master (root-commit) 50dd5d8] initial
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 will-remove

ok 1 - setup
expecting success: 
	(
		echo .gitignore
		echo not-ignored
		echo "M	.gitignore"
		echo "A	not-ignored"
		echo "D	will-remove"
	) >expect &&
	>ignored &&
	>not-ignored &&
	echo modification >>.gitignore &&
	rm -f will-remove &&
	git add --all &&
	git update-index --refresh &&
	git ls-files >actual &&
	git diff-index --name-status --cached HEAD >>actual &&
	test_cmp expect actual

ok 2 - git add --all

# passed all 2 test(s)
1..2
