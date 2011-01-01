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
r1 = 7996e1ed947d094a30d2c21df69a4fed409a563a (refs/remotes/trunk)
r2 = bb70eaabc996d6bed1849444ca0d63d64b1146f1 (refs/remotes/a)
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
r1 = 7996e1ed947d094a30d2c21df69a4fed409a563a (refs/remotes/trunk)
r2 = bb70eaabc996d6bed1849444ca0d63d64b1146f1 (refs/remotes/a)
	M	foo
r3 = 9355d1add7b2f87b982d6a4c1a45b9035639493c (refs/remotes/trunk)
	A	a
r4 = eabf26f38a91015833d3c0ec681c5f0509bed87f (refs/remotes/a)
ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.a3e1da9a-8266-4fdc-b23f-e7a9de5c5b22 ...
Currently at 1 = 7996e1ed947d094a30d2c21df69a4fed409a563a
r3 = 9355d1add7b2f87b982d6a4c1a45b9035639493c
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.a3e1da9a-8266-4fdc-b23f-e7a9de5c5b22
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.a3e1da9a-8266-4fdc-b23f-e7a9de5c5b22 ...
Currently at 2 = bb70eaabc996d6bed1849444ca0d63d64b1146f1
r4 = eabf26f38a91015833d3c0ec681c5f0509bed87f
Done rebuilding .git/svn/refs/remotes/a/.rev_map.a3e1da9a-8266-4fdc-b23f-e7a9de5c5b22

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
