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
r1 = abdf53b7015e9b8dfb18dc41996dd5427f16b4fd (refs/remotes/trunk)
r2 = 247d7afd696074e14626107233d09421870efe5f (refs/remotes/a)

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
r1 = abdf53b7015e9b8dfb18dc41996dd5427f16b4fd (refs/remotes/trunk)
r2 = 247d7afd696074e14626107233d09421870efe5f (refs/remotes/a)
	M	foo
r3 = 51101038a5ecdcd73cde2184f1438fe957c9d668 (refs/remotes/trunk)
	A	a
r4 = b2ce7a9a108e1a31331483c75ea3095edae2f54f (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.5e39a5d7-0efb-4858-ac4e-ee6ea880cf9e ...
Currently at 1 = abdf53b7015e9b8dfb18dc41996dd5427f16b4fd
r3 = 51101038a5ecdcd73cde2184f1438fe957c9d668
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.5e39a5d7-0efb-4858-ac4e-ee6ea880cf9e
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.5e39a5d7-0efb-4858-ac4e-ee6ea880cf9e ...
Currently at 2 = 247d7afd696074e14626107233d09421870efe5f
r4 = b2ce7a9a108e1a31331483c75ea3095edae2f54f
Done rebuilding .git/svn/refs/remotes/a/.rev_map.5e39a5d7-0efb-4858-ac4e-ee6ea880cf9e

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
