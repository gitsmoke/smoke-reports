Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3405-rebase-malformed/.git/
expecting success: 

	>file1 &&
	>file2 &&
	git add file1 file2 &&
	test_tick &&
	git commit -m "Initial commit" &&

	git checkout -b side &&
	cat F >file2 &&
	git add file2 &&
	test_tick &&
	git commit -F F &&

	git cat-file commit HEAD | sed -e "1,/^\$/d" >F0 &&

	git checkout master &&

	echo One >file1 &&
	test_tick &&
	git add file1 &&
	git commit -m "Second commit"

[master (root-commit) a8d727e] Initial commit
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
[side 5037af6] This is an example of a commit log message that does not  conform to git commit convention.
 Author: A U Thor <author@example.com>
 1 files changed, 5 insertions(+), 0 deletions(-)
[master a4fc158] Second commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git rebase master side &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" >F1 &&

	test_cmp F0 F1 &&
	test_cmp F F0

First, rewinding head to replay your work on top of it...
Applying: This is an example of a commit log message
ok 2 - rebase

# passed all 2 test(s)
1..2
