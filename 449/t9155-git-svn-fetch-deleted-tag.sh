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
r1 = 31498bc01099839082e4985554353467589aeeb6 (refs/remotes/trunk)
r2 = 7452fe46b83d2799a282d1a30450ad676c1da167 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 2e19c8c6117a997664d69eacbb7b9f506b802e43 (refs/remotes/mybranch)
	M	subdir/file
r4 = 71fb872cf021d595c2866ae2cd61d618dff6fc42 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 829361a425ec18ce125ac70238953b201d04f386 (refs/remotes/mybranch)
	A	file
r1 = 72571a56263948fa9d2d6dda7b0d58cc102caba7 (refs/remotes/tags/mytag@5)
	M	file
r4 = 46717230766ebf15826a27f97d0272cddbcb99e4 (refs/remotes/tags/mytag@5)
r6 = 25793bc77effa4d5745af7bb9ec6329c28a0816e (refs/remotes/tags/mytag)
	A	file
r1 = 72571a56263948fa9d2d6dda7b0d58cc102caba7 (refs/remotes/tags/mytag@2)
r3 = a4b9f5d1a0814ec6d7571f3a7ee6ebf9142dc400 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 75f5dced969870ded5795ec4e0d898ac3ad13319 (refs/remotes/tags/mytag@5-)
r8 = 2278f25cffafc064c0b42db4da03d06e8a7a5820 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
