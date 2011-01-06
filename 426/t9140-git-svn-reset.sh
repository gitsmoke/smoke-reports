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
r1 = 5a0fdb7b363cb35aa6510793dce0680ce75b046f (refs/remotes/git-svn)
r2 = b19e078a9a9dd944c2abe1e9e3f9c58e06fdb881 (refs/remotes/git-svn)
	M	vis/vis.txt
r3 = 9e436254819591b0b41182649c4308ab23bb79c8 (refs/remotes/git-svn)
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
hid/hid.txt was not found in commit 9e436254819591b0b41182649c4308ab23bb79c8 (r3)

ok 4 - fetch fails on modified hidden file

expecting success: 
	( cd g &&
	  git svn reset -r1 &&
	  git svn find-rev refs/remotes/git-svn > ../expect2 ) &&
	echo 1 >expect &&
	test_cmp expect expect2
r1 = 5a0fdb7b363cb35aa6510793dce0680ce75b046f (refs/remotes/git-svn)

ok 5 - reset unwinds back to r1

expecting success: 
	( cd g &&
	  git svn fetch &&
	  git svn rebase &&
	  fgrep "mod hidden" hid/hid.txt
	)
	A	hid/hid.txt
r2 = bea56af46a877d18666ce5c4d0987957f92bd7a8 (refs/remotes/git-svn)
	M	vis/vis.txt
r3 = 5b55191abbc1b8365f7650c8b0bf6874e916ddbc (refs/remotes/git-svn)
	M	hid/hid.txt
r4 = 1e0c25c007a68c7d178f2280084fd9749eff62f6 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
mod hidden

ok 6 - refetch succeeds not ignoring any files

# passed all 6 test(s)
1..6
