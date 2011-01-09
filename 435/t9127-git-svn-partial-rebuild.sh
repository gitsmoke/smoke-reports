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
r1 = bef4be66e8ab7226d4a652102ca386efe9966763 (refs/remotes/trunk)
r2 = 68cf3d63c87b38f9b356f71e2893a5406f3fbc4a (refs/remotes/a)
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
r1 = bef4be66e8ab7226d4a652102ca386efe9966763 (refs/remotes/trunk)
r2 = 68cf3d63c87b38f9b356f71e2893a5406f3fbc4a (refs/remotes/a)
	M	foo
r3 = 8f4522f3b1d91e9db18c61000d819e17afbd683d (refs/remotes/trunk)
	A	a
r4 = 16eb314a40a33ce3879e160f9b64ffbca711a0f1 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.b14b18cd-7816-4e51-b993-9f60dae801d2 ...
Currently at 1 = bef4be66e8ab7226d4a652102ca386efe9966763
r3 = 8f4522f3b1d91e9db18c61000d819e17afbd683d
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.b14b18cd-7816-4e51-b993-9f60dae801d2
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.b14b18cd-7816-4e51-b993-9f60dae801d2 ...
Currently at 2 = 68cf3d63c87b38f9b356f71e2893a5406f3fbc4a
r4 = 16eb314a40a33ce3879e160f9b64ffbca711a0f1
Done rebuilding .git/svn/refs/remotes/a/.rev_map.b14b18cd-7816-4e51-b993-9f60dae801d2

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
