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
r1 = fd9f9f2a1d22f99ca88983e74caea450ffe0b99a (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 94109a9d45d246146abd5e64feb7f4281064abdc (refs/remotes/trunk)
	A	file
r1 = 52f4c3b5fe93c2966a25e0131671aaebc093b2bc (refs/remotes/tags/mytag@2)
	M	file
r2 = 0af3e1db679e2d687b0c6a21bb3a497c0a53ae3f (refs/remotes/tags/mytag@2)
r3 = c422e088b408097174aa6108fa5b4cf9b17cb9aa (refs/remotes/tags/mytag)
	A	file
r1 = de72682ee4cd2e0fff476e9934fc50591ec20cae (refs/remotes/tags/mytag@2-)
	M	file
r2 = 80c6652beb7e84f35dc74818ee210972bfeaa0a8 (refs/remotes/tags/mytag@2-)
r5 = ec700072d2206ccaf3e4abc3a5b0a4bbe1d173ac (refs/remotes/tags/mytag)
	A	file
r1 = 2c3128fd245484c4ae00c31e9427706afcfe56b6 (refs/remotes/tags/mytag@2--)
	M	file
r2 = e8a19d7c03f173e16779f1c2c9551aac7d8cc238 (refs/remotes/tags/mytag@2--)
r7 = 12d532ea2c0e9490bca32861fc3c0343ed902b82 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
