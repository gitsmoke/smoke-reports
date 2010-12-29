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
r1 = d90b3bbe8266552a4faab828be66a0e860812eb2 (refs/remotes/trunk)
r2 = 3fc9b222960b22ab53bd650a6c4c714ebe8b0f2c (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 69200cfdc1f08ef15cf960c0634fd7e00e71b5e8 (refs/remotes/mybranch)
	M	subdir/file
r4 = 6ef0d537af5565af808d41c2e0ffa9c53c4c9891 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = f735ca1f73c4130b8738249a8c082089aeb86945 (refs/remotes/mybranch)
	A	file
r1 = 27644c921717960efac50c6a1ddd2f27541602a6 (refs/remotes/tags/mytag@5)
	M	file
r4 = d9344bbe39285132f268b2d21fbadcd12fa6c261 (refs/remotes/tags/mytag@5)
r6 = d0a00b2699d9e4230dae555226063a2d94dbd8e0 (refs/remotes/tags/mytag)
	A	file
r1 = 27644c921717960efac50c6a1ddd2f27541602a6 (refs/remotes/tags/mytag@2)
r3 = 8f79a22b978c3a28d684a54febdf9c5130b828cc (refs/remotes/tags/mytag@5-)
	M	file
r5 = c5720162e72c622bdb3f089a22acc4daa477d3b3 (refs/remotes/tags/mytag@5-)
r8 = a4a7a4df1b7e0fd67f06bc62543ed995e901c2c5 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
