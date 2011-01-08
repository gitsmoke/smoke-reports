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

r1 = f7f5b5f5dc4d5def7f6ce9631036e0d446568454 (refs/remotes/trunk)
	A	foo
r3 = 2b16f072d24f8bf87d9128fa58911107ce6501ce (refs/remotes/trunk)
r4 = 9b77fa99acf06251a6295024f31612f777cee771 (refs/remotes/branch1)
	A	bar
r5 = 21485f22cc100ee90fc02d3e7543806b88ec97ea (refs/remotes/trunk)
r6 = ee05ff20d66b0ee04245e602e64dfeb2c7f76979 (refs/remotes/branch2)
	A	baz
r7 = 6acd00710d0414b19fa76a97ce60e89536ba4967 (refs/remotes/branch1)
	A	baz
r8 = aa2620a383570204b0a422c11e9686b135e9b310 (refs/remotes/trunk)
	A	baz
r9 = bf612193a8140fd7dcd8acaa90cead8eeb0973d6 (refs/remotes/branch2)
r10 = 72aa1433b72a42a250dadc21268c0d0a08612d59 (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
bf612193a8140fd7dcd8acaa90cead8eeb0973d6

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
