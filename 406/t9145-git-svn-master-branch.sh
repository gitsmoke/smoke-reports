Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9145-git-svn-master-branch/.git/
expecting success: 
	mkdir i &&
	> i/a &&
	svn_cmd import -m trunk i "$svnrepo/trunk" &&
	svn_cmd import -m b/a i "$svnrepo/branches/a" &&
	svn_cmd import -m b/b i "$svnrepo/branches/b"

Adding         i/a

Committed revision 1.
Adding         i/a

Committed revision 2.
Adding         i/a

Committed revision 3.

ok 1 - setup test repository

expecting success: 
	git svn clone -s "$svnrepo" g &&
	(
		cd g &&
		test x`git rev-parse --verify refs/remotes/trunk^0` = \
		     x`git rev-parse --verify refs/heads/master^0`
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9145-git-svn-master-branch/g/.git/
	A	a
r1 = d413e28d212d4b95cdf0cf6f84133c30d6f1433a (refs/remotes/trunk)
	A	a
r2 = 595ec177954c636b42440205368a16cac6cc54c7 (refs/remotes/a)
	A	a
r3 = 92eda145a81dae68a275aea96f2f17de2dc1e241 (refs/remotes/b)

ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
