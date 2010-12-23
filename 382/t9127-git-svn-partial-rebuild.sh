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
r1 = e15e3307092a399adbe2cb5ed89fde94badb91e3 (refs/remotes/trunk)
r2 = d20bb061381c3013839bb3b89bbf8a62be0ba014 (refs/remotes/a)
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
r1 = e15e3307092a399adbe2cb5ed89fde94badb91e3 (refs/remotes/trunk)
r2 = d20bb061381c3013839bb3b89bbf8a62be0ba014 (refs/remotes/a)
	M	foo
r3 = 91ee887e5a2c92c620cbd1aa2095f3990aff36c7 (refs/remotes/trunk)
	A	a
r4 = e4d8abfd165979b5957a4e50f734ed5876923fb8 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.325df4e2-219e-468b-a578-3b319c5daf05 ...
Currently at 1 = e15e3307092a399adbe2cb5ed89fde94badb91e3
r3 = 91ee887e5a2c92c620cbd1aa2095f3990aff36c7
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.325df4e2-219e-468b-a578-3b319c5daf05
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.325df4e2-219e-468b-a578-3b319c5daf05 ...
Currently at 2 = d20bb061381c3013839bb3b89bbf8a62be0ba014
r4 = e4d8abfd165979b5957a4e50f734ed5876923fb8
Done rebuilding .git/svn/refs/remotes/a/.rev_map.325df4e2-219e-468b-a578-3b319c5daf05

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
