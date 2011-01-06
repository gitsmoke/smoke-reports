Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9156-git-svn-fetch-deleted-tag-2/.git/
expecting success: 
	mkdir -p import/branches &&
	mkdir -p import/tags &&
	mkdir -p import/trunk/subdir1 &&
	mkdir -p import/trunk/subdir2 &&
	mkdir -p import/trunk/subdir3 &&
	echo "file1" >import/trunk/subdir1/file &&
	echo "file2" >import/trunk/subdir2/file &&
	echo "file3" >import/trunk/subdir3/file &&
	svn_cmd import -m "import for git svn" import "$svnrepo" &&
	rm -rf import &&

	svn_cmd co "$svnrepo/trunk" svn_project &&
	(cd svn_project &&
		echo "change1" >>subdir1/file &&
		echo "change2" >>subdir2/file &&
		echo "change3" >>subdir3/file &&
		svn_cmd ci -m "change" .
	) &&

	svn_cmd cp -m "create mytag 1" -r2 "$svnrepo/trunk/subdir1" "$svnrepo/tags/mytag" &&
	svn_cmd rm -m "delete mytag 1" "$svnrepo/tags/mytag" &&
	svn_cmd cp -m "create mytag 2" -r2 "$svnrepo/trunk/subdir2" "$svnrepo/tags/mytag" &&
	svn_cmd rm -m "delete mytag 2" "$svnrepo/tags/mytag" &&
	svn_cmd cp -m "create mytag 3" -r2 "$svnrepo/trunk/subdir3" "$svnrepo/tags/mytag"
Adding         import/trunk
Adding         import/trunk/subdir1
Adding         import/trunk/subdir1/file
Adding         import/trunk/subdir2
Adding         import/trunk/subdir2/file
Adding         import/trunk/subdir3
Adding         import/trunk/subdir3/file
Adding         import/branches
Adding         import/tags

Committed revision 1.
A    svn_project/subdir1
A    svn_project/subdir1/file
A    svn_project/subdir2
A    svn_project/subdir2/file
A    svn_project/subdir3
A    svn_project/subdir3/file
Checked out revision 1.
Sending        subdir1/file
Sending        subdir2/file
Sending        subdir3/file
Transmitting file data ...
Committed revision 2.

Committed revision 3.

Committed revision 4.

Committed revision 5.

Committed revision 6.

Committed revision 7.

ok 1 - setup svn repo

expecting success: 
	git svn init --stdlayout "$svnrepo" git_project &&
	cd git_project &&
	git svn fetch &&

	git diff --exit-code master:subdir3/file tags/mytag:file &&
	git diff --exit-code master:subdir2/file tags/mytag^:file &&
	git diff --exit-code master:subdir1/file tags/mytag^^:file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9156-git-svn-fetch-deleted-tag-2/git_project/.git/
	A	subdir1/file
	A	subdir2/file
	A	subdir3/file
r1 = c8cc9f4b91fcc4eb388cb6310113921744fd8b1b (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 514c7417354539802284dae3676a86d3c761c9b0 (refs/remotes/trunk)
	A	file
r1 = f26849e098b5360d0a16bed906c3ab70b720a0f4 (refs/remotes/tags/mytag@2)
	M	file
r2 = 4c51cbc41c52851139b159f4a39040434cfd29f8 (refs/remotes/tags/mytag@2)
r3 = a2a192b782cc3f6ac4c995ce3d92459193927aa3 (refs/remotes/tags/mytag)
	A	file
r1 = 65cfcd6ba43676147a0107922d0822f08c854ad6 (refs/remotes/tags/mytag@2-)
	M	file
r2 = a27d0258c7be770714bb61ca9184c26df5383c95 (refs/remotes/tags/mytag@2-)
r5 = 251531ba87552e514d654b616a0c2fd4afe5bf08 (refs/remotes/tags/mytag)
	A	file
r1 = ddeaa04be17f69e3fe6a7d8771369f2efc8906ca (refs/remotes/tags/mytag@2--)
	M	file
r2 = 853b686b470c157b2f2abd27e559a974991c9105 (refs/remotes/tags/mytag@2--)
r7 = 4da22ee8889907d8ff5fcd65da1ec3e901aa74c4 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
