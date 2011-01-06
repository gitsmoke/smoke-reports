Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9155-git-svn-fetch-deleted-tag/.git/
expecting success: 
	mkdir -p import/trunk/subdir &&
	mkdir -p import/branches &&
	mkdir -p import/tags &&
	echo "base" >import/trunk/subdir/file &&
	svn_cmd import -m "import for git svn" import "$svnrepo" &&
	rm -rf import &&

	svn_cmd mkdir -m "create mybranch directory" "$svnrepo/branches/mybranch" &&
	svn_cmd cp -m "create branch mybranch" "$svnrepo/trunk" "$svnrepo/branches/mybranch/trunk" &&

	svn_cmd co "$svnrepo/trunk" svn_project &&
	(cd svn_project &&
		echo "trunk change" >>subdir/file &&
		svn_cmd ci -m "trunk change" subdir/file &&

		svn_cmd switch "$svnrepo/branches/mybranch/trunk" &&
		echo "branch change" >>subdir/file &&
		svn_cmd ci -m "branch change" subdir/file
	) &&

	svn_cmd cp -m "create mytag attempt 1" -r5 "$svnrepo/trunk/subdir" "$svnrepo/tags/mytag" &&
	svn_cmd rm -m "delete mytag attempt 1" "$svnrepo/tags/mytag" &&
	svn_cmd cp -m "create mytag attempt 2" -r5 "$svnrepo/branches/mybranch/trunk/subdir" "$svnrepo/tags/mytag"
Adding         import/trunk
Adding         import/trunk/subdir
Adding         import/trunk/subdir/file
Adding         import/branches
Adding         import/tags

Committed revision 1.

Committed revision 2.

Committed revision 3.
A    svn_project/subdir
A    svn_project/subdir/file
Checked out revision 3.
Sending        subdir/file
Transmitting file data .
Committed revision 4.
U    subdir/file
Updated to revision 4.
Sending        subdir/file
Transmitting file data .
Committed revision 5.

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 1 - setup svn repo

expecting success: 
	git svn init --stdlayout "$svnrepo" git_project &&
	cd git_project &&
	git svn fetch &&

	git diff --exit-code mybranch:trunk/subdir/file tags/mytag:file &&
	git diff --exit-code master:subdir/file tags/mytag^:file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9155-git-svn-fetch-deleted-tag/git_project/.git/
	A	subdir/file
r1 = 8d4b0ca5ef5485f9f34c1f4092603343af84bf91 (refs/remotes/trunk)
r2 = dd174641c66f9ad212c5dcbb31b48902c8a7a3e6 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 259a2242ca5a791d9aabb3600f99a41f5cafc66c (refs/remotes/mybranch)
	M	subdir/file
r4 = 3041b25c0e39ff2b351de705b730fcdfac1ecc3f (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 5ac4f6a19aa4d394d73e37083ffa2270e46011d2 (refs/remotes/mybranch)
	A	file
r1 = 106d6ac8f8cbe7b79dc78e08648549f8b1705427 (refs/remotes/tags/mytag@5)
	M	file
r4 = 51aa6742c44de83e8e8dbec7291c9e9191fddc5d (refs/remotes/tags/mytag@5)
r6 = 4942d6e3348ab4c66b48cf4af7d98a8aff5d22e1 (refs/remotes/tags/mytag)
	A	file
r1 = 106d6ac8f8cbe7b79dc78e08648549f8b1705427 (refs/remotes/tags/mytag@2)
r3 = f4f79d408efc921172439bf09aefca50abd75292 (refs/remotes/tags/mytag@5-)
	M	file
r5 = f47feb05aa802721b8ab0fac43262ad323dd0cf9 (refs/remotes/tags/mytag@5-)
r8 = 939d1eb6f6eb0d7344830a4f911e363bf6f67ca4 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
