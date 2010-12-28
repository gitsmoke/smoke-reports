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
r1 = f966405823f6fb0f7547fd6966d00f69d252cfa8 (refs/remotes/trunk)
	A	foo
r3 = d53c06bf34fe1cd8e422ff448d2df84005ab9e3a (refs/remotes/trunk)
r4 = 519344872ecec9567b605d0c00abfdf64eaf79f1 (refs/remotes/branch1)
	A	bar
r5 = aa241b9b750cd5c090b2b55faa256d6d2bd0eca8 (refs/remotes/trunk)
r6 = 95dd59f58467e99f9c5e1911e851147e013c5bc6 (refs/remotes/branch2)
	A	baz
r7 = 10f4b255707cacdc6e19f5bebc8677e8ea969675 (refs/remotes/branch1)
	A	baz
r8 = 8aae37992a29a7e8e619661f796ee71d8966f0ef (refs/remotes/trunk)
	A	baz
r9 = 078cc15ef3a4995fa7a7d45a4ff51b518eee15af (refs/remotes/branch2)
r10 = 68152eb34f9499269828a418f9e70f881989ebf2 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
078cc15ef3a4995fa7a7d45a4ff51b518eee15af

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
