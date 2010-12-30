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
r1 = 8999501c57a70670ef4f2caed31822b024abb522 (refs/remotes/trunk)
	A	a
r2 = 1bf4d35e9e5f108a3f9fa2b25c1554f3a33d02c0 (refs/remotes/a)
	A	a
r3 = d33e034b46973caf723050460fb8425874db8e0f (refs/remotes/b)

ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
