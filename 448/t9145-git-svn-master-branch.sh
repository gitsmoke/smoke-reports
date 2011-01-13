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
r1 = 50fe19446f3c92080ef039d8d8d9b5805b0ccfd7 (refs/remotes/trunk)
	A	a
r2 = 81ed5717aa0be92135de5dd46e486fcc90bfcd7e (refs/remotes/a)
	A	a
r3 = bf350c761fbcea71d426886a6f3a647d359195e7 (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
