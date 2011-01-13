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
r1 = 379d49c1b7b6a3b683eac3fdab962c4017c630e2 (refs/remotes/trunk)
	A	foo
r3 = 4830419559bf012d7ed2dcd108e2c4b31a979f3f (refs/remotes/trunk)
r4 = 6b3e22cfe74a769f092e4adcb7f700bccb090ff2 (refs/remotes/branch1)
	A	bar
r5 = 5ee5c0e09e463e0325d801acf7a6b069ba21ab23 (refs/remotes/trunk)
r6 = 25bafc87c041a20ede4163d5444a5d648d341353 (refs/remotes/branch2)
	A	baz
r7 = ed409c8a83071dc3dcd89b67a42d293e739ea637 (refs/remotes/branch1)
	A	baz
r8 = 31c21562fab8a16b54a6e50dc2aa065f81116f06 (refs/remotes/trunk)
	A	baz
r9 = 18cb7c1d67c240d57038199d63578489b12d2cc9 (refs/remotes/branch2)
r10 = db996c0abb8575cd353252e6377e38ff08389a3d (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
18cb7c1d67c240d57038199d63578489b12d2cc9

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
