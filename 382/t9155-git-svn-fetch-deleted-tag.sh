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
r1 = 6c5c2c6e0a887e64163fa826c69a07f1c18ee560 (refs/remotes/trunk)
r2 = 112700d4e25f2c0b182b8f1013e226b0ceeb580a (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 3a683787c20f5ec3f18ff45109a0d441a78c3988 (refs/remotes/mybranch)
	M	subdir/file
r4 = e70557afac553fa2866ab142ca3a07b1a89d6f85 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 6ec12c253843d2e755ae7c60d8ecd0617cf39367 (refs/remotes/mybranch)
	A	file
r1 = b85c0b3832d3a9693bef625065396e651a6b486f (refs/remotes/tags/mytag@5)
	M	file
r4 = 74d41a1c8c0b2a05b52972312d13b0902b904c77 (refs/remotes/tags/mytag@5)
r6 = 674898e6bc3cc2785ea3c8336c27b4a42c031b8a (refs/remotes/tags/mytag)
	A	file
r1 = b85c0b3832d3a9693bef625065396e651a6b486f (refs/remotes/tags/mytag@2)
r3 = 2459817abbc5538b4ef4b756aef805c181b09c5f (refs/remotes/tags/mytag@5-)
	M	file
r5 = 05f92122920e4807e0b4137fe791bf25a8ffbfd7 (refs/remotes/tags/mytag@5-)
r8 = adbedd787921f4f6ab7a8b5aa122e278adfbc4a9 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
