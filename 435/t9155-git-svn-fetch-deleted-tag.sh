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
r1 = 84de6cab0ab5ffab2bf593de75f41eb70f02d3a7 (refs/remotes/trunk)
r2 = 8e01a3ba27051c352bd9bf8c9b4e6640ab0cc22b (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = b311784378a4c5f061e967cc505f2764f0953cf5 (refs/remotes/mybranch)
	M	subdir/file
r4 = a0f5a5e941fda1ffff77e6cf37e458aa70a59d6a (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 0d96ff28db4e7a7d39ef0daf9982e9af44f44ea8 (refs/remotes/mybranch)
	A	file
r1 = c52a6caa7aa84979e5a485645408b564a109452d (refs/remotes/tags/mytag@5)
	M	file
r4 = f4822db1be92fa6dbecd1435d079b86d5e224a12 (refs/remotes/tags/mytag@5)
r6 = ee02e9a9b9a49435c21489b82f793144e5bf85da (refs/remotes/tags/mytag)
	A	file
r1 = c52a6caa7aa84979e5a485645408b564a109452d (refs/remotes/tags/mytag@2)
r3 = 749ca593574a167becfb42ed47469a52439eccf7 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 760c56726aa2a2e447c494629441a341d9490e4a (refs/remotes/tags/mytag@5-)
r8 = 1d39206a214ea33317109920191837bae868fffd (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
