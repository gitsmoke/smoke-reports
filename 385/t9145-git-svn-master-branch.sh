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
r1 = f5340e415eba0ff51312bd8af7f3b06992ba1090 (refs/remotes/trunk)
	A	a
r2 = c4e6b3fb7d9791e4fb3076f0f1c2151102c2e2f2 (refs/remotes/a)
	A	a
r3 = 91f7fc35193aedcc9960a37ca742a241ed2b9fe9 (refs/remotes/b)
ok 2 - git svn clone --stdlayout sets up trunk as master

# passed all 2 test(s)
1..2
