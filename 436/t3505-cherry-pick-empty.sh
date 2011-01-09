Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3505-cherry-pick-empty/.git/
expecting success: 

	echo first > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m "first" &&

	git checkout -b empty-branch &&
	test_tick &&
	git commit --allow-empty -m "empty" &&

	echo third >> file1 &&
	git add file1 &&
	test_tick &&
	git commit --allow-empty-message -m ""


[master (root-commit) 0c72e4f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[empty-branch 7ade177] empty
 Author: A U Thor <author@example.com>
[empty-branch d632cfa] 
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	git checkout master && {
		git cherry-pick empty-branch^
		test "$?" = 1
	}
Already up-to-date!
# On branch master
nothing to commit (working directory clean)

ok 2 - cherry-pick an empty commit

expecting success: 

	test ! -f .git/index.lock



ok 3 - index lockfile was removed

expecting success: 
	git checkout master && {
		git cherry-pick empty-branch
		test "$?" = 1
	}


ok 4 - cherry-pick a commit with an empty message

expecting success: 

	test ! -f .git/index.lock



ok 5 - index lockfile was removed

# passed all 5 test(s)
1..5
