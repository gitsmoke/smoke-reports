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
r1 = 4fb81be9bf453dd7b5027077b024e47a354d5b92 (refs/remotes/trunk)
r2 = b8fc6b794e9ffa35e2b363404865bf399c084493 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 8c4ebb5a1992a840f08b8c17e7520edc782bbc9c (refs/remotes/mybranch)
	M	subdir/file
r4 = 50aa579c05ef59ef5bd443c51b39c78fcb56b915 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 3e1f53244773e231d2b9fe45a8b4b3a55c1798b4 (refs/remotes/mybranch)
	A	file
r1 = f26e46104e45c914efe2a3e4f42c045d92df3b37 (refs/remotes/tags/mytag@5)
	M	file
r4 = c17f9b2329d45c8de1f3844850079cfe23ef9631 (refs/remotes/tags/mytag@5)
r6 = 5ef16c290399598ce4dfcc94d5cc827e7b30bdd5 (refs/remotes/tags/mytag)
	A	file
r1 = f26e46104e45c914efe2a3e4f42c045d92df3b37 (refs/remotes/tags/mytag@2)
r3 = e2a351b782a79ca692362917992f2af7b67edf8e (refs/remotes/tags/mytag@5-)
	M	file
r5 = 8c2d42382b0a937a14b3f0430a307ee0440a8784 (refs/remotes/tags/mytag@5-)
r8 = 7a470a915e85172e6c6f70fb20bdf09b7c8792d7 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
