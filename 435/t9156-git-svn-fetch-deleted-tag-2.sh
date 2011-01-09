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
r1 = fd7597ab7b0020d81f85166c07d5f1a76b9ddec8 (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 4090cb1d87f4a82bb4d9ba121b39f52e722ef155 (refs/remotes/trunk)
	A	file
r1 = f672ea3399160f060311c77fde33efefd80f0d3e (refs/remotes/tags/mytag@2)
	M	file
r2 = d2347bac69b04178604516175b50317df4e537cb (refs/remotes/tags/mytag@2)
r3 = 5a3d44a1a3d180ad9cd5231d982cc7dc8dd14b87 (refs/remotes/tags/mytag)
	A	file
r1 = f3ab4d675eda0af67bbccc379a664578cfa4adf0 (refs/remotes/tags/mytag@2-)
	M	file
r2 = 6e841e6da86ed739de8aeba707e8b84437ff1257 (refs/remotes/tags/mytag@2-)
r5 = 63f43343c6501fbd32c0748d4e2f4e2b1987f056 (refs/remotes/tags/mytag)
	A	file
r1 = 0eeefcc0fb2440dfa023849c875589ef232486d7 (refs/remotes/tags/mytag@2--)
	M	file
r2 = 9e7e2040ca334a0f078f5844cf1033b8898c2ce8 (refs/remotes/tags/mytag@2--)
r7 = 47de825045a8dfbee77d9195486cde0783d6a2a6 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
