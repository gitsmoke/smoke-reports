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
r1 = 010d7c255c2414291842c44a3059857ad54176fe (refs/remotes/trunk)
r2 = 024c5dbea34d492c4220dd38ac72f0e712504d5e (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = bb29dbc17a62857cdc4b526984b03b5e2f3e7611 (refs/remotes/mybranch)
	M	subdir/file
r4 = 2952bafd36784fdce65cc0f0ed54f3eb279cfabc (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 2fbd169d4f1f151f90b0b9dbabbd418cb841f4d1 (refs/remotes/mybranch)
	A	file
r1 = 81e535a53ac668f35dacd9005c568839748d2ae0 (refs/remotes/tags/mytag@5)
	M	file
r4 = 80b86ea955b30abdabfbab2b1218dfcec3794daf (refs/remotes/tags/mytag@5)
r6 = b8477c6ed6c4bc6675873b0eb7e7caf1ff486c50 (refs/remotes/tags/mytag)
	A	file
r1 = 81e535a53ac668f35dacd9005c568839748d2ae0 (refs/remotes/tags/mytag@2)
r3 = 158a1d4cee3a100614a197f34b6cd5b52e7fdf3a (refs/remotes/tags/mytag@5-)
	M	file
r5 = 6ac29efcfbe06928338f93c6afd5923743a1d214 (refs/remotes/tags/mytag@5-)
r8 = 01bd846a331d4e66d9298ec30d16441e4dd50cc1 (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
