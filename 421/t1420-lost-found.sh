Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1420-lost-found/.git/
expecting success: 
	git config core.logAllRefUpdates 0 &&
	: > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m initial &&
	echo 1 > file1 &&
	echo 2 > file2 &&
	git add file1 file2 &&
	test_tick &&
	git commit -m second &&
	echo 3 > file3 &&
	git add file3
[master (root-commit) 9bb1ae9] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 8ad33be] second
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 1 - setup
expecting success: 
	git rev-parse HEAD > lost-commit &&
	git rev-parse :file3 > lost-other &&
	test_tick &&
	git reset --hard HEAD^ &&
	git fsck --lost-found &&
	test 2 = $(ls .git/lost-found/*/* | wc -l) &&
	test -f .git/lost-found/commit/$(cat lost-commit) &&
	test -f .git/lost-found/other/$(cat lost-other)
HEAD is now at 9bb1ae9 initial
dangling blob 00750edc07d6415dcc07ae0351e9397b0222b7ba
dangling commit 8ad33beea8de8e15812274614acd0a26d73b60f8

ok 2 - lost and found something

# passed all 2 test(s)
1..2
