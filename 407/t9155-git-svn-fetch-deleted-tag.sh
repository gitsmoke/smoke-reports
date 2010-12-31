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
r1 = 4476e0f58e09e538aca8f8322a1b3da8419b7b5c (refs/remotes/trunk)
r2 = e8e419900da87a9c2574b19b6b4577a2d2b187b0 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 525c6f73f856e26109af95b146b634fac74dffc0 (refs/remotes/mybranch)
	M	subdir/file
r4 = 702c22330e8285640e2ec4b9cb5e2d18f136f7fb (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = cbdc57587ada765e27aca9f92c5b68fd3632ba34 (refs/remotes/mybranch)
	A	file
r1 = e7fb7a18b143fabc81411bef49e536f7b626f417 (refs/remotes/tags/mytag@5)
	M	file
r4 = 2cf165711fa7f6891631cc725e96032db20aa16a (refs/remotes/tags/mytag@5)
r6 = 1838c74352da28a745ac4f9624a17c430b5e43c4 (refs/remotes/tags/mytag)
	A	file
r1 = e7fb7a18b143fabc81411bef49e536f7b626f417 (refs/remotes/tags/mytag@2)
r3 = 28688d01aa2b7cfd827cad35c2223d5e1da1bb53 (refs/remotes/tags/mytag@5-)
	M	file
r5 = f401ac509bfc47eb394338882fc79b47829364ed (refs/remotes/tags/mytag@5-)
r8 = 8e99fee98d0fac21943b3b4abbb870fffcbd1b95 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
