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
r1 = 483f8680f11432d4379f1077ced53dd19ad7520b (refs/remotes/trunk)
r2 = 2bc205d07d23997f3cf8b300306a396126637781 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = b92a1da9971e26372b3de69c3b9457959388dcea (refs/remotes/mybranch)
	M	subdir/file
r4 = 29d913587c4c6df2719632b08975a246682b0d98 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 96e18399bff2e9457b46cdc6b617e9bf96b0ed68 (refs/remotes/mybranch)
	A	file
r1 = caa6c4bb98d3ae002dbd6702477edc8ead955d6a (refs/remotes/tags/mytag@5)
	M	file
r4 = e06adec35c7fea7591aa463ecbedb823faae13cf (refs/remotes/tags/mytag@5)
r6 = d7d639c58895b52a060972179028455768e99e8a (refs/remotes/tags/mytag)
	A	file
r1 = caa6c4bb98d3ae002dbd6702477edc8ead955d6a (refs/remotes/tags/mytag@2)
r3 = d97eafdfc89c87cf8bbbc2d10a79f1b1388641d2 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 2c88d3cb8589dc3b6c7b9e5bd72d8f95441390b4 (refs/remotes/tags/mytag@5-)
r8 = 0b69745275a8928203fc120110fe5270e3411df2 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
