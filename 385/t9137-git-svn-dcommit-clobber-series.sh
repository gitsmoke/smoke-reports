Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9137-git-svn-dcommit-clobber-series/.git/
expecting success: 
	mkdir import &&
	(cd import &&
	awk "BEGIN { for (i = 1; i < 64; i++) { print i } }" > file
	svn_cmd import -m "initial" . "$svnrepo"
	) &&
	git svn init "$svnrepo" &&
	git svn fetch &&
	test -e file
	
Adding         file

Committed revision 1.
	A	file
r1 = a96c53889dd40068f09a3a2a9dba5fcbbf7622b7 (refs/remotes/git-svn)

ok 1 - initialize repo

expecting success: 
	test x"`sed -n -e 58p < file`" = x58 &&
	test x"`sed -n -e 61p < file`" = x61 &&
	svn_cmd co "$svnrepo" tmp &&
	(cd tmp &&
		perl -i.bak -p -e "s/^58$/5588/" file &&
		perl -i.bak -p -e "s/^61$/6611/" file &&
		poke file &&
		test x"`sed -n -e 58p < file`" = x5588 &&
		test x"`sed -n -e 61p < file`" = x6611 &&
		svn_cmd commit -m "58 => 5588, 61 => 6611"
	)
	
A    tmp/file
Checked out revision 1.
Sending        file
Transmitting file data .
Committed revision 2.

ok 2 - (supposedly) non-conflicting change from SVN

expecting success: 
	echo hi > life &&
	git update-index --add life &&
	git commit -m hi-life &&
	echo bye >> life &&
	git commit -m bye-life life
	
[master 31cfc17] hi-life
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 life
[master 963d870] bye-life
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - some unrelated changes to git

expecting success: 
	test x"`sed -n -e 4p < file`" = x4 &&
	test x"`sed -n -e 7p < file`" = x7 &&
	perl -i.bak -p -e 's/^4$/4444/' file &&
	perl -i.bak -p -e 's/^7$/7777/' file &&
	test x"`sed -n -e 4p < file`" = x4444 &&
	test x"`sed -n -e 7p < file`" = x7777 &&
	git commit -m '4 => 4444, 7 => 7777' file &&
	git svn dcommit &&
	svn_cmd up tmp &&
	cd tmp &&
		test x"`sed -n -e 4p < file`" = x4444 &&
		test x"`sed -n -e 7p < file`" = x7777 &&
		test x"`sed -n -e 58p < file`" = x5588 &&
		test x"`sed -n -e 61p < file`" = x6611
	
[master 596540b] 4 => 4444, 7 => 7777
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 2 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9137-git-svn-dcommit-clobber-series/svnrepo ...
	A	life
Committed r3
	M	file
r2 = fe0725d4c4950f5e16242d4ca49ce5601cc11cf5 (refs/remotes/git-svn)
	A	life
r3 = 75dcd917bc14e8956b43c271eda5481289da3a93 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: bye-life
Applying: 4 => 4444, 7 => 7777
	M	life
Committed r4
	M	life
r4 = d778fdb4e94f5ca005ceba5e58920e4a99c50187 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
Unstaged changes after reset:
M	file
	M	file
Committed r5
	M	file
r5 = a9c26e7ade65022a0f22634b3326454a37a71dc7 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
U    tmp/file
A    tmp/life
Updated to revision 5.

ok 4 - change file but in unrelated area

expecting success: 
	echo foo >>file &&
	git add file &&
	test_must_fail git svn dcommit


ok 5 - attempt to dcommit with a dirty index

# passed all 5 test(s)
1..5
