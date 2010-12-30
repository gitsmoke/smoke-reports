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
r1 = d1b7867f8ffc6f1da35b84d0f35d227fca25c84a (refs/remotes/trunk)
r2 = 0361785795f3a31aa08c8dc91a32bd54aac17efe (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = ebf6e9c35803f522db6aaed0b6fe75954d290d22 (refs/remotes/mybranch)
	M	subdir/file
r4 = 7f4df5c8e8aa9b69e027157fa6776cbdf443a6ae (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 7bfe14420eeb7d2daa2a057886c7372cb1b84a58 (refs/remotes/mybranch)
	A	file
r1 = ecb312a246fc35bbbd00ed05c61740344e387e71 (refs/remotes/tags/mytag@5)
	M	file
r4 = 2a12f1d0cc3c1cc4b712ea4c4b8ff8d4dd271fcf (refs/remotes/tags/mytag@5)
r6 = 6d59b8c8099cc13b485cd921c684c580ce60ca50 (refs/remotes/tags/mytag)
	A	file
r1 = ecb312a246fc35bbbd00ed05c61740344e387e71 (refs/remotes/tags/mytag@2)
r3 = eefe150ccfe8b426e126398aee9ed6783f93467c (refs/remotes/tags/mytag@5-)
	M	file
r5 = f583636ac3f871e3c68fba3f14bff55ed5aa701a (refs/remotes/tags/mytag@5-)
r8 = fd4e695a7713999dde00e9c6e48eca33c680d173 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
