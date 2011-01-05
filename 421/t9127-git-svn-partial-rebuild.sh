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
r1 = 83072c32aa983066a615b2d0bea8f7be96f2f5aa (refs/remotes/trunk)
r2 = 7cefe1131d82c572eb125667e16937738134ff27 (refs/remotes/a)

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
r1 = 83072c32aa983066a615b2d0bea8f7be96f2f5aa (refs/remotes/trunk)
r2 = 7cefe1131d82c572eb125667e16937738134ff27 (refs/remotes/a)
	M	foo
r3 = 14ee8d0f51af43055286919f80c628bc6a5c683a (refs/remotes/trunk)
	A	a
r4 = d47f36fcf3027e0855a0b7dc060303801882edb2 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.21358538-b82b-4c60-bb8b-b3c74c7358b4 ...
Currently at 1 = 83072c32aa983066a615b2d0bea8f7be96f2f5aa
r3 = 14ee8d0f51af43055286919f80c628bc6a5c683a
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.21358538-b82b-4c60-bb8b-b3c74c7358b4
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.21358538-b82b-4c60-bb8b-b3c74c7358b4 ...
Currently at 2 = 7cefe1131d82c572eb125667e16937738134ff27
r4 = d47f36fcf3027e0855a0b7dc060303801882edb2
Done rebuilding .git/svn/refs/remotes/a/.rev_map.21358538-b82b-4c60-bb8b-b3c74c7358b4

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
