Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9158-git-svn-mergeinfo/.git/
define NO_SVN_TESTS to skip git svn tests
expecting success: 
	svn_cmd mkdir -m x "$svnrepo"/trunk &&
	svn_cmd co "$svnrepo"/trunk "$SVN_TREE" &&
	(
		cd "$SVN_TREE" &&
		touch foo &&
		svn_cmd add foo &&
		svn_cmd commit -m "initial commit"
	) &&
	rm -rf "$SVN_TREE"

Committed revision 1.
Checked out revision 1.
A         foo
Adding         foo
Transmitting file data .
Committed revision 2.

ok 1 - initialize source svn repo

expecting success: 
	git svn init "$svnrepo"/trunk &&
	git svn fetch
r1 = 784efe01c4b7ba8cd8ccfaf303e95aa039366bd9 (refs/remotes/git-svn)
	A	foo
r2 = 8445e1ebdd691bc8c0fdda2a0ccbd8220e1119f4 (refs/remotes/git-svn)

ok 2 - clone svn repo

expecting success: 
	touch bar &&
	git add bar &&
	git commit -m "bar" &&
	git svn dcommit --mergeinfo="/branches/foo:1-10"

[master 88b2d62] bar
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bar
Committing to file:///Users/trast/git-smoke/t/trash directory.t9158-git-svn-mergeinfo/svnrepo/trunk ...
	A	bar
Committed r3
	A	bar
r3 = 03fe895c4ce95d8a0db9ac3c565c2e4952dde6c0 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 3 - change svn:mergeinfo

expecting success: 
	mergeinfo=$(svn_cmd propget svn:mergeinfo "$svnrepo"/trunk)
	test "$mergeinfo" = "/branches/foo:1-10"


ok 4 - verify svn:mergeinfo

# passed all 4 test(s)
1..4
