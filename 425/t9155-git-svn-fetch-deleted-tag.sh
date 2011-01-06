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
r1 = 29e93ce981a5f0802bc552dc1658dc6ab3b6f693 (refs/remotes/trunk)
r2 = 1cb73a3fd4b3536d4ba0024eb09913d6e7f5c851 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = d443f022adb5f7b6f5eb0cdc35cb39ad764ab264 (refs/remotes/mybranch)
	M	subdir/file
r4 = ca47737037ee9e195e6d7db3035cd2e61738f011 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 47bed48c9ff58bfa72cb824a4e25733b0a476f3a (refs/remotes/mybranch)
	A	file
r1 = 5820f6e2cdedc3b92433c8ef37bde8450dbb1f04 (refs/remotes/tags/mytag@5)
	M	file
r4 = 29977fec27a4e71a0a2d1e1faef4633f8cb7161b (refs/remotes/tags/mytag@5)
r6 = be173f444515ef9428eb1fc9cda6407f726b5fcd (refs/remotes/tags/mytag)
	A	file
r1 = 5820f6e2cdedc3b92433c8ef37bde8450dbb1f04 (refs/remotes/tags/mytag@2)
r3 = b8957faa296e0353e0420112abd71e6886013282 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 7c831df994584bf403f6b56c2fcceac6a38b87ae (refs/remotes/tags/mytag@5-)
r8 = 9d56aa4af88667a24ac335b96a7bca8716f7c1e7 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
