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
r1 = ac6b4f010bf8615beb665134f14d4ecaf81f0263 (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 156d4d473a7679fd43f8304fdae719ec7aec8500 (refs/remotes/trunk)
	A	file
r1 = 321e39a6c20c8e58dde43dac08d6c09d879235b0 (refs/remotes/tags/mytag@2)
	M	file
r2 = 01ce7184c541766077b74bbe1aa35604194d6c54 (refs/remotes/tags/mytag@2)
r3 = 0844a4c937ed879cd5297ff4d81432c71a8ac2e8 (refs/remotes/tags/mytag)
	A	file
r1 = 54820394c0389a496c312a05a93b5962b9ea600d (refs/remotes/tags/mytag@2-)
	M	file
r2 = c2bcb6cf345217351b41f0a17750aa728ea88bb7 (refs/remotes/tags/mytag@2-)
r5 = 165d43182643058f44dcd79cdae0750e4d6e0bfc (refs/remotes/tags/mytag)
	A	file
r1 = ccf7c51c6898b50fa577d5a294cd6653efbf872c (refs/remotes/tags/mytag@2--)
	M	file
r2 = 4a382ca13524570b31bea8dc2a561624d248065d (refs/remotes/tags/mytag@2--)
r7 = d73a21b30ca4b827e9727c78aeafd04d2352d5b8 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
