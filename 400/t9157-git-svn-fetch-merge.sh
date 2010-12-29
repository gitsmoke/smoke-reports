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
r1 = 1505424abfc06c8cac2ff5a4009795a64c64ab44 (refs/remotes/trunk)
	A	foo
r3 = 9b3096a14b9475454e91d70726b9ba570732b741 (refs/remotes/trunk)
r4 = 02b424bef2494241a173661460a1a0cbd71e429a (refs/remotes/branch1)
	A	bar
r5 = 52395eb37ea459dc4fcda3fa8a04d252c6e45eae (refs/remotes/trunk)
r6 = 86c117ab1598e0c1d4c581a1f217a3508cd1d6e4 (refs/remotes/branch2)
	A	baz
r7 = 8c459915d5abfd3eb2852ec123ab3af1e7e63bc5 (refs/remotes/branch1)
	A	baz
r8 = d7283b2e19fdfe921edc8290a35743c09bb87664 (refs/remotes/trunk)
	A	baz
r9 = 56543ce9e3d56c1d3136663726a2de4a04c2a999 (refs/remotes/branch2)
r10 = 4a131fc896cd72c60cc629df9334a338e7e77ace (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
56543ce9e3d56c1d3136663726a2de4a04c2a999
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
