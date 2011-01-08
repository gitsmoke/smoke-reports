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
r1 = acc50c45096c69c57fe74606e3c685888c9ba132 (refs/remotes/trunk)
	A	a
r2 = cf220240207f129393dc9dc716d15daf48a48bef (refs/remotes/a)
	A	a
r3 = a6b4d2fcb78fa03aaee64a172684e96ffadc32e2 (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
