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
r1 = fe48cae0a78a93b81b72d6ff22ee95ab44138c5d (refs/remotes/trunk)
r2 = 51250e3dd4e04947d45fc5125199df1f1a3f1dfc (refs/remotes/a)
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
r1 = fe48cae0a78a93b81b72d6ff22ee95ab44138c5d (refs/remotes/trunk)
r2 = 51250e3dd4e04947d45fc5125199df1f1a3f1dfc (refs/remotes/a)
	M	foo
r3 = ad3dbd4f7b53de22a10ca10861dc10df1172d9db (refs/remotes/trunk)
	A	a
r4 = 506301bc15478517a231d9ccdbb20cd42f56b4d1 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.02feda04-2cb4-49d1-8d4c-8cc51c4ed4bd ...
Currently at 1 = fe48cae0a78a93b81b72d6ff22ee95ab44138c5d
r3 = ad3dbd4f7b53de22a10ca10861dc10df1172d9db
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.02feda04-2cb4-49d1-8d4c-8cc51c4ed4bd
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.02feda04-2cb4-49d1-8d4c-8cc51c4ed4bd ...
Currently at 2 = 51250e3dd4e04947d45fc5125199df1f1a3f1dfc
r4 = 506301bc15478517a231d9ccdbb20cd42f56b4d1
Done rebuilding .git/svn/refs/remotes/a/.rev_map.02feda04-2cb4-49d1-8d4c-8cc51c4ed4bd

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
