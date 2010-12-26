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
r1 = 22f36f5cedbe1751f1803bbdf8b5c87246815ce2 (refs/remotes/trunk)
r2 = 60e0697a43709c4331bc0b54ada9f7d75aaf95a4 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 6afcc5b60f94f28ee2bb5a00157f1e8a1a56711f (refs/remotes/mybranch)
	M	subdir/file
r4 = a00d615b3c2d85eaac5cc5d003c9356ad8c3b71f (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 10c7c23366f39b4d7e12fd5dc43c6e672ebdc715 (refs/remotes/mybranch)
	A	file
r1 = 5904afc9b9cff492a9aaa7051b08e7ebdd118d76 (refs/remotes/tags/mytag@5)
	M	file
r4 = c334022985c033ed3e612547af7ac143db66b887 (refs/remotes/tags/mytag@5)
r6 = dd45c48535d4cdab449098ea564edde4d91affa5 (refs/remotes/tags/mytag)
	A	file
r1 = 5904afc9b9cff492a9aaa7051b08e7ebdd118d76 (refs/remotes/tags/mytag@2)
r3 = a05475327fe5beaa4f1a3e11d521464878ecd4ce (refs/remotes/tags/mytag@5-)
	M	file
r5 = edf48b77d0a8c224a2d7b8899eaaedb3de2fbacb (refs/remotes/tags/mytag@5-)
r8 = b4509bb9286559552b1bae4101cb0458b7c31a8d (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
