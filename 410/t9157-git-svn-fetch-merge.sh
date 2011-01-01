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
r1 = 31ffb7b8d4a0f7450e7acbe1e9f8a77c69930485 (refs/remotes/trunk)
	A	foo
r3 = eb7134f909c119aff40422b3bd9215887f48acb5 (refs/remotes/trunk)
r4 = 72ef517c600b21e781f50306fc758789c5f035a8 (refs/remotes/branch1)
	A	bar
r5 = 0f3d1b938329cfa7bfe9d5552f3f0479a0e5f7b2 (refs/remotes/trunk)
r6 = 0d7baa165d89631e1a3bab7f5760bcc51d07e81d (refs/remotes/branch2)
	A	baz
r7 = cd46b622252ba45a4a8ee5bce2c5b261da478d39 (refs/remotes/branch1)
	A	baz
r8 = 6627ffedb2828ac167fbaf2d18c7dcff9964ccef (refs/remotes/trunk)
	A	baz
r9 = be289119fd6c28c03ee645e29ff6ece4abc706f2 (refs/remotes/branch2)
r10 = 9f5f4e095cbb9162f59b7628352ab3671c504fb8 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
be289119fd6c28c03ee645e29ff6ece4abc706f2

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
