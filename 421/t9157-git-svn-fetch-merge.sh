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
r1 = 5ff3f3fd86da102b48fe9ed6f79dc3c67465cf73 (refs/remotes/trunk)
	A	foo
r3 = f7d5fc5208de38def4188ef6fcef98ec4465a400 (refs/remotes/trunk)
r4 = 2178d89e92d39fab4d5755094deddb3c542047da (refs/remotes/branch1)
	A	bar
r5 = 5c2cdd99bce9a12d127646d532242c50071cd60c (refs/remotes/trunk)
r6 = 3ed920e3b4f0fbddc45309e61a02702c21ea3c7d (refs/remotes/branch2)
	A	baz
r7 = 8573822548427a2dabd4cf28959d7fc5b8b47113 (refs/remotes/branch1)
	A	baz
r8 = 8f6086dd0acd7fbf4d332d0d6ca2a5754e1666a2 (refs/remotes/trunk)
	A	baz
r9 = f16a044959f6370e9baeda9ae9ecef7b9f602075 (refs/remotes/branch2)
r10 = a781e8413aae7b53e67e7017f0863e307c4fa5f3 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
f16a044959f6370e9baeda9ae9ecef7b9f602075

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
