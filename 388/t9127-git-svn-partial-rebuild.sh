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
r1 = c2210eaf0fac8e16410c706716edc5d5b5949858 (refs/remotes/trunk)
r2 = 102bd3413683999f06ca147acdc76ebebb599107 (refs/remotes/a)

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
r1 = c2210eaf0fac8e16410c706716edc5d5b5949858 (refs/remotes/trunk)
r2 = 102bd3413683999f06ca147acdc76ebebb599107 (refs/remotes/a)
	M	foo
r3 = 92b2e4e5945e1fd7b4fb60bf12af8fb95df26d96 (refs/remotes/trunk)
	A	a
r4 = c1814e11fa3309edc24013d22cea5ac40d1b5997 (refs/remotes/a)

ok 3 - make full git mirror of SVN

expecting success: 
	git config --add remote.origin.url "file://$PWD/mirror/.git" &&
	git config --add remote.origin.fetch refs/remotes/*:refs/remotes/* &&
	git fetch origin &&
	git svn fetch

Partial-rebuilding .git/svn/refs/remotes/trunk/.rev_map.8d7c8846-02e7-4d11-9dbe-4f345623072c ...
Currently at 1 = c2210eaf0fac8e16410c706716edc5d5b5949858
r3 = 92b2e4e5945e1fd7b4fb60bf12af8fb95df26d96
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.8d7c8846-02e7-4d11-9dbe-4f345623072c
Partial-rebuilding .git/svn/refs/remotes/a/.rev_map.8d7c8846-02e7-4d11-9dbe-4f345623072c ...
Currently at 2 = 102bd3413683999f06ca147acdc76ebebb599107
r4 = c1814e11fa3309edc24013d22cea5ac40d1b5997
Done rebuilding .git/svn/refs/remotes/a/.rev_map.8d7c8846-02e7-4d11-9dbe-4f345623072c

ok 4 - fetch from git mirror and partial-rebuild

# passed all 4 test(s)
1..4
