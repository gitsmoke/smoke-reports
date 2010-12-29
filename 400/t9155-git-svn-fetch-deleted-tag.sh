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
r1 = de9ddca35801866c28616699850b593543b0ec91 (refs/remotes/trunk)
r2 = 3ceca73135529c08cecb1942927744ca570b8def (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = fa8d130a6787941dc572b64e9b975b633f0d3eb0 (refs/remotes/mybranch)
	M	subdir/file
r4 = f33a975e6548e352c853bdc6082b9d542d952936 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 75fb3d8334178c98d1f9ec1e6c7e6ef82b2d8b33 (refs/remotes/mybranch)
	A	file
r1 = 1a089d315fac24c3270a78c79f8f4ff971d635ff (refs/remotes/tags/mytag@5)
	M	file
r4 = cf85e62cb85e34a05195f0fd222eac67d2ec4f9b (refs/remotes/tags/mytag@5)
r6 = 855853aa2fa56001ae33196ea84f217a2e427b6c (refs/remotes/tags/mytag)
	A	file
r1 = 1a089d315fac24c3270a78c79f8f4ff971d635ff (refs/remotes/tags/mytag@2)
r3 = bd98f446472a12d3430c32a5d5928f3ba2c23616 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 289cf9fd3fe38687bfcad2e7da07d2e10a0b55ea (refs/remotes/tags/mytag@5-)
r8 = d2bcc34c9cf7df8bf6d433958fe8899f1a015a18 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
