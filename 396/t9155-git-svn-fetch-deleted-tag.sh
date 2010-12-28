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
r1 = ac7295f3b407eb8ec9539ab973596dd095152d1f (refs/remotes/trunk)
r2 = 3c4de112aae4ea6b1af88ca6c5b2ab3a7e2c684a (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = a7ccf91d99e85d45fa4c2baa83265fe68ffd15c4 (refs/remotes/mybranch)
	M	subdir/file
r4 = 2e13daaeed2ab0f7fc93b1ca0a77e8e6dedfa673 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = d701337292add568e6de9e6efee1f5fb1f8fd2d4 (refs/remotes/mybranch)
	A	file
r1 = 70e8dab7631fea7941bae97a246955fac34ebbb4 (refs/remotes/tags/mytag@5)
	M	file
r4 = 4fb5a6c190a74ffcc1216707dff9730500125437 (refs/remotes/tags/mytag@5)
r6 = 9e3e0cfb659d175f4fc2b5060893de57de1b6c65 (refs/remotes/tags/mytag)
	A	file
r1 = 70e8dab7631fea7941bae97a246955fac34ebbb4 (refs/remotes/tags/mytag@2)
r3 = 03b43e6ee29cb8dc929250edf664979e5e23cdcc (refs/remotes/tags/mytag@5-)
	M	file
r5 = 982ba7eeb15cbe29c546fb7da6ca73dee195ec62 (refs/remotes/tags/mytag@5-)
r8 = cbcd42e59fd7ee6f6d5dd6f8ead52709c2b28eb7 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
