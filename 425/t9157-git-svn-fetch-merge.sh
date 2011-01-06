Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9157-git-svn-fetch-merge/.git/
expecting success: 
	svn_cmd mkdir -m x "$svnrepo"/trunk &&
	svn_cmd mkdir -m x "$svnrepo"/branches &&
	svn_cmd co "$svnrepo"/trunk "$SVN_TREE" &&
	(
		cd "$SVN_TREE" &&
		touch foo &&
		svn add foo &&
		svn commit -m "initial commit" &&
		svn cp -m branch "$svnrepo"/trunk "$svnrepo"/branches/branch1 &&
		touch bar &&
		svn add bar &&
		svn commit -m x &&
		svn cp -m branch "$svnrepo"/trunk "$svnrepo"/branches/branch2 &&
		svn switch "$svnrepo"/branches/branch1 &&
		touch baz &&
		svn add baz &&
		svn commit -m x &&
		svn switch "$svnrepo"/trunk &&
		svn merge "$svnrepo"/branches/branch1 &&
		svn commit -m "merge" &&
		svn switch "$svnrepo"/branches/branch1 &&
		svn commit -m x &&
		svn switch "$svnrepo"/branches/branch2 &&
		svn merge "$svnrepo"/branches/branch1 &&
		svn commit -m "merge branch1" &&
		svn switch "$svnrepo"/trunk &&
		svn merge "$svnrepo"/branches/branch2 &&
		svn resolved baz &&
		svn commit -m "merge branch2"
	) &&
	rm -rf "$SVN_TREE"

Committed revision 1.

Committed revision 2.
Checked out revision 2.
A         foo
Adding         foo
Transmitting file data .
Committed revision 3.

Committed revision 4.
A         bar
Adding         bar
Transmitting file data .
Committed revision 5.

Committed revision 6.
D    bar
Updated to revision 6.
A         baz
Adding         baz
Transmitting file data .
Committed revision 7.
D    baz
A    bar
Updated to revision 7.
--- Merging r4 through r7 into '.':
A    baz
Sending        .
Adding         baz

Committed revision 8.
D    bar
 U   .
Updated to revision 8.
D    baz
A    bar
Updated to revision 8.
--- Merging r4 through r8 into '.':
A    baz
Sending        .
Adding         baz

Committed revision 9.
 U   .
Updated to revision 9.
--- Merging r6 through r9 into '.':
   C baz
 G   .
Summary of conflicts:
  Tree conflicts: 1
Resolved conflicted state of 'baz'
Sending        .

Committed revision 10.

ok 1 - initialize source svn repo

expecting success: 
	git svn init -s "$svnrepo" &&
	git svn fetch
r1 = a3a38f9f21446c7119e2f8617149f68cf845446b (refs/remotes/trunk)
	A	foo
r3 = c4dd8a410c93e9613e57f2eab1b7ec2769810a3f (refs/remotes/trunk)
r4 = ee9dc18576d8668bc1bc7735150f40607f0914de (refs/remotes/branch1)
	A	bar
r5 = bf7667c4f13cf516f458c2757f98165c12671879 (refs/remotes/trunk)
r6 = 1f37b4e16eb2aada79434252710783117534bd56 (refs/remotes/branch2)
	A	baz
r7 = 346be0688cbd514079861a47fe3aca7907608c7b (refs/remotes/branch1)
	A	baz
r8 = 994a626e9a11aa327fcc9187483efe80e7236300 (refs/remotes/trunk)
	A	baz
r9 = 527f63de9474d3e52da2719f563742cefa719a6e (refs/remotes/branch2)
r10 = 92d2deb5c9dcd2c38d3e740ae8b0730a93b56675 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
527f63de9474d3e52da2719f563742cefa719a6e

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
