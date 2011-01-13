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
r1 = 59ee152ace18cb6beabb4433fdf417399b7d51a8 (refs/remotes/trunk)
r2 = 9ecbaef6370ab31ba3151a668215ec6baf3ad9a1 (refs/remotes/a)

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
r1 = 59ee152ace18cb6beabb4433fdf417399b7d51a8 (refs/remotes/trunk)
r2 = 9ecbaef6370ab31ba3151a668215ec6baf3ad9a1 (refs/remotes/a)
	M	foo
r3 = 4b6a83d3e14bb2a3ccb0d07c1a9cac525b64501a (refs/remotes/trunk)
	A	a
r4 = 72391f89130761b669f66b8c17d147324046177f (refs/remotes/a)
ok 3 - make full git mirror of SVN
expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch
Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.81426392-4ee6-4104-94ce-5b36721edcb3 ...
Currently at 1 = 59ee152ace18cb6beabb4433fdf417399b7d51a8
r3 = 4b6a83d3e14bb2a3ccb0d07c1a9cac525b64501a
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.81426392-4ee6-4104-94ce-5b36721edcb3
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.81426392-4ee6-4104-94ce-5b36721edcb3 ...
Currently at 2 = 9ecbaef6370ab31ba3151a668215ec6baf3ad9a1
r4 = 72391f89130761b669f66b8c17d147324046177f
Done rebuilding .git/svn/refs/remotes/a/.rev_map.81426392-4ee6-4104-94ce-5b36721edcb3

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
