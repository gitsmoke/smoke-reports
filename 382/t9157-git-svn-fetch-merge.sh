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
r1 = 3f2ba02bd322375f6c408825fe429bcb46b08c17 (refs/remotes/trunk)
	A	foo
r3 = 7e63b9495fa42520855384853742410e0c8ffdbd (refs/remotes/trunk)
r4 = 3c6f7b8c71fc7e85e471275e6263840c59720352 (refs/remotes/branch1)
	A	bar
r5 = 7b31bf970bf9a93d1a38354cf995ba30d8d285f5 (refs/remotes/trunk)
r6 = caac25c0ae9df5d1bf5f325cfa1534e67a217a87 (refs/remotes/branch2)
	A	baz
r7 = ead59fc8abeb392df0089395c2bae320fb2891c0 (refs/remotes/branch1)
	A	baz
r8 = de527e4030b11ac98416f5a016c9e6bc1fd4da8c (refs/remotes/trunk)
	A	baz
r9 = 1d1569f8007f26db1eaa1c719e9491aecf3e5e66 (refs/remotes/branch2)
r10 = a1d321b3080cc621c9706867a07e503d96243852 (refs/remotes/trunk)
ok 2 - clone svn repo
expecting success: git rev-parse HEAD^2
1d1569f8007f26db1eaa1c719e9491aecf3e5e66
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
