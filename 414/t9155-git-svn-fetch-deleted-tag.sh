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
r1 = a997ebd4ed7224a0fb3694e63a2d1e08f15f171f (refs/remotes/trunk)
r2 = f42d41690848e7c375e83c072305b7bf3d12a9ee (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = de62e430542c799bf04f80f724134592702413db (refs/remotes/mybranch)
	M	subdir/file
r4 = f4e149828f7dad2e1c1d92146a36f2b4c522c68b (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 4d1e777315f8059d136ee322763a690e27f08128 (refs/remotes/mybranch)
	A	file
r1 = 6ba802b15efd938de17f6b5eb06a027f43a0274c (refs/remotes/tags/mytag@5)
	M	file
r4 = 9fc9b407d7c08735303e2567a82cd7f8501314e8 (refs/remotes/tags/mytag@5)
r6 = 1574fa16d04d25a393f1b6e879b747d14ee334d5 (refs/remotes/tags/mytag)
	A	file
r1 = 6ba802b15efd938de17f6b5eb06a027f43a0274c (refs/remotes/tags/mytag@2)
r3 = b09dc427bd1e1a3ab8f2094fdb99c7261d11a6e1 (refs/remotes/tags/mytag@5-)
	M	file
r5 = a09169021017517951312621cc36215ba426f30d (refs/remotes/tags/mytag@5-)
r8 = 949c0f9f589e3c63375f9f6e0c3db2d133e7f335 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
