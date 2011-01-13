Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3503-cherry-pick-root/.git/
expecting success: 

	echo first > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m "first" &&

	git symbolic-ref HEAD refs/heads/second &&
	rm .git/index file1 &&
	echo second > file2 &&
	git add file2 &&
	test_tick &&
	git commit -m "second"


[master (root-commit) 0c72e4f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[second (root-commit) bbcd39a] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 1 - setup

expecting success: 

	git cherry-pick master &&
	test first = $(cat file1)
[second d3666c9] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 2 - cherry-pick a root commit

# passed all 2 test(s)
1..2
