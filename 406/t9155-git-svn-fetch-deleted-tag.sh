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
r1 = a3952ef88b967f5c6dd7fe457a3c6c5b506b0c62 (refs/remotes/trunk)
r2 = 5ffd1febbe8e6ff3c911170e202d28dd3792f229 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 6dcfa03f5ac5b629c739e412a43f1ac4d83130dd (refs/remotes/mybranch)
	M	subdir/file
r4 = c3312bc495d9c46bda4db0c3c1d12eb8fa080269 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 6088cf8d3582ca1e9ce59f514c4b5544c4c78251 (refs/remotes/mybranch)
	A	file
r1 = 9ddfb57517893baef7ab68fc6cc0fad27f6d048d (refs/remotes/tags/mytag@5)
	M	file
r4 = 785ee337d8d8464fc41469efde63b36bfd316bfd (refs/remotes/tags/mytag@5)
r6 = d2b22c998f46841980a771b0f1b96661706dfb38 (refs/remotes/tags/mytag)
	A	file
r1 = 9ddfb57517893baef7ab68fc6cc0fad27f6d048d (refs/remotes/tags/mytag@2)
r3 = f6eeec2dae6a532fcdf00b8991c9df522ba3a6b1 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 7d8cfd7d5e1dc0be146eb39d3eb44cb3604b21d1 (refs/remotes/tags/mytag@5-)
r8 = acb53119ea09cd674ff73c0505a295ad855871e1 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
