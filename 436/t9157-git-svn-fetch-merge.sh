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
r1 = dca4fd16255d2d453b34f521d09fc1f8c00c5483 (refs/remotes/trunk)
	A	foo
r3 = b78fcfda6ced34a391071d1a3f897ca1d15c6ce8 (refs/remotes/trunk)
r4 = 388be5215619aef6c48a5117efc3340b096084e0 (refs/remotes/branch1)
	A	bar
r5 = 2d1594fb37f327a48e4498c73677569566dd151a (refs/remotes/trunk)
r6 = 53c6109c8b3b496128253740963ad8b29cc621cf (refs/remotes/branch2)
	A	baz
r7 = 6bc9a017e2451c2bd7afd23ed37ae9cefcc30427 (refs/remotes/branch1)
	A	baz
r8 = 0f3ad9c78b1769ee45975c5fb08aa660a26f36c8 (refs/remotes/trunk)
	A	baz
r9 = aa8a7363796f826be92deed7e909d0df55894d83 (refs/remotes/branch2)
r10 = 9a50c2e1c21c8d35592628407add8ad89ac2dddb (refs/remotes/trunk)
ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
aa8a7363796f826be92deed7e909d0df55894d83
ok 3 - verify merge commit
# passed all 3 test(s)
1..3
