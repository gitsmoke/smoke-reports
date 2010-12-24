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
r1 = 531317705e33fe465101ba3b2f4fa6bf2a355feb (refs/remotes/trunk)
r2 = 8a91b14c5f21cf4981ec655e0824743e476102cb (refs/remotes/a)

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
r1 = 531317705e33fe465101ba3b2f4fa6bf2a355feb (refs/remotes/trunk)
r2 = 8a91b14c5f21cf4981ec655e0824743e476102cb (refs/remotes/a)
	M	foo
r3 = df27cabf5ee4873671d2bb83ed15fa132b25cd06 (refs/remotes/trunk)
	A	a
r4 = 807c93221196f2e85dd9aaaa77bc6780b2083be6 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.928e790b-20e3-40c9-aef2-a0eaec77cd57 ...
Currently at 1 = 531317705e33fe465101ba3b2f4fa6bf2a355feb
r3 = df27cabf5ee4873671d2bb83ed15fa132b25cd06
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.928e790b-20e3-40c9-aef2-a0eaec77cd57
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.928e790b-20e3-40c9-aef2-a0eaec77cd57 ...
Currently at 2 = 8a91b14c5f21cf4981ec655e0824743e476102cb
r4 = 807c93221196f2e85dd9aaaa77bc6780b2083be6
Done rebuilding .git/svn/refs/remotes/a/.rev_map.928e790b-20e3-40c9-aef2-a0eaec77cd57

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
