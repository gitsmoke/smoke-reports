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
r1 = 7dd8f773a6985b0426d45fc4f1d76ee8e3ec298e (refs/remotes/git-svn)

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
	
[master 420afef] hi-life
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 life
[master c237fb8] bye-life
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
	
[master 353f335] 4 => 4444, 7 => 7777
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 2 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9137-git-svn-dcommit-clobber-series/svnrepo ...
	A	life
Committed r3
	M	file
r2 = 6fe46102ab9933a1321d6a4e3d569cf5f0e87ac5 (refs/remotes/git-svn)
	A	life
r3 = c7636f1ee8056c514ddc90dc48012420ee85d1b6 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: bye-life
Applying: 4 => 4444, 7 => 7777
	M	life
Committed r4
	M	life
r4 = db61ab4a2d1b89f7b12e4a1c9a1a44a9a125dae7 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
Unstaged changes after reset:
M	file
	M	file
Committed r5
	M	file
r5 = c3addf61b67f851a76f265d81c92252f49d43299 (refs/remotes/git-svn)
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
