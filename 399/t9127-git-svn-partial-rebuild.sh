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
r1 = 716740ce5ebda21991c50586c55b50926c2546fb (refs/remotes/trunk)
r2 = 550df3e57e87f5f90d1aa588ac00d337d59764b8 (refs/remotes/a)
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
r1 = 716740ce5ebda21991c50586c55b50926c2546fb (refs/remotes/trunk)
r2 = 550df3e57e87f5f90d1aa588ac00d337d59764b8 (refs/remotes/a)
	M	foo
r3 = 7927b8db54eb457171dcaf9f8370a5ae3af06195 (refs/remotes/trunk)
	A	a
r4 = a218d2dbf4532481e7cea907bc63457ae77ce507 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.b3dc6f36-f6ed-4217-a2e1-434f899a7de7 ...
Currently at 1 = 716740ce5ebda21991c50586c55b50926c2546fb
r3 = 7927b8db54eb457171dcaf9f8370a5ae3af06195
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.b3dc6f36-f6ed-4217-a2e1-434f899a7de7
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.b3dc6f36-f6ed-4217-a2e1-434f899a7de7 ...
Currently at 2 = 550df3e57e87f5f90d1aa588ac00d337d59764b8
r4 = a218d2dbf4532481e7cea907bc63457ae77ce507
Done rebuilding .git/svn/refs/remotes/a/.rev_map.b3dc6f36-f6ed-4217-a2e1-434f899a7de7

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
