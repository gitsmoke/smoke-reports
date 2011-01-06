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
r1 = 3068d01ca82c202cf7102fa924eed03cab56f22a (refs/remotes/trunk)
	A	foo
r3 = 2b0a410abbe948ed2c0d365a25a90200a5f0c8e7 (refs/remotes/trunk)
r4 = 4b31c0373c2bac4e90af259456e7a06b5854bb7d (refs/remotes/branch1)
	A	bar
r5 = 19efc9edb0a39724be8531211a4647277a29a007 (refs/remotes/trunk)
r6 = 608addfd04db41dbbf9489958cdc134feb161508 (refs/remotes/branch2)
	A	baz
r7 = 0af4a52d3d2e0466be9d8189a59e270dd5f5f277 (refs/remotes/branch1)
	A	baz
r8 = 17313bd79a0e33ed156cb3efa0b60405e1edac11 (refs/remotes/trunk)
	A	baz
r9 = e8a732130a5a22fd18cdabf4e8edf5cd3bd99946 (refs/remotes/branch2)
r10 = 9c4d75d75a77b6ef29f20f7d55c0399965dfa4f5 (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
e8a732130a5a22fd18cdabf4e8edf5cd3bd99946

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
