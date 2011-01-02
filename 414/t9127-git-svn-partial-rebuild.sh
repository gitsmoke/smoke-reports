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
r1 = db92840806a1cda82115eb72de3d0a2c3cde393d (refs/remotes/trunk)
r2 = 8fb2077d3304208de8a87f761b1bcf6622e03d88 (refs/remotes/a)

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
r1 = db92840806a1cda82115eb72de3d0a2c3cde393d (refs/remotes/trunk)
r2 = 8fb2077d3304208de8a87f761b1bcf6622e03d88 (refs/remotes/a)
	M	foo
r3 = a59375e95ddb7c6e6bc5cae719272bfeeecf88e9 (refs/remotes/trunk)
	A	a
r4 = f49aff54b6c7d1ee86bb6d6f910bd0a24681dd94 (refs/remotes/a)
ok 3 - make full git mirror of SVN
expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.8d1a617a-bb1b-45ea-9492-fdba480d7ed3 ...
Currently at 1 = db92840806a1cda82115eb72de3d0a2c3cde393d
r3 = a59375e95ddb7c6e6bc5cae719272bfeeecf88e9
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.8d1a617a-bb1b-45ea-9492-fdba480d7ed3
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.8d1a617a-bb1b-45ea-9492-fdba480d7ed3 ...
Currently at 2 = 8fb2077d3304208de8a87f761b1bcf6622e03d88
r4 = f49aff54b6c7d1ee86bb6d6f910bd0a24681dd94
Done rebuilding .git/svn/refs/remotes/a/.rev_map.8d1a617a-bb1b-45ea-9492-fdba480d7ed3

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
