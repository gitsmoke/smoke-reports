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
r1 = 6aa1ed0c1644e49685fce099af3ccafe7eb0932d (refs/remotes/trunk)
r2 = 9a7bde4846a978e04863f68dc26bd3d836b2907b (refs/remotes/a)

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
r1 = 6aa1ed0c1644e49685fce099af3ccafe7eb0932d (refs/remotes/trunk)
r2 = 9a7bde4846a978e04863f68dc26bd3d836b2907b (refs/remotes/a)
	M	foo
r3 = dc8f0c8b94826c90f22a170bca5c937838f06434 (refs/remotes/trunk)
	A	a
r4 = 4db63da3c564517b90a524181e8eac3c3c724a55 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.0fdb423d-7125-4e87-a4ea-fdb348928c04 ...
Currently at 1 = 6aa1ed0c1644e49685fce099af3ccafe7eb0932d
r3 = dc8f0c8b94826c90f22a170bca5c937838f06434
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.0fdb423d-7125-4e87-a4ea-fdb348928c04
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.0fdb423d-7125-4e87-a4ea-fdb348928c04 ...
Currently at 2 = 9a7bde4846a978e04863f68dc26bd3d836b2907b
r4 = 4db63da3c564517b90a524181e8eac3c3c724a55
Done rebuilding .git/svn/refs/remotes/a/.rev_map.0fdb423d-7125-4e87-a4ea-fdb348928c04
ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
