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
r1 = ea07945b224e32199af5467fbb53158419fa2f7c (refs/remotes/trunk)
r2 = 52248f03f903e92febecad04073711e72776c126 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 6005dadb725aa9337d111a870d508d2f933a2ce7 (refs/remotes/mybranch)
	M	subdir/file
r4 = eeb08b165daf160d97f96864167f5e447db8af4b (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = a1b29a1ea90145ffa1017925bfe7e5b85702cb71 (refs/remotes/mybranch)
	A	file
r1 = 1e6c206703853d43a597f27ebed73291998352e5 (refs/remotes/tags/mytag@5)
	M	file
r4 = ac6a71bc40663bdc11a3f579c5df503871c04990 (refs/remotes/tags/mytag@5)
r6 = b9c685b76904066e64f01f07e6d97d76e7773b12 (refs/remotes/tags/mytag)
	A	file
r1 = 1e6c206703853d43a597f27ebed73291998352e5 (refs/remotes/tags/mytag@2)
r3 = 7ca60c19df96101ba1212d53a1f65719ed7219fc (refs/remotes/tags/mytag@5-)
	M	file
r5 = fb0c4e150c00098f370e18cc14be720df4b7608b (refs/remotes/tags/mytag@5-)
r8 = ea82a1f689abc93e5fa2cdab287ade37bf807e50 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
