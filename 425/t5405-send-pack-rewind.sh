Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5405-send-pack-rewind/.git/
expecting success: 

	>file1 && git add file1 && test_tick &&
	git commit -m Initial &&
	git config receive.denyCurrentBranch warn &&

	mkdir another && (
		cd another &&
		git init &&
		git fetch --update-head-ok .. master:master
	) &&

	>file2 && git add file2 && test_tick &&
	git commit -m Second
[master (root-commit) de5945f] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5405-send-pack-rewind/another/.git/
[master 3dc47c1] Second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 1 - setup

expecting success: 

	(
		cd another &&
		git push .. master:master
		test $? = 1
	)



ok 2 - non forced push should die not segfault

expecting success: 

	(
		cd another &&
		git push .. +master:master
	)
ok 3 - forced push should succeed

# passed all 3 test(s)
1..3
