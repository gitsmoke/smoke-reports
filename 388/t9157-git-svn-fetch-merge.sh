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
r1 = 9f9dfb343f9db660b2d81298abe6278a56f5cdc0 (refs/remotes/trunk)
	A	foo
r3 = 1939fdfedf062be948cdb02ba99d503c4ae2d856 (refs/remotes/trunk)
r4 = 87d8cd12129cc4f31e3ee5fd40002ad2632e828a (refs/remotes/branch1)
	A	bar
r5 = 7bc3118e9770bb51ecd246ed1fb46973afab1714 (refs/remotes/trunk)
r6 = 4fa7f549bf51e4e071302d3f35b3cb61c8af8416 (refs/remotes/branch2)
	A	baz
r7 = 70256fe37930033191f01fe518f4cf86a744ea99 (refs/remotes/branch1)
	A	baz
r8 = 26d1a95071dece89987964cf2c3978883b6fb4c9 (refs/remotes/trunk)
	A	baz
r9 = d2019ccd800cc915a7ee7c3a5ae461bdcc6863ea (refs/remotes/branch2)
r10 = caf10c3822a923fc8c667c4f41a7519c16cb0c23 (refs/remotes/trunk)

ok 2 - clone svn repo

expecting success: git rev-parse HEAD^2
d2019ccd800cc915a7ee7c3a5ae461bdcc6863ea

ok 3 - verify merge commit

# passed all 3 test(s)
1..3
