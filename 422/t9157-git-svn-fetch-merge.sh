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
r1 = fb31a6689f03fe081555cd41d6b597fb494c923a (refs/remotes/trunk)
	A	foo
r3 = b9927cbd465a8358769c6187bb3c80f10e21c7f9 (refs/remotes/trunk)
r4 = 994881f48f08d3bd586c932bd5f153f795751556 (refs/remotes/branch1)
	A	bar
r5 = 5b44963eed9a006e62a41fae2ffa572eed832bef (refs/remotes/trunk)
r6 = 3b9c4a826673f6db8f434a760038aeb4c74929e5 (refs/remotes/branch2)
	A	baz
r7 = ce26315eadbf144555caaa1830b5990c01883b2a (refs/remotes/branch1)
	A	baz
r8 = 4976061699f7e0947aa5df1734618134e7e07150 (refs/remotes/trunk)
	A	baz
r9 = 9b26a48018690600709820a819830b58c7782af1 (refs/remotes/branch2)
r10 = 6c9adace115fd2d545697e3e910dba6c4180f0bb (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
9b26a48018690600709820a819830b58c7782af1

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
