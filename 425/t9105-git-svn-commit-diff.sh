Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9105-git-svn-commit-diff/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		echo hello >readme &&
		svn_cmd import -m "initial" . "$svnrepo"
	) &&
	echo hello > readme &&
	git update-index --add readme &&
	git commit -a -m "initial" &&
	echo world >> readme &&
	git commit -a -m "another"
	
Adding         readme

Committed revision 1.
[master (root-commit) 7d6f8b5] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 readme
[master 0b39615] another
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - initialize repo

expecting success: 
	test -n "$prev" && test -n "$head" &&
	git svn commit-diff -r1 "$prev" "$head" "$svnrepo" &&
	svn_cmd co "$svnrepo" wc &&
	cmp readme wc/readme
	
	M	readme
Committed r2
A    wc/readme
Checked out revision 2.
ok 2 - test the commit-diff command
expecting success: 
	svn_cmd import -m "sub-directory" import "$svnrepo"/subdir &&
	git svn init --minimize-url "$svnrepo"/subdir &&
	git svn fetch &&
	git svn commit-diff -r3 "$prev" "$head" &&
	svn_cmd cat "$svnrepo"/subdir/readme > readme.2 &&
	cmp readme readme.2
	
Adding         import/readme

Committed revision 3.
	A	readme
r3 = 50602f237135bc4c32d0201e4c4e3b0a8654198a (refs/remotes/git-svn)
	M	readme
Committed r4

ok 3 - commit-diff to a sub-directory (with git svn config)

# passed all 3 test(s)
1..3
