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
r1 = af9626c0af74ceb7a27f1dce07968ea2cfe8d094 (refs/remotes/trunk)
	A	foo
r3 = 8f210abe82577fcc4d7a160b8f65b621f671e3bd (refs/remotes/trunk)
r4 = 53cbd0bb59a3b5d155e01c0d627bd40824d7d946 (refs/remotes/branch1)
	A	bar
r5 = 2306ba14e59ccdf146704a8d0ac74c9523ce9eae (refs/remotes/trunk)
r6 = ac4bd4e8002da204ac7621924a34be005daaea68 (refs/remotes/branch2)
	A	baz
r7 = 0eebec23dc340b9f810453b71308eb0e5c28f924 (refs/remotes/branch1)
	A	baz
r8 = 95b477d8ec8eea6bac2d430d347bb021cb4affb2 (refs/remotes/trunk)
	A	baz
r9 = 933e83acfe35199de5ada2b7310cc8a2e002e8bc (refs/remotes/branch2)
r10 = bdddd7ee6f77968d494cf4411a640bfc0f749954 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
933e83acfe35199de5ada2b7310cc8a2e002e8bc

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
