Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5513-fetch-track/.git/
expecting success: 
	>file &&
	git add . &&
	test_tick &&
	git commit -m Initial &&
	git branch b-0 &&
	git branch b1 &&
	git branch b/one &&
	test_create_repo other &&
	(
		cd other &&
		git config remote.origin.url .. &&
		git config remote.origin.fetch "+refs/heads/b/*:refs/remotes/b/*"
	)
[master (root-commit) 9d34b14] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5513-fetch-track/other/.git/

ok 1 - setup

expecting success: 
	(
		cd other && git fetch origin &&
		test "$(git for-each-ref --format="%(refname)")" = refs/remotes/b/one
	)

ok 2 - fetch

# passed all 2 test(s)
1..2
