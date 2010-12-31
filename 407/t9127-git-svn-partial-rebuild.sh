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
r1 = 43a0bd7289ce9e40fcb5150a37176868c95a1195 (refs/remotes/trunk)
r2 = 4e2fc9e007d024e6be46a05cea22c2ac27470ad7 (refs/remotes/a)
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
r1 = 43a0bd7289ce9e40fcb5150a37176868c95a1195 (refs/remotes/trunk)
r2 = 4e2fc9e007d024e6be46a05cea22c2ac27470ad7 (refs/remotes/a)
	M	foo
r3 = f7525f713d2f310f3e9b1f8b165eb1811fc28bfe (refs/remotes/trunk)
	A	a
r4 = 71fe34fd111d8c3c5f54c3ebf131ef5a6fb1a632 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.2ff057f9-4165-40bb-81bd-5ff69e1a0c3b ...
Currently at 1 = 43a0bd7289ce9e40fcb5150a37176868c95a1195
r3 = f7525f713d2f310f3e9b1f8b165eb1811fc28bfe
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.2ff057f9-4165-40bb-81bd-5ff69e1a0c3b
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.2ff057f9-4165-40bb-81bd-5ff69e1a0c3b ...
Currently at 2 = 4e2fc9e007d024e6be46a05cea22c2ac27470ad7
r4 = 71fe34fd111d8c3c5f54c3ebf131ef5a6fb1a632
Done rebuilding .git/svn/refs/remotes/a/.rev_map.2ff057f9-4165-40bb-81bd-5ff69e1a0c3b

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
