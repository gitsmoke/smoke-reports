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
r1 = 40569bf73d3dfe4a8b72086e4afa282bc7b03cea (refs/remotes/trunk)
r2 = 32cf75779d84d88a221443df4cb5a78f7f7fcaf0 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = c1484c2825664bf69aefab1fa27927d2feddcd2d (refs/remotes/mybranch)
	M	subdir/file
r4 = c6afd0581712f2ab22e6f7d6c846ea9fa5bf776c (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = b0ddce752bc17f262ecdd910940475be80a1d6df (refs/remotes/mybranch)
	A	file
r1 = 0f08baad78fc5ac9f5c61e07a372969fff420bd8 (refs/remotes/tags/mytag@5)
	M	file
r4 = 6c84d20d7b7a026fd770af3d31033c86adbb8ca1 (refs/remotes/tags/mytag@5)
r6 = d152cf8ce4457ac0e5ec9e632584ebf5b11333a3 (refs/remotes/tags/mytag)
	A	file
r1 = 0f08baad78fc5ac9f5c61e07a372969fff420bd8 (refs/remotes/tags/mytag@2)
r3 = aac3abaf8a0b52a2471a3049af31f2cafa72f44a (refs/remotes/tags/mytag@5-)
	M	file
r5 = 5b0193b5b7dc26c6ca849e483bc0096ad1362f79 (refs/remotes/tags/mytag@5-)
r8 = d8a73986fe95bcd26ba49fdfe12c080eaa23fb3a (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
