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
r1 = 44313d07c640006eb264f9d803ee900bcc6333ba (refs/remotes/trunk)
r2 = 47cb0e5c8b4a5448b85839cf19fb7edcb59d42b7 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = 368eb0cce32667054a008a59cc25478da36c5c7d (refs/remotes/mybranch)
	M	subdir/file
r4 = 0c088697ecd46f33e8ea0147f5f4f402726d8465 (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 27bb5dfd24311ab26af9d85e662bb8a59db04dc4 (refs/remotes/mybranch)
	A	file
r1 = 145936666bc0ef1e9de8de7d7e189cb42031a2c0 (refs/remotes/tags/mytag@5)
	M	file
r4 = ffc1e6752f5edb0f381b57fb292b096748f93c74 (refs/remotes/tags/mytag@5)
r6 = b19198cd07464ff6b0618a483463cfc682ddbd93 (refs/remotes/tags/mytag)
	A	file
r1 = 145936666bc0ef1e9de8de7d7e189cb42031a2c0 (refs/remotes/tags/mytag@2)
r3 = 34e5e2173a0eb88ebe92a751676d5f70276e883c (refs/remotes/tags/mytag@5-)
	M	file
r5 = a3e08a29ba0255fb072563f06863f7627dc34dcb (refs/remotes/tags/mytag@5-)
r8 = b86142d955bc81b373c7213af57fc0b24e87ac2c (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
