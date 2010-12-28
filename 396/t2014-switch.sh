Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2014-switch/.git/
expecting success: 
	echo Hello >file &&
	git add file &&
	test_tick &&
	git commit -m V1 &&
	echo Hello world >file &&
	git add file &&
	git checkout -b other
[master (root-commit) 68a43dc] V1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
M	file
ok 1 - setup
expecting success: 
	git diff --exit-code

ok 2 - check all changes are staged

expecting success: 
	git commit -m V2
[other c55967b] V2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 3 - second commit
expecting success: 
	git diff --cached --exit-code

ok 4 - check
# passed all 4 test(s)
1..4
