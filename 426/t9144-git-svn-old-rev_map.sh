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
r1 = 0bf4a069f0eedaa88813b18b887274297d8da807 (refs/remotes/git-svn)

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
r2 = dd156fa971a225989fcbdaaa71fe8907b06d4f01 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
[master 539fcf6] -
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9144-git-svn-old-rev_map/svnrepo ...
	M	b/a
Committed r3
	M	b/a
r3 = 3c62910f417cc38c6a3760763543e3776334fe96 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 2 - old layout continues to work

# passed all 2 test(s)
1..2
