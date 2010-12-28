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
r1 = 774a7aedcae04fd479c35b287a608891deba7938 (refs/remotes/trunk)
r2 = 8791cb7f201c688c0997c7127d1b766b50b937d3 (refs/remotes/a)

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
r1 = 774a7aedcae04fd479c35b287a608891deba7938 (refs/remotes/trunk)
r2 = 8791cb7f201c688c0997c7127d1b766b50b937d3 (refs/remotes/a)
	M	foo
r3 = 16c327d3f75c67ad11fa04d196bba7cef3a335f7 (refs/remotes/trunk)
	A	a
r4 = 845d3ee94d260965a03cce7ef44f3e8e64fe8645 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.052e3d60-552f-47f4-83a1-38e16f63d21e ...
Currently at 1 = 774a7aedcae04fd479c35b287a608891deba7938
r3 = 16c327d3f75c67ad11fa04d196bba7cef3a335f7
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.052e3d60-552f-47f4-83a1-38e16f63d21e
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.052e3d60-552f-47f4-83a1-38e16f63d21e ...
Currently at 2 = 8791cb7f201c688c0997c7127d1b766b50b937d3
r4 = 845d3ee94d260965a03cce7ef44f3e8e64fe8645
Done rebuilding .git/svn/refs/remotes/a/.rev_map.052e3d60-552f-47f4-83a1-38e16f63d21e

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
