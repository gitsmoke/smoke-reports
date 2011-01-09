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
r1 = fa415a5571e280cb71d431863365c30048b6011d (refs/remotes/trunk)
	A	foo
r3 = a90d2d7d1cbb214d021d237e7f8a1c9a775703e2 (refs/remotes/trunk)
r4 = 53634c3524e10d6a25dc07627abfddfb80439c65 (refs/remotes/branch1)
	A	bar
r5 = f3f29ac678b924e0d8d13e334444ecddc312f580 (refs/remotes/trunk)
r6 = c2c53f3771a8d1ddb5c6017ce0f4e2e8b52887a6 (refs/remotes/branch2)
	A	baz
r7 = 3643885afa1e32ed270e1aa178a9d4f74b6f9960 (refs/remotes/branch1)
	A	baz
r8 = d1ccdd24a37ab2e53f24d00aee29babf124bf7ab (refs/remotes/trunk)
	A	baz
r9 = 5d7a4baa41d4b7a63e6ef948e840512d55db80a4 (refs/remotes/branch2)
r10 = 0568df53849e38a9ff18e519341523d06036e7c9 (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
5d7a4baa41d4b7a63e6ef948e840512d55db80a4

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
