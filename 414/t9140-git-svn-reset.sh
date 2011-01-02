Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9140-git-svn-reset/.git/
expecting success: 
	svn_cmd co "$svnrepo" s &&
	(
		cd s &&
		mkdir vis &&
		echo always visible > vis/vis.txt &&
		svn_cmd add vis &&
		svn_cmd commit -m "create visible files" &&
		mkdir hid &&
		echo initially hidden > hid/hid.txt &&
		svn_cmd add hid &&
		svn_cmd commit -m "create initially hidden files" &&
		svn_cmd up &&
		echo mod >> vis/vis.txt &&
		svn_cmd commit -m "modify vis" &&
		svn_cmd up
	)

Checked out revision 0.
A         vis
A         vis/vis.txt
Adding         vis
Adding         vis/vis.txt
Transmitting file data .
Committed revision 1.
A         hid
A         hid/hid.txt
Adding         hid
Adding         hid/hid.txt
Transmitting file data .
Committed revision 2.
At revision 2.
Sending        vis/vis.txt
Transmitting file data .
Committed revision 3.
At revision 3.
ok 1 - setup test repository
expecting success: 
	git svn init "$svnrepo" g &&
	( cd g && git svn fetch --ignore-paths="^hid" )
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9140-git-svn-reset/g/.git/
	A	vis/vis.txt
r1 = 7c5785c2190bb752bf1d970074bb862b51b37b30 (refs/remotes/git-svn)
r2 = 5047785a8f79374607ceb653cb7cebc01fc44eeb (refs/remotes/git-svn)
	M	vis/vis.txt
r3 = 652ca9e13d3d22db3584fd9ef598d0ded1404303 (refs/remotes/git-svn)
ok 2 - clone SVN repository with hidden directory

expecting success: 
	( cd s &&
	  echo mod hidden >> hid/hid.txt &&
	  svn_cmd commit -m "modify hid" &&
	  svn_cmd up
	)
Sending        hid/hid.txt
Transmitting file data .
Committed revision 4.
At revision 4.

ok 3 - modify hidden file in SVN repo
expecting success: 
	( cd g &&
	  git svn find-rev refs/remotes/git-svn > ../expect &&
	  test_must_fail git svn fetch 2> ../errors &&
	  git svn find-rev refs/remotes/git-svn > ../expect2 ) &&
	fgrep "not found in commit" errors &&
	test_cmp expect expect2
hid/hid.txt was not found in commit 652ca9e13d3d22db3584fd9ef598d0ded1404303 (r3)
ok 4 - fetch fails on modified hidden file
expecting success: 
	( cd g &&
	  git svn reset -r1 &&
	  git svn find-rev refs/remotes/git-svn > ../expect2 ) &&
	echo 1 >expect &&
	test_cmp expect expect2
r1 = 7c5785c2190bb752bf1d970074bb862b51b37b30 (refs/remotes/git-svn)
ok 5 - reset unwinds back to r1

expecting success: 
	( cd g &&
	  git svn fetch &&
	  git svn rebase &&
	  fgrep "mod hidden" hid/hid.txt
	)
	A	hid/hid.txt
r2 = 6da53e58a65c9598f255d69a0107e6a8ebd92e7c (refs/remotes/git-svn)
	M	vis/vis.txt
r3 = 051f817969ba89f57945a5fb11bcba631345a9a6 (refs/remotes/git-svn)
	M	hid/hid.txt
r4 = e0ec6fab69fe7e40facdc65812d7354c35688801 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
mod hidden
ok 6 - refetch succeeds not ignoring any files
# passed all 6 test(s)
1..6
