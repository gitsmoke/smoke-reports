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
r1 = 58a5504768cfa046d710c60acd825ed84fbaea16 (refs/remotes/trunk)
r2 = 9b30dfd896cdf809b2ac94921dff139a0643e5d6 (refs/remotes/mybranch)
	A	trunk/subdir/file
r3 = e7f6d5bd292ccd647cf22ce4251c291721435780 (refs/remotes/mybranch)
	M	subdir/file
r4 = 65199d916812558980e4fc133bd4f7e3203c81ac (refs/remotes/trunk)
	M	trunk/subdir/file
r5 = 26c537979a9bec0df3c9bd259ec2ed02ba641858 (refs/remotes/mybranch)
	A	file
r1 = 679cd8c399b265906e8c91e552f1bedf53f844f9 (refs/remotes/tags/mytag@5)
	M	file
r4 = c147fe887d2950d8a61fad2fef5177240853a6b2 (refs/remotes/tags/mytag@5)
r6 = 0081395569331cb1e00ca17367886e1369f87543 (refs/remotes/tags/mytag)
	A	file
r1 = 679cd8c399b265906e8c91e552f1bedf53f844f9 (refs/remotes/tags/mytag@2)
r3 = 9a48192200f37fe72ad5e873d994dacc1e0bf659 (refs/remotes/tags/mytag@5-)
	M	file
r5 = 2ffe1ba8b28fc59a8dc3258a5830634f1cfa0531 (refs/remotes/tags/mytag@5-)
r8 = 57b61a99746afc9d262b2430aec8b4453357c4f7 (refs/remotes/tags/mytag)
ok 2 - fetch deleted tags from same revision with checksum error

# passed all 2 test(s)
1..2
