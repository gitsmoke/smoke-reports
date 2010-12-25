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
r1 = 2b26dedb5c374501605ff3fb974bd4a56bae7369 (refs/remotes/trunk)
	A	a
r2 = d3f40d82306b4a64e2480ce7ea6e490317a66708 (refs/remotes/a)
	A	a
r3 = f3ffed96ed9346e043aaedb006f3b127c55fca62 (refs/remotes/b)

ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
