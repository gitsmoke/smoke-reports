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
r1 = a5db9d00a0a6a8b8aa9a8b82352d032d6df50aea (refs/remotes/trunk)
	A	foo
r3 = 87b2bd4ba58a8d8885a4925556a38fb41c8446ad (refs/remotes/trunk)
r4 = ccd421d76b7148fb68a92cd5f91b1a8fdce4a58d (refs/remotes/branch1)
	A	bar
r5 = 9db010cadc7c4eb9c8b23cfbc0f27a23cb2e14fb (refs/remotes/trunk)
r6 = 705dd007676cbb0a97cca8bc43422ade3e0bdcd9 (refs/remotes/branch2)
	A	baz
r7 = d4e3c9a12a6baa08201bd514e69a90660b04653e (refs/remotes/branch1)
	A	baz
r8 = 14ebba9224fd670c25ff4fb00af1492d279ed9ce (refs/remotes/trunk)
	A	baz
r9 = f4c04996c508f8f224d843e2cf591af6bf1cc973 (refs/remotes/branch2)
r10 = 2d8c5f28f7cf849677b0e1bedacd5ceaa949fd63 (refs/remotes/trunk)
ok 2 - clone svn repo
expecting success: git rev-parse HEAD^2
f4c04996c508f8f224d843e2cf591af6bf1cc973

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
