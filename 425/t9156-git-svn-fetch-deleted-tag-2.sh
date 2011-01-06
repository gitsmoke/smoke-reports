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
r1 = 09fde381b5a2e6086b3225e6bab5f388089d0aa9 (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 37aa5d6fdd66a38aded7ad97a3e29a04a504628a (refs/remotes/trunk)
	A	file
r1 = b4bf2982446ef2839ec1739192e17fb7b2394e82 (refs/remotes/tags/mytag@2)
	M	file
r2 = 3dcc17c7f462bcd22d23e2c07f2e8254454f3a05 (refs/remotes/tags/mytag@2)
r3 = 7313028b29724a21ff92a8b7cea00cb56881cde9 (refs/remotes/tags/mytag)
	A	file
r1 = a451983cd39144e32d0093d95f28f06c1ebc949f (refs/remotes/tags/mytag@2-)
	M	file
r2 = f9e3a8aa5c5b6214d8a99f9d03e204235c2b8ef2 (refs/remotes/tags/mytag@2-)
r5 = 0d5754db2a88bc00376741ca87cc8e7b71a3695c (refs/remotes/tags/mytag)
	A	file
r1 = 79cb6f678c3157b16c22aad979e71d24c4bd5bf2 (refs/remotes/tags/mytag@2--)
	M	file
r2 = a32efc463759e114764086deeecb3585b7fc3013 (refs/remotes/tags/mytag@2--)
r7 = 215eb023392276d16fff207567355d95162d94f4 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
