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
r1 = 2eab10eea5211001d78746ea639e83c13de34d1b (refs/remotes/trunk)
	A	a
r2 = 3dec9a0a9008757b50fc64dec69d63fc39149978 (refs/remotes/a)
	A	a
r3 = 723313a815b9b786133538e57398a65f44ca8efb (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
