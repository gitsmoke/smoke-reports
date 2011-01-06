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
r1 = 28ccae8e18ceb0529eb2636096e520f4a36671ac (refs/remotes/trunk)
	A	a
r2 = d00d9cd985423cce1a0bee9c44f5f8d6be15e967 (refs/remotes/a)
	A	a
r3 = 0391062fa5775e5d1e61e0c12bcaca5bb9bc3ebc (refs/remotes/b)

ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
