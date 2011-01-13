Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9144-git-svn-old-rev_map/.git/
expecting success: 
	mkdir i &&
	(cd i && > a) &&
	svn_cmd import -m- i "$svnrepo" &&
	git svn init "$svnrepo" &&
	git svn fetch &&
	test -d .git/svn/refs/remotes/git-svn/ &&
	! test -e .git/svn/git-svn/ &&
	mv .git/svn/refs/remotes/git-svn .git/svn/ &&
	rm -r .git/svn/refs

Adding         i/a

Committed revision 1.
	A	a
r1 = 44cca0749f54587613460c16ffc65b673ec4b11e (refs/remotes/git-svn)
ok 1 - setup test repository with old layout

expecting success: 
	svn_cmd import -m- i "$svnrepo/b" &&
	git svn rebase &&
	echo a >> b/a &&
	git add b/a &&
	git commit -m- -a &&
	git svn dcommit &&
	! test -d .git/svn/refs/ &&
	test -e .git/svn/git-svn/
Adding         i/a

Committed revision 2.
	A	b/a
r2 = 7b3e3f91966cd8e554eb7e5e8419f60e874bc00f (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
[master b0f9eaf] -
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9144-git-svn-old-rev_map/svnrepo ...
	M	b/a
Committed r3
	M	b/a
r3 = f166fd5f259aff76aa671b376c75eedb3b69c837 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 2 - old layout continues to work
# passed all 2 test(s)
1..2
