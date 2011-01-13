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
r1 = 5dcab5499a50218349cba2217e337c90a26f18de (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = b05234f0b7458202f08e83dd4ed2b81980fea1a9 (refs/remotes/trunk)
	A	file
r1 = 3b1715900cf9e83e48db43fc8f2cabd2894a7020 (refs/remotes/tags/mytag@2)
	M	file
r2 = dcc264d3384292cdd135d88e4ccdb68a7f8e4784 (refs/remotes/tags/mytag@2)
r3 = a72fbcb159c16ddabdac51fff22c0ed1d69afe31 (refs/remotes/tags/mytag)
	A	file
r1 = 41ee699d7a9a8448cf5ebba410dd4a2df26b7bcf (refs/remotes/tags/mytag@2-)
	M	file
r2 = f1f24a58be4a23968625d0d462159987d39ad235 (refs/remotes/tags/mytag@2-)
r5 = 7fe115d59c18afbf9c36d3b8cde26440575ff0dc (refs/remotes/tags/mytag)
	A	file
r1 = 62dc7f3faef75cdd09d5dcb0e98fe8831a92743f (refs/remotes/tags/mytag@2--)
	M	file
r2 = 7c73418726e50ba707468d187c8c0a498a9f1186 (refs/remotes/tags/mytag@2--)
r7 = 0958e1a4dbc19b1103d78d95d5d8202990ed9726 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
