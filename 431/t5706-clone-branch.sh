Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5706-clone-branch/.git/
expecting success: 
	mkdir parent &&
	(cd parent && git init &&
	 echo one >file && git add file && git commit -m one &&
	 git checkout -b two &&
	 echo two >file && git add file && git commit -m two &&
	 git checkout master)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5706-clone-branch/parent/.git/
[master (root-commit) f8ed720] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[two 6fb3d26] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git clone parent clone &&
	(cd clone &&
	 check_HEAD master &&
	 check_file one
	)
Cloning into clone...
done.

ok 2 - vanilla clone chooses HEAD

expecting success: 
	git clone -b two parent clone-two &&
	(cd clone-two &&
	 check_HEAD two &&
	 check_file two
	)

Cloning into clone-two...
done.

ok 3 - clone -b chooses specified branch

expecting success: 
	(cd clone-two &&
	 echo origin >expect &&
	 git config branch.two.remote >actual &&
	 echo refs/heads/two >>expect &&
	 git config branch.two.merge >>actual &&
	 test_cmp expect actual
	)


ok 4 - clone -b sets up tracking

expecting success: 
	(cd clone-two &&
	 echo refs/remotes/origin/master >expect &&
	 git symbolic-ref refs/remotes/origin/HEAD >actual &&
	 test_cmp expect actual
	)

ok 5 - clone -b does not munge remotes/origin/HEAD

expecting success: 
	git clone -b bogus parent clone-bogus &&
	(cd clone-bogus &&
	 check_HEAD master &&
	 check_file one
	)

Cloning into clone-bogus...
done.
ok 6 - clone -b with bogus branch chooses HEAD

# passed all 6 test(s)
1..6
