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
r1 = fe7f03aa472636fed1512095d584a1295abca2cb (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 9f2cd2d777abd8e7dc37a99351e8ea5d5ac56876 (refs/remotes/trunk)
	A	file
r1 = 455f72520d9aab3d6c993a619b10239226f6ae4a (refs/remotes/tags/mytag@2)
	M	file
r2 = f1246349273676d8e252aa2d1b92aad24121ef1b (refs/remotes/tags/mytag@2)
r3 = a77e1ee78489f2f1d260cdad5838aed16e3c111d (refs/remotes/tags/mytag)
	A	file
r1 = 03edb1f42a4a2df75f16f1517bd175e1042f8ff0 (refs/remotes/tags/mytag@2-)
	M	file
r2 = 21915fe45ae65d0b07491d95772fd406838202dd (refs/remotes/tags/mytag@2-)
r5 = f96866e1e21293078b33bf0f8855dade63df56fd (refs/remotes/tags/mytag)
	A	file
r1 = 978539c65b0add901a46c4d8992f132b5803139f (refs/remotes/tags/mytag@2--)
	M	file
r2 = d04217445f0c327b8e42c660d884d8ad7b9936e3 (refs/remotes/tags/mytag@2--)
r7 = eb37c5618fd3cb8234e784c55a5b8a53af82ef16 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
