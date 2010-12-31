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
r1 = 72320cb4cda8353b260413e3b5b3d33d1e1a16bd (refs/remotes/trunk)
	A	a
r2 = eaeac94c7bb4d21ca5e70f8302db8cb69cf79e4d (refs/remotes/a)
	A	a
r3 = eca6f624eb8e3a3f592b192415b37d6434ed521a (refs/remotes/b)

ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
