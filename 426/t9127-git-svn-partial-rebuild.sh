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
r1 = c20b1f9580076bffa74be8ee4aa5c37b1c18f35e (refs/remotes/trunk)
r2 = 3feedabb540007694bd3895ba7883761afca0554 (refs/remotes/a)

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
r1 = c20b1f9580076bffa74be8ee4aa5c37b1c18f35e (refs/remotes/trunk)
r2 = 3feedabb540007694bd3895ba7883761afca0554 (refs/remotes/a)
	M	foo
r3 = fc42494cf8382a59ab3c97b1a43f605c35e04c0c (refs/remotes/trunk)
	A	a
r4 = 44c592fbbba3cc824a0a455b46041b5f4e49e153 (refs/remotes/a)
ok 3 - make full git mirror of SVN
expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.0d03cc35-7afa-4448-92dd-5b180937042f ...
Currently at 1 = c20b1f9580076bffa74be8ee4aa5c37b1c18f35e
r3 = fc42494cf8382a59ab3c97b1a43f605c35e04c0c
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.0d03cc35-7afa-4448-92dd-5b180937042f
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.0d03cc35-7afa-4448-92dd-5b180937042f ...
Currently at 2 = 3feedabb540007694bd3895ba7883761afca0554
r4 = 44c592fbbba3cc824a0a455b46041b5f4e49e153
Done rebuilding .git/svn/refs/remotes/a/.rev_map.0d03cc35-7afa-4448-92dd-5b180937042f

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
