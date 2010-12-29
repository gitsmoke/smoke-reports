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
r1 = fbea83fb62bdaa73519bacc9d523c4148d0efd5d (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = c16bf61f08212516fed8036c69c6634b4c27c23d (refs/remotes/trunk)
	A	file
r1 = 1ef535129fe114edfef5d6dc055552ec40f730f0 (refs/remotes/tags/mytag@2)
	M	file
r2 = 88104e0aee05020e4da3c523374dc51c17bbd178 (refs/remotes/tags/mytag@2)
r3 = 99e0106b7bb6beef86b5c3cffb689dd26c0e92ea (refs/remotes/tags/mytag)
	A	file
r1 = 98ea0b8a8708eb7f9f70d1c607480f8e9ff823eb (refs/remotes/tags/mytag@2-)
	M	file
r2 = 5e51332ac33850cea03bb79329fbda7c9b821a6f (refs/remotes/tags/mytag@2-)
r5 = 6c0b685bb6571d58e0c8ed4ac9a584b082aafa7c (refs/remotes/tags/mytag)
	A	file
r1 = 2eec3fcfaebdc527c4413563779a572646c3c78e (refs/remotes/tags/mytag@2--)
	M	file
r2 = 0354b6d8f7ece6c74f8043bba7d57e78b5772057 (refs/remotes/tags/mytag@2--)
r7 = 7e84a9fc5def673a41bfe44004ca8fecd2fd4b3b (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
