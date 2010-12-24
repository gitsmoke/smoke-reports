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
r1 = 69727050551a8260cb1b6901fb5a6521bf6114ec (refs/remotes/trunk)
	A	foo
r3 = ef0b811d1bc08f79d37ab1fe32ebfdf2aa381f4d (refs/remotes/trunk)
r4 = 004d4071f7e62e7852e0d6a569a0c343c616cc4c (refs/remotes/branch1)
	A	bar
r5 = 6f8f2aac4c28420f67bb81ba96f3eec12f351f6a (refs/remotes/trunk)
r6 = 01889b5e0dbe0edfde5690a470aa2407c997079b (refs/remotes/branch2)
	A	baz
r7 = a7cc21681d6df5fab44d158914bbf46e87962fe4 (refs/remotes/branch1)
	A	baz
r8 = 7bb9834f24fbf39545f5cd70ea7ea62035897d6f (refs/remotes/trunk)
	A	baz
r9 = efb305999011ca51eb6ef5ef302db5730c406117 (refs/remotes/branch2)
r10 = abe763f590b8524747c86fe1f9b622aa53998489 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
efb305999011ca51eb6ef5ef302db5730c406117

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
