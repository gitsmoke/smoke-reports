Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		echo initial >file &&
		svn_cmd import -m "initial" . "$svnrepo"
	) &&
	echo initial > file &&
	git update-index --add file &&
	git commit -a -m "initial"
	
Adding         file

Committed revision 1.
[master (root-commit) 1dac1b7] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - initialize repo
expecting success: 
	svn_cmd co "$svnrepo" t.svn &&
	(
		cd t.svn &&
		echo second line from svn >>file &&
		poke file &&
		svn_cmd commit -m "second line from svn"
	) &&
	rm -rf t.svn
	
A    t.svn/file
Checked out revision 1.
Sending        file
Transmitting file data .
Committed revision 2.

ok 2 - commit change from svn side

expecting success: 
	echo second line from git >> file &&
	git commit -a -m "second line from git" &&
	test_must_fail git svn commit-diff -r1 HEAD~1 HEAD "$svnrepo"

[master 88f1018] second line from git
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - commit conflicting change from git

expecting success: 
	git reset --hard HEAD~1 &&
	echo second line from svn >> file &&
	git commit -a -m "second line from svn" &&
	echo third line from git >> file &&
	git commit -a -m "third line from git" &&
	git svn commit-diff -r2 HEAD~1 HEAD "$svnrepo"
	
HEAD is now at 1dac1b7 initial
[master 2d01808] second line from svn
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master e2cae8c] third line from git
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
	M	file
Committed r3

ok 4 - commit complementing change from git

expecting success: 
	git svn init "$svnrepo" &&
	git svn fetch &&
	git reset --hard refs/${remotes_git_svn} &&
	svn_cmd co "$svnrepo" t.svn &&
	(
		cd t.svn &&
		echo fourth line from svn >>file &&
		poke file &&
		svn_cmd commit -m "fourth line from svn"
	) &&
	rm -rf t.svn &&
	echo "fourth line from git" >> file &&
	git commit -a -m "fourth line from git" &&
	test_must_fail git svn dcommit
	
	A	file
r1 = 017be12b141832418764bafe8558861d9eaa83b4 (refs/remotes/git-svn)
	M	file
r2 = 2a95f1649bb20b0c87612747cd168f35b82c8d2a (refs/remotes/git-svn)
	M	file
r3 = a6ab4f77b188e8cb88466fde44a1e7b88a0809b0 (refs/remotes/git-svn)
HEAD is now at a6ab4f7 third line from git
A    t.svn/file
Checked out revision 3.
Sending        file
Transmitting file data .
Committed revision 4.
[master 48ecdd3] fourth line from git
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
ok 5 - dcommit fails to commit because of conflict
expecting success: 
	git reset --hard refs/remotes/git-svn &&
	echo 'index merge' > file2 &&
	git update-index --add file2 &&
	git commit -a -m 'index merge' &&
	echo 'more changes' >> file2 &&
	git update-index file2 &&
	git commit -a -m 'more changes' &&
	git svn dcommit
	
HEAD is now at a6ab4f7 third line from git
[master 0da57a4] index merge
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master acae3cc] more changes
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	file2
Committed r5
	M	file
r4 = d906c97a68989fe1e5622d3d15b32264e3eeee1f (refs/remotes/git-svn)
	A	file2
r5 = b5e22c618e9f66a98c0664fc6175f785b55192dc (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: more changes
	M	file2
Committed r6
	M	file2
r6 = b985c2be948d7b960dd416893ca790b849fef53a (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 6 - dcommit does the svn equivalent of an index merge

expecting success: 
	svn_cmd co "$svnrepo" t.svn &&
	(
		cd t.svn &&
		echo third line from svn >>file &&
		poke file &&
		svn_cmd commit -m "third line from svn"
	) &&
	rm -rf t.svn
	
A    t.svn/file
A    t.svn/file2
Checked out revision 6.
Sending        file
Transmitting file data .
Committed revision 7.

ok 7 - commit another change from svn side

expecting success: 
	git reset --hard refs/remotes/git-svn &&
	echo new file >> new-file &&
	git update-index --add new-file &&
	git commit -a -m 'new file' &&
	echo clobber > file &&
	git commit -a -m 'clobber' &&
	test_must_fail git svn dcommit
	
HEAD is now at b985c2b more changes
[master c24653d] new file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new-file
[master 477edea] clobber
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 4 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	new-file
Committed r8
	M	file
r7 = 1b2d6c0c74d76a8ca138701666ed2a760b7208a3 (refs/remotes/git-svn)
	A	new-file
r8 = ee5a1cd0b2d0d97c58cd8129b56148881f5bddd0 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: clobber
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with clobber
Merging:
ee5a1cd new file
virtual clobber
found 1 common ancestor(s):
virtual 76ac259f7ab5e2e4bb7a2fecf07396a2695c68c9
Auto-merging file
CONFLICT (content): Merge conflict in file
Failed to merge in the changes.
Patch failed at 0001 clobber

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 8 - multiple dcommit from git svn will not clobber svn

expecting success: 
	test -d .git/rebase-apply


ok 9 - check that rebase really failed

expecting success: 
	echo clobber and I really mean it > file &&
	git update-index file &&
	git rebase --continue &&
	git svn dcommit
	
Applying: clobber
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	M	file
Committed r9
	M	file
r9 = e1d8df5cab5ceae874563eb8299f49062ffc2b21 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 10 - resolve, continue the rebase and dcommit

# passed all 10 test(s)
1..10
