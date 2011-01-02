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
r1 = 9cea17dca423b0b9f720ff9c15c48d0f9f19af4a (refs/remotes/trunk)
	A	foo
r3 = e7df567ae82f8fb16d7122b5361d4624ebf1490e (refs/remotes/trunk)
r4 = 7d4478812902f2c6d8ba28ff12bc6d1b1aeda001 (refs/remotes/branch1)
	A	bar
r5 = c594e776c74151cd0e5c6223cc804dd4628de573 (refs/remotes/trunk)
r6 = e15f861100ad51dfa81d613157d14c85cc1fac21 (refs/remotes/branch2)
	A	baz
r7 = 45259c500824d9b5d95848312340e70980a1a149 (refs/remotes/branch1)
	A	baz
r8 = 21c16fed4096d2a805dcfa3dc1dc842b7c0d043d (refs/remotes/trunk)
	A	baz
r9 = bfab92c8a16de5b73d401d7f59bc73e2358f8183 (refs/remotes/branch2)
r10 = 78a92fc8f2513d52d87c2c315e47f3a575e53f5d (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
bfab92c8a16de5b73d401d7f59bc73e2358f8183

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
