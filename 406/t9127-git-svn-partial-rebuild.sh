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
r1 = e0588ff7812269dddf99208576acc011b4b52854 (refs/remotes/trunk)
r2 = 96c6096fb7e929fbffd8ed4cde2d7d142862f600 (refs/remotes/a)

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
r1 = e0588ff7812269dddf99208576acc011b4b52854 (refs/remotes/trunk)
r2 = 96c6096fb7e929fbffd8ed4cde2d7d142862f600 (refs/remotes/a)
	M	foo
r3 = 246e4bed616241e874ddfcecc329483a9bc0f90d (refs/remotes/trunk)
	A	a
r4 = 401e37acac5bb6873aafbe22c64af4ceb1c51e89 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.604b3c6d-4ee4-4fe2-b7ac-d83b5a4444ee ...
Currently at 1 = e0588ff7812269dddf99208576acc011b4b52854
r3 = 246e4bed616241e874ddfcecc329483a9bc0f90d
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.604b3c6d-4ee4-4fe2-b7ac-d83b5a4444ee
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.604b3c6d-4ee4-4fe2-b7ac-d83b5a4444ee ...
Currently at 2 = 96c6096fb7e929fbffd8ed4cde2d7d142862f600
r4 = 401e37acac5bb6873aafbe22c64af4ceb1c51e89
Done rebuilding .git/svn/refs/remotes/a/.rev_map.604b3c6d-4ee4-4fe2-b7ac-d83b5a4444ee

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
