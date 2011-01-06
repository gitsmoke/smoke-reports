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
r1 = 5f1c1e36b8de14861566d6b45f36afe3b3f79c21 (refs/remotes/trunk)
	A	a
r2 = 122dadd40bf9aab8e59d14af32480df33ce3f487 (refs/remotes/a)
	A	a
r3 = dc3f23ae5b2a8787f29e141b061af5d02058b476 (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
