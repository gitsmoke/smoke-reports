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
r1 = 2f110942e0c4e4364d72f7249ee319ee1e676a0d (refs/remotes/trunk)
r2 = 7b2e0637192281f12b03ca4486270f26c46cda9d (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 7922c30337f67b8f4b1062746eff122e9c8aa7b9 (refs/remotes/mybranch)
	M	subdir/file
r4 = bfa07db15dcc186ebc0594a35d29b66e8a53d5ce (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = e3b8dc0caf615e3a2cc49a8ccb95f7cf2f94bada (refs/remotes/mybranch)
	A	file
r1 = 8c3b2e87948468373a665872343614f012900fa6 (refs/remotes/tags/mytag@5)
	M	file
r4 = 9d7f23ba35f52c23736e0084b9e4f5136a37e3db (refs/remotes/tags/mytag@5)
r6 = 30eebd3fa2be020d1549d19007c9464328a85ad3 (refs/remotes/tags/mytag)
	A	file
r1 = 8c3b2e87948468373a665872343614f012900fa6 (refs/remotes/tags/mytag@2)
r3 = c504de5a4ede26c0875d4970a2c7e2c190d39820 (refs/remotes/tags/mytag@5-)
	M	file
r5 = ad5c5e1a057f2e7a28dff84aa68c8fb271159e8c (refs/remotes/tags/mytag@5-)
r8 = 4047f643d373240a12632d797eb323969df20809 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
