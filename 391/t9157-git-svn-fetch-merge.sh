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
r1 = 88c6342c83a147e5efe8f9e5a70af0a662aa8ecb (refs/remotes/trunk)
	A	foo
r3 = 2cdda2f9bf0b8b1411bc583221237f251bb1e6d5 (refs/remotes/trunk)
r4 = 4ee6cd180a4d80ecfd727dd4e01ea6100c5a3e61 (refs/remotes/branch1)
	A	bar
r5 = 522e418768d204bac587c1f706262288357773bb (refs/remotes/trunk)
r6 = bd7e6268a939da5a7faf02c3b213e4bbfb5801f5 (refs/remotes/branch2)
	A	baz
r7 = 003bd3902f7317d35d1c99aaa427254cb081d6d9 (refs/remotes/branch1)
	A	baz
r8 = 94560d3d2a0caf31fdbc4c8d9c2e043d7c88a54e (refs/remotes/trunk)
	A	baz
r9 = 706459dd886d5d2d6d98135ba826791ab4dbff1d (refs/remotes/branch2)
r10 = aebf559168227daed8a51495d47b59a221f4331a (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
706459dd886d5d2d6d98135ba826791ab4dbff1d

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
