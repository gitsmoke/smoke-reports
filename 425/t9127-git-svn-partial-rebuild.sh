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
r1 = 4902def6d362635aa32a42c5aa1a34be2452d6a9 (refs/remotes/trunk)
r2 = 4506449aeeac4ab0f017f0e9cc4e4ed016a77bd2 (refs/remotes/a)
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
r1 = 4902def6d362635aa32a42c5aa1a34be2452d6a9 (refs/remotes/trunk)
r2 = 4506449aeeac4ab0f017f0e9cc4e4ed016a77bd2 (refs/remotes/a)
	M	foo
r3 = f5434546aa5d9e874ff6ddb32f253b757c78d6c5 (refs/remotes/trunk)
	A	a
r4 = b021c53b7bc272057fe41b26141b9485cdbd6158 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.316fd004-9d4e-47eb-b056-72a736bd90ac ...
Currently at 1 = 4902def6d362635aa32a42c5aa1a34be2452d6a9
r3 = f5434546aa5d9e874ff6ddb32f253b757c78d6c5
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.316fd004-9d4e-47eb-b056-72a736bd90ac
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.316fd004-9d4e-47eb-b056-72a736bd90ac ...
Currently at 2 = 4506449aeeac4ab0f017f0e9cc4e4ed016a77bd2
r4 = b021c53b7bc272057fe41b26141b9485cdbd6158
Done rebuilding .git/svn/refs/remotes/a/.rev_map.316fd004-9d4e-47eb-b056-72a736bd90ac

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
