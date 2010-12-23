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
r1 = 5db44aee970306b25ef18c816b24224070d977b9 (refs/remotes/trunk)
	A	a
r2 = cb8b6d88dd7439a1c8e1dd887f51392f6b381b1d (refs/remotes/a)
	A	a
r3 = c4dfce8169dc8df569841725b15f89398b40b258 (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master
# passed all 2 test(s)
1..2
