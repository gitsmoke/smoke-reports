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
r1 = 8e596ce24058b8a9c9fe689e6478e5ee9a72cad1 (refs/remotes/trunk)
r2 = c3bca19bb4c669b7148ec1b52481e5317855a3b9 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 209911c9f5f154851abcdea411501e5c43b85a3c (refs/remotes/mybranch)
	M	subdir/file
r4 = 133344c6463b4118fd5f0a41aac44922d062a2b9 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 7749f36997df554e36ce5c91f9a1b9a9c23d0079 (refs/remotes/mybranch)
	A	file
r1 = fdb81e3c7d5e4c64dfef23a75ca31b646f02b94e (refs/remotes/tags/mytag@5)
	M	file
r4 = 0071a9dd17d4ddbc055dcc024647c820d87a7ac8 (refs/remotes/tags/mytag@5)
r6 = 62c370faf48422e24340039eb819e7c95232e871 (refs/remotes/tags/mytag)
	A	file
r1 = fdb81e3c7d5e4c64dfef23a75ca31b646f02b94e (refs/remotes/tags/mytag@2)
r3 = 32d3427a47454e663236512889102a8d3d66cd5f (refs/remotes/tags/mytag@5-)
	M	file
r5 = e6153d2a7ca4f8847d6f8da70a9429ca97f1edd8 (refs/remotes/tags/mytag@5-)
r8 = 5b67c3903723c66ffd02e9fe43f1b5b85f7a0ab8 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
