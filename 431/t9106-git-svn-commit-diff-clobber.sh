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
[master (root-commit) 7417a5e] initial
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
[master 5b3c572] second line from git
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
	
HEAD is now at 7417a5e initial
[master 28b8373] second line from svn
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 7c484f0] third line from git
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
r1 = e5c51ba590a3a71bb352ad243baa32b438a815cd (refs/remotes/git-svn)
	M	file
r2 = e51216224af28e52183f7d3844e287c670c91cb0 (refs/remotes/git-svn)
	M	file
r3 = 5d3f7b96eef7c97c9e71d5f5dfb6de3062947f2c (refs/remotes/git-svn)
HEAD is now at 5d3f7b9 third line from git
A    t.svn/file
Checked out revision 3.
Sending        file
Transmitting file data .
Committed revision 4.
[master 305e733] fourth line from git
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
	
HEAD is now at 5d3f7b9 third line from git
[master 4281e14] index merge
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master be791ee] more changes
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	file2
Committed r5
	M	file
r4 = 8cd512cf06de3b67efff3b49bbc3c62ef2e8a210 (refs/remotes/git-svn)
	A	file2
r5 = 158b907b6724b0c03b5287e1697b13f02451cd72 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: more changes
	M	file2
Committed r6
	M	file2
r6 = dc548901f7db5f50a0fd6edbe8fea5127f1aa8f1 (refs/remotes/git-svn)
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
	
HEAD is now at dc54890 more changes
[master e59002b] new file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new-file
[master 79bf444] clobber
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 4 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9106-git-svn-commit-diff-clobber/svnrepo ...
	A	new-file
Committed r8
	M	file
r7 = 387c9d1ac332333451ad1e682d94c9e3b9aeef22 (refs/remotes/git-svn)
	A	new-file
r8 = 9aaf74fdc826bf9937e6e2b7b7139039aa964696 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: clobber
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with clobber
Merging:
9aaf74f new file
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
r9 = 8515de99bd914616d99ec1dbf90804ff3bef837f (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 10 - resolve, continue the rebase and dcommit

# passed all 10 test(s)
1..10
