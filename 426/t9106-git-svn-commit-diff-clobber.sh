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
[master (root-commit) c5419c0] initial
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
[master ce95c77] second line from git
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
	
HEAD is now at c5419c0 initial
[master 07aa87a] second line from svn
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0980061] third line from git
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
r1 = 65787dd0cdbf1e21e7650ea4186f02e77579f2ba (refs/remotes/git-svn)
	M	file
r2 = 4cf09dd18e8153cc53d0ea42a885a351e5c8ddc9 (refs/remotes/git-svn)
	M	file
r3 = 6a75ad6905f7db6782af30164a9f4703bf4ff646 (refs/remotes/git-svn)
HEAD is now at 6a75ad6 third line from git
A    t.svn/file
Checked out revision 3.
Sending        file
Transmitting file data .
Committed revision 4.
[master d13e1fd] fourth line from git
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
	
HEAD is now at 6a75ad6 third line from git
[master b91dff0] index merge
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master f2c0d5e] more changes
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	file2
Committed r5
	M	file
r4 = 1e7f28c4669ae0b971da222d311fad98e2756645 (refs/remotes/git-svn)
	A	file2
r5 = a03505dbec8dd6fc9fd9f53d89f70b0edc64e89c (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: more changes
	M	file2
Committed r6
	M	file2
r6 = 8eef4b5fb50a8e170506ab359eb4e5aeed579a82 (refs/remotes/git-svn)
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
	
HEAD is now at 8eef4b5 more changes
[master dfbb123] new file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new-file
[master dde755c] clobber
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 4 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	new-file
Committed r8
	M	file
r7 = c7c852918b389f6240d09902d8b1c7f20794dce5 (refs/remotes/git-svn)
	A	new-file
r8 = 16104ad43978389a022f352da7f0218dfa41fb80 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: clobber
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with clobber
Merging:
16104ad new file
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
r9 = d282a6d86b45d6066b2d34dc5405978acb3d7bdc (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 10 - resolve, continue the rebase and dcommit
# passed all 10 test(s)
1..10
