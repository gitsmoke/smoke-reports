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

r1 = 0eafcf628f0d252c063d1f5f1300428e2a63640e (refs/remotes/trunk)
	A	foo
r3 = 1356b3f4beba1f3a35f7c5e4ef1573e76ab9f854 (refs/remotes/trunk)
r4 = 2a3ba1cc0000659d2df7c639d71c0164906c06c0 (refs/remotes/branch1)
	A	bar
r5 = 3e254d4ef45edd64c46ec67e8fd9f645c34cb176 (refs/remotes/trunk)
r6 = 9fe843ccacf057a05a333e4c8777d65859916519 (refs/remotes/branch2)
	A	baz
r7 = e3a5e9aabec46352b3e26c9e3a6085ef363c1917 (refs/remotes/branch1)
	A	baz
r8 = 2360d2754ad3cd9fdb535a6d5a5339808af55b12 (refs/remotes/trunk)
	A	baz
r9 = 17e3591964affc5062f26afd39bbb65fd5e1f50c (refs/remotes/branch2)
r10 = 5838f755dbeb355e88c95fe8738d80bebd58165f (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
17e3591964affc5062f26afd39bbb65fd5e1f50c

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
