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
r1 = 2b518c7af3e2823e9b67e2cd65c949314cfa27d6 (refs/remotes/trunk)
	A	foo
r3 = 1793caf514f6ebf2350c09abcf0a9c1ac4816913 (refs/remotes/trunk)
r4 = d2462a233bd88cbf15cb6b902ab398cf13b89e77 (refs/remotes/branch1)
	A	bar
r5 = f9fd9967036138ff15ca84f55731160705a7e927 (refs/remotes/trunk)
r6 = 17b78ec0069103fc8fa0146a3ba491964c886fb8 (refs/remotes/branch2)
	A	baz
r7 = df2ccda037800d9fdca0be27db3687b87ab4238f (refs/remotes/branch1)
	A	baz
r8 = 6cf4898960a63cd2c1b6b253864a072ed5fd6ec6 (refs/remotes/trunk)
	A	baz
r9 = 20cd0e14b751b05665d10e5073f9a4948a6d1584 (refs/remotes/branch2)
r10 = 6302a3dc106bed80da1521150b3d1be4b1e07896 (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
20cd0e14b751b05665d10e5073f9a4948a6d1584
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
