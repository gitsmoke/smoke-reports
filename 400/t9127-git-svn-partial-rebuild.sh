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
r1 = faf58d291da5730b0d40e41a2b1263338480cc7d (refs/remotes/trunk)
r2 = 5f9e56d5298544b7a43a5473f933ebf1f971b114 (refs/remotes/a)

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
r1 = faf58d291da5730b0d40e41a2b1263338480cc7d (refs/remotes/trunk)
r2 = 5f9e56d5298544b7a43a5473f933ebf1f971b114 (refs/remotes/a)
	M	foo
r3 = 7de2ada068309f69b9fd7bf5bc8b537c08b9ef56 (refs/remotes/trunk)
	A	a
r4 = c7346b484fa56201e5c756fae4908fd080c3dab7 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.bfe1a5ea-4d9d-4b0f-8afd-720c0e8e0b6a ...
Currently at 1 = faf58d291da5730b0d40e41a2b1263338480cc7d
r3 = 7de2ada068309f69b9fd7bf5bc8b537c08b9ef56
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.bfe1a5ea-4d9d-4b0f-8afd-720c0e8e0b6a
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.bfe1a5ea-4d9d-4b0f-8afd-720c0e8e0b6a ...
Currently at 2 = 5f9e56d5298544b7a43a5473f933ebf1f971b114
r4 = c7346b484fa56201e5c756fae4908fd080c3dab7
Done rebuilding .git/svn/refs/remotes/a/.rev_map.bfe1a5ea-4d9d-4b0f-8afd-720c0e8e0b6a

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
