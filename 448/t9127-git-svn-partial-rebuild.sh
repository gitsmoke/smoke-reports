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
r1 = 687ec40d54fa8d99996527f0a94c3f78436d7b66 (refs/remotes/trunk)
r2 = 8d0a53171a80209ca7de0060ea190c89dc72bfd0 (refs/remotes/a)

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
r1 = 687ec40d54fa8d99996527f0a94c3f78436d7b66 (refs/remotes/trunk)
r2 = 8d0a53171a80209ca7de0060ea190c89dc72bfd0 (refs/remotes/a)
	M	foo
r3 = 5df0f66dcb183785151691d3ed8ea53f5cd537bd (refs/remotes/trunk)
	A	a
r4 = a08904999ab28270af980a893a16323284111089 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.5fb92677-f96f-4143-a0e2-cab6a0654adc ...
Currently at 1 = 687ec40d54fa8d99996527f0a94c3f78436d7b66
r3 = 5df0f66dcb183785151691d3ed8ea53f5cd537bd
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.5fb92677-f96f-4143-a0e2-cab6a0654adc
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.5fb92677-f96f-4143-a0e2-cab6a0654adc ...
Currently at 2 = 8d0a53171a80209ca7de0060ea190c89dc72bfd0
r4 = a08904999ab28270af980a893a16323284111089
Done rebuilding .git/svn/refs/remotes/a/.rev_map.5fb92677-f96f-4143-a0e2-cab6a0654adc

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
