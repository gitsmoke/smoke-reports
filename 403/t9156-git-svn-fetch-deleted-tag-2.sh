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
r1 = 3a7f5d498a6dc4780be1fcaa4a02748d2f275097 (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = 5eed48254d118295b2e858223ac3d3702c60e036 (refs/remotes/trunk)
	A	file
r1 = f355c82815976d545da5165e178044530988d34d (refs/remotes/tags/mytag@2)
	M	file
r2 = 7cc1673121d6a00a9e944c5c953e136e142d615b (refs/remotes/tags/mytag@2)
r3 = be33e9f2015d9bed10b9593d9a75f05b558e1ed5 (refs/remotes/tags/mytag)
	A	file
r1 = b589b5c2a3bece403f53399f4b567150c6b3ca03 (refs/remotes/tags/mytag@2-)
	M	file
r2 = c7fd781404a7ea39b3957818fea87378798ef7d7 (refs/remotes/tags/mytag@2-)
r5 = c91b2ef225ffabaeb5471dc190f270299a79f0c2 (refs/remotes/tags/mytag)
	A	file
r1 = de3d5c22fdacd622b720635ec841f4a5213f1773 (refs/remotes/tags/mytag@2--)
	M	file
r2 = 9a5e37ade39e4f1b1d71f7647e98deb0dcc7fec9 (refs/remotes/tags/mytag@2--)
r7 = 98fc2462d546bd1a7fcb0ced5f3ffe6a39f9daad (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2
