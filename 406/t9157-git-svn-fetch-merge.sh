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
r1 = a18360895b51beb1c10623987ec250f0adadf365 (refs/remotes/trunk)
	A	foo
r3 = f58d647a10f93c472f5a31ae746793f5f9998f02 (refs/remotes/trunk)
r4 = b8e4edb68c12ed70e00067023e4f5318ad43fa8c (refs/remotes/branch1)
	A	bar
r5 = 6fd99c6a5025908b66af5c77d262719b999dbf47 (refs/remotes/trunk)
r6 = 631a9851ccf5f79977d6ed71a830ba4f8d5915bd (refs/remotes/branch2)
	A	baz
r7 = 55e8d685aebe88246066dd3a4f41ac6634533c9d (refs/remotes/branch1)
	A	baz
r8 = 2b84935aa92492a64a0a08e12bca25e6261f9725 (refs/remotes/trunk)
	A	baz
r9 = 3803c46b9968db793b72e7db77983156bdedd362 (refs/remotes/branch2)
r10 = 931e36f2348653460ee3a4cd063e309e374f0c2e (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
3803c46b9968db793b72e7db77983156bdedd362

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
