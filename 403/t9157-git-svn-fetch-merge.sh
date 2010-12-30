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
r1 = cdc6a3110f2840045bef446aa278012fc51eeb29 (refs/remotes/trunk)
	A	foo
r3 = 29ca0b04b3006325d6b11825734c80ab14d0ee77 (refs/remotes/trunk)
r4 = ef90d52137906de292306dbf07f9d87af2723264 (refs/remotes/branch1)
	A	bar
r5 = f1e80d92f1d3ef6383ffb7a8581ab4570a993511 (refs/remotes/trunk)
r6 = 52e686da3c52cb69f2e64b0651acc3eff71d1fa9 (refs/remotes/branch2)
	A	baz
r7 = 5ab538252eb9a5c3d0f6393a990069c673ae9bc1 (refs/remotes/branch1)
	A	baz
r8 = 0789fb2a99e5a3a1e4f3c55b3226ed221ee27300 (refs/remotes/trunk)
	A	baz
r9 = 0be23a83c26343488f4633cfc4073395081991d6 (refs/remotes/branch2)
r10 = f680a1a0f00f32cd6361a37cfd0837d4edea829b (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
0be23a83c26343488f4633cfc4073395081991d6
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
