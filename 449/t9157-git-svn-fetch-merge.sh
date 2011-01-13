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
r1 = bb4553645d2ca4cf070262cff456df90dfe18718 (refs/remotes/trunk)
	A	foo
r3 = 5cce11160036202119e2b547580839a40d689f93 (refs/remotes/trunk)
r4 = 5d2334cc4a9b6a71c12c5c04c1855d103ec644bf (refs/remotes/branch1)
	A	bar
r5 = d23568269db27d396b6a26a423650546b116dbd1 (refs/remotes/trunk)
r6 = 19f772668bb40da73fdda3565cd07ad30da79ab5 (refs/remotes/branch2)
	A	baz
r7 = 0b6dec257e54d6064028e09d6ca3e263fc4fd323 (refs/remotes/branch1)
	A	baz
r8 = d93fce80af0e0aecc86c115d6ce2402c3ab0f391 (refs/remotes/trunk)
	A	baz
r9 = bb0632994526d8a27b71448df5d4f26072aa516d (refs/remotes/branch2)
r10 = 70ac14c2e74ca980994ff8f22cc98ea52f45ca7e (refs/remotes/trunk)
ok 2 - clone svn repo
expecting success: git rev-parse HEAD^2
bb0632994526d8a27b71448df5d4f26072aa516d
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
