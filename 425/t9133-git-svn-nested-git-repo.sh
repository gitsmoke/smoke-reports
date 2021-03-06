Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9133-git-svn-nested-git-repo/.git/
expecting success: 
	svn_cmd co "$svnrepo" s &&
	(
		cd s &&
		git init &&
		test -f .git/HEAD &&
		> .git/a &&
		echo a > a &&
		svn_cmd add .git a &&
		svn_cmd commit -m "create a nested git repo" &&
		svn_cmd up &&
		echo hi >> .git/a &&
		svn_cmd commit -m "modify .git/a" &&
		svn_cmd up
	)
Checked out revision 0.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9133-git-svn-nested-git-repo/s/.git/
A         .git
A         .git/a
A         .git/branches
A         .git/config
A         .git/description
A         .git/HEAD
A         .git/hooks
A         .git/hooks/applypatch-msg.sample
A         .git/hooks/commit-msg.sample
A         .git/hooks/post-commit.sample
A         .git/hooks/post-receive.sample
A         .git/hooks/post-update.sample
A         .git/hooks/pre-applypatch.sample
A         .git/hooks/pre-commit.sample
A         .git/hooks/pre-rebase.sample
A         .git/hooks/prepare-commit-msg.sample
A         .git/hooks/update.sample
A         .git/info
A         .git/info/exclude
A         .git/objects
A         .git/objects/info
A         .git/objects/pack
A         .git/refs
A         .git/refs/heads
A         .git/refs/tags
A         a
Adding         .git
Adding         .git/HEAD
Adding         .git/a
Adding         .git/branches
Adding         .git/config
Adding         .git/description
Adding         .git/hooks
Adding         .git/hooks/applypatch-msg.sample
Adding         .git/hooks/commit-msg.sample
Adding         .git/hooks/post-commit.sample
Adding         .git/hooks/post-receive.sample
Adding         .git/hooks/post-update.sample
Adding         .git/hooks/pre-applypatch.sample
Adding         .git/hooks/pre-commit.sample
Adding         .git/hooks/pre-rebase.sample
Adding         .git/hooks/prepare-commit-msg.sample
Adding         .git/hooks/update.sample
Adding         .git/info
Adding         .git/info/exclude
Adding         .git/objects
Adding         .git/objects/info
Adding         .git/objects/pack
Adding         .git/refs
Adding         .git/refs/heads
Adding         .git/refs/tags
Adding         a
Transmitting file data ................
Committed revision 1.
At revision 1.
Sending        .git/a
Transmitting file data .
Committed revision 2.
At revision 2.

ok 1 - setup repo with a git repo inside it

expecting success: 
	git svn clone "$svnrepo" g &&
	echo a > expect &&
	test_cmp expect g/a
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9133-git-svn-nested-git-repo/g/.git/
	A	a
r1 = 2bac662ecc705e6622b8a1f6b85cf28f8ae9bad8 (refs/remotes/git-svn)
r2 = 8d887f5995765e6e5830a78f605d512af57dc72f (refs/remotes/git-svn)

ok 2 - clone an SVN repo containing a git repo

expecting success: 
	(
		cd s &&
		echo b >> a &&
		svn_cmd commit -m "SVN-side change outside of .git" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change outside of .git"
	)

Sending        a
Transmitting file data .
Committed revision 3.
At revision 3.
SVN-side change outside of .git

ok 3 - SVN-side change outside of .git

expecting success: 
	(
		cd g &&
		git svn rebase &&
		echo a > expect &&
		echo b >> expect &&
		test_cmp a expect &&
		rm expect
	)
	M	a
r3 = d7b8fb19d15d8479b483b33f78fa83f4408a7ed0 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 4 - update git svn-cloned repo

expecting success: 
	(
		cd s &&
		git add a &&
		git commit -m "add a inside an SVN repo" &&
		git log &&
		svn_cmd add --force .git &&
		svn_cmd commit -m "SVN-side change inside of .git" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change inside of .git"
	)

[master (root-commit) 3e15d4e] add a inside an SVN repo
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 a
commit 3e15d4e83dcb4aa11cd3667f851f76a3c157cc03
Author: A U Thor <author@example.com>
Date:   Thu Jan 6 04:04:46 2011 +0000

    add a inside an SVN repo
A         .git/COMMIT_EDITMSG
A  (bin)  .git/index
A         .git/logs
A         .git/logs/HEAD
A         .git/logs/refs
A         .git/logs/refs/heads
A         .git/logs/refs/heads/master
A         .git/objects/3e
A  (bin)  .git/objects/3e/15d4e83dcb4aa11cd3667f851f76a3c157cc03
A         .git/objects/42
A  (bin)  .git/objects/42/2c2b7ab3b3c668038da977e4e93a5fc623169c
A         .git/objects/a3
A  (bin)  .git/objects/a3/8e8ab7e857af7a7ac6f49fa3d3821f26fedca8
A         .git/refs/heads/master
Adding         .git/COMMIT_EDITMSG
Adding  (bin)  .git/index
Adding         .git/logs
Adding         .git/logs/HEAD
Adding         .git/logs/refs
Adding         .git/logs/refs/heads
Adding         .git/logs/refs/heads/master
Adding         .git/objects/3e
Adding  (bin)  .git/objects/3e/15d4e83dcb4aa11cd3667f851f76a3c157cc03
Adding         .git/objects/42
Adding  (bin)  .git/objects/42/2c2b7ab3b3c668038da977e4e93a5fc623169c
Adding         .git/objects/a3
Adding  (bin)  .git/objects/a3/8e8ab7e857af7a7ac6f49fa3d3821f26fedca8
Adding         .git/refs/heads/master
Transmitting file data ........
Committed revision 4.
At revision 4.
SVN-side change inside of .git

ok 5 - SVN-side change inside of .git

expecting success: 
	(
		cd g &&
		git svn rebase &&
		echo a > expect &&
		echo b >> expect &&
		test_cmp a expect &&
		rm expect
	)
r4 = b5ac123bbe77efcbefc2ae75200576c1434b7579 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 6 - update git svn-cloned repo
expecting success: 
	(
		cd s &&
		echo c >> a &&
		git add a &&
		git commit -m "add a inside an SVN repo" &&
		svn_cmd commit -m "SVN-side change in and out of .git" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change in and out of .git"
	)
[master 898e1ac] add a inside an SVN repo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Sending        .git/index
Sending        .git/logs/HEAD
Sending        .git/logs/refs/heads/master
Sending        .git/refs/heads/master
Sending        a
Transmitting file data .....
Committed revision 5.
At revision 5.
SVN-side change in and out of .git
ok 7 - SVN-side change in and out of .git
expecting success: 
	(
		cd g &&
		git svn rebase &&
		echo a > expect &&
		echo b >> expect &&
		echo c >> expect &&
		test_cmp a expect &&
		rm expect
	)
	M	a
r5 = b07c5ad9365d4b6b359e797de688877755670524 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 8 - update git svn-cloned repo again

# passed all 8 test(s)
1..8
