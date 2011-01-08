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
r1 = 6cce7fc5186f21282d3babf825e21c88b462ed45 (refs/remotes/trunk)
r2 = 8a582a9794f28c4bfeebf32b7cc0ddafbfc2e794 (refs/remotes/a)

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
r1 = 6cce7fc5186f21282d3babf825e21c88b462ed45 (refs/remotes/trunk)
r2 = 8a582a9794f28c4bfeebf32b7cc0ddafbfc2e794 (refs/remotes/a)
	M	foo
r3 = 3cfd1dc23ac89f7fa87439fd00d400cc71a294ff (refs/remotes/trunk)
	A	a
r4 = 4ccf44cc0e09039e9d87d53303fdadd4dbff7fa0 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.b1cc5b59-ea8c-4831-bf1b-f565ce2943a6 ...
Currently at 1 = 6cce7fc5186f21282d3babf825e21c88b462ed45
r3 = 3cfd1dc23ac89f7fa87439fd00d400cc71a294ff
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.b1cc5b59-ea8c-4831-bf1b-f565ce2943a6
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.b1cc5b59-ea8c-4831-bf1b-f565ce2943a6 ...
Currently at 2 = 8a582a9794f28c4bfeebf32b7cc0ddafbfc2e794
r4 = 4ccf44cc0e09039e9d87d53303fdadd4dbff7fa0
Done rebuilding .git/svn/refs/remotes/a/.rev_map.b1cc5b59-ea8c-4831-bf1b-f565ce2943a6

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
