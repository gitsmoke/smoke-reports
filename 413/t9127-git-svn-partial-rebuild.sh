Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9127-git-svn-partial-rebuild/.git/
expecting success: 
	mkdir import &&
	(
		(cd import &&
		mkdir trunk branches tags &&
		(cd trunk &&
		echo foo > foo
		) &&
		svn_cmd import -m "import for git-svn" . "$svnrepo" >/dev/null &&
		svn_cmd copy "$svnrepo"/trunk "$svnrepo"/branches/a \
			-m "created branch a"
		) &&
		rm -rf import &&
		svn_cmd co "$svnrepo"/trunk trunk &&
		(cd trunk &&
		echo bar >> foo &&
		svn_cmd ci -m "updated trunk"
		) &&
		svn_cmd co "$svnrepo"/branches/a a &&
		(cd a &&
		echo baz >> a &&
		svn_cmd add a &&
		svn_cmd ci -m "updated a"
		) &&
		git svn init --stdlayout "$svnrepo"
	)

Committed revision 2.
A    trunk/foo
Checked out revision 2.
Sending        foo
Transmitting file data .
Committed revision 3.
A    a/foo
Checked out revision 3.
A         a
Adding         a
Transmitting file data .
Committed revision 4.

ok 1 - initialize svnrepo
expecting success: 
	git svn fetch -r1:2
	A	foo
r1 = 3fa5bc5d0cfb80b630b952a9ffaae8cea5634211 (refs/remotes/trunk)
r2 = e245de22a6949ab0cb44f96ccfd107967b10e516 (refs/remotes/a)

ok 2 - import an early SVN revision into git

expecting success: 
	mkdir mirror &&
	(
		(cd mirror &&
		git init &&
		git svn init --stdlayout "$svnrepo" &&
		git svn fetch
		)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9127-git-svn-partial-rebuild/mirror/.git/
	A	foo
r1 = 3fa5bc5d0cfb80b630b952a9ffaae8cea5634211 (refs/remotes/trunk)
r2 = e245de22a6949ab0cb44f96ccfd107967b10e516 (refs/remotes/a)
	M	foo
r3 = d63af9e39497115f910240116a66556215602849 (refs/remotes/trunk)
	A	a
r4 = 6838e87f711e8016a91048e4f4e481bf8dc27977 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.8b650e42-a499-4807-84fe-4f80d57a460e ...
Currently at 1 = 3fa5bc5d0cfb80b630b952a9ffaae8cea5634211
r3 = d63af9e39497115f910240116a66556215602849
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.8b650e42-a499-4807-84fe-4f80d57a460e
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.8b650e42-a499-4807-84fe-4f80d57a460e ...
Currently at 2 = e245de22a6949ab0cb44f96ccfd107967b10e516
r4 = 6838e87f711e8016a91048e4f4e481bf8dc27977
Done rebuilding .git/svn/refs/remotes/a/.rev_map.8b650e42-a499-4807-84fe-4f80d57a460e

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
