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
r1 = 93726b1cfb847c7c91ecfb4d382358df80f941a4 (refs/remotes/trunk)
r2 = c9eea29d8c322c0e56080e486ec2950c4e835372 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 3bf8abb3eb590d5928fdf4c24f78dbf1560b7202 (refs/remotes/mybranch)
	M	subdir/file
r4 = 1b6cd01983a21ddbc66860f851d09a09a5191f7d (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = de37caab94c158e09d777d169813aa9949a9faa0 (refs/remotes/mybranch)
	A	file
r1 = ba5506cff020ab8328dc7e374b28ee98e577c6c6 (refs/remotes/tags/mytag@5)
	M	file
r4 = 843ec4a61b7d0cd29074813cfe0d7f6fa4115543 (refs/remotes/tags/mytag@5)
r6 = 2a45c667a68c2728a22b9e843e07537ea94daca7 (refs/remotes/tags/mytag)
	A	file
r1 = ba5506cff020ab8328dc7e374b28ee98e577c6c6 (refs/remotes/tags/mytag@2)
r3 = 49f16cac0ab59039b2becf72a7b672f09525f0b4 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 019e5e1e612cd5559b637dd93650bee685173a86 (refs/remotes/tags/mytag@5-)
r8 = 7a863b44ab41c911845b051d811328140179fd86 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
