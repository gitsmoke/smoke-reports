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
[master (root-commit) 886c212] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 readme
[master 862e6e5] another
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
r3 = 454d83a8e6209b1aa5fccc7a63619f254e449e1c (refs/remotes/git-svn)
	M	readme
Committed r4

ok 3 - commit-diff to a sub-directory (with git svn config)

# passed all 3 test(s)
1..3
