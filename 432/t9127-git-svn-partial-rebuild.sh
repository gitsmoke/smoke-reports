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
r1 = 9aba039ce882d7cf17e310ea60acee7dd7abbf3e (refs/remotes/trunk)
r2 = 21a46e998748bc6a0048f6dea049cab86f091f3f (refs/remotes/a)
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
r1 = 9aba039ce882d7cf17e310ea60acee7dd7abbf3e (refs/remotes/trunk)
r2 = 21a46e998748bc6a0048f6dea049cab86f091f3f (refs/remotes/a)
	M	foo
r3 = 4ff75d3634adb9a3664e8bc5c9ea24d21a68ea37 (refs/remotes/trunk)
	A	a
r4 = 0d27451160a219651240ab09a63aca143da01202 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.feee8ed8-e52b-4042-9a44-4702f417e6a5 ...
Currently at 1 = 9aba039ce882d7cf17e310ea60acee7dd7abbf3e
r3 = 4ff75d3634adb9a3664e8bc5c9ea24d21a68ea37
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.feee8ed8-e52b-4042-9a44-4702f417e6a5
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.feee8ed8-e52b-4042-9a44-4702f417e6a5 ...
Currently at 2 = 21a46e998748bc6a0048f6dea049cab86f091f3f
r4 = 0d27451160a219651240ab09a63aca143da01202
Done rebuilding .git/svn/refs/remotes/a/.rev_map.feee8ed8-e52b-4042-9a44-4702f417e6a5

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
