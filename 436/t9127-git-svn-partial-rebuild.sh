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
r1 = 5a34a919dfe6979bf497355f78c16ce808176387 (refs/remotes/trunk)
r2 = 0e3e9cfbbd1ed48955c233ef48879dad6a894cc1 (refs/remotes/a)

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
r1 = 5a34a919dfe6979bf497355f78c16ce808176387 (refs/remotes/trunk)
r2 = 0e3e9cfbbd1ed48955c233ef48879dad6a894cc1 (refs/remotes/a)
	M	foo
r3 = a0468d1dcc27f9ee742cd7fa7649b7be18b0627f (refs/remotes/trunk)
	A	a
r4 = 59e74320906d1f9a1344f03a865f4dd398ee9c3f (refs/remotes/a)
ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.1578b570-579e-4d48-ad82-d65bf33603ec ...
Currently at 1 = 5a34a919dfe6979bf497355f78c16ce808176387
r3 = a0468d1dcc27f9ee742cd7fa7649b7be18b0627f
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.1578b570-579e-4d48-ad82-d65bf33603ec
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.1578b570-579e-4d48-ad82-d65bf33603ec ...
Currently at 2 = 0e3e9cfbbd1ed48955c233ef48879dad6a894cc1
r4 = 59e74320906d1f9a1344f03a865f4dd398ee9c3f
Done rebuilding .git/svn/refs/remotes/a/.rev_map.1578b570-579e-4d48-ad82-d65bf33603ec

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
