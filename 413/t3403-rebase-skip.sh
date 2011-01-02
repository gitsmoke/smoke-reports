Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3403-rebase-skip/.git/
expecting success: 
	echo hello > hello &&
	git add hello &&
	git commit -m "hello" &&
	git branch skip-reference &&

	echo world >> hello &&
	git commit -a -m "hello world" &&
	echo goodbye >> hello &&
	git commit -a -m "goodbye" &&

	git checkout -f skip-reference &&
	echo moo > hello &&
	git commit -a -m "we should skip this" &&
	echo moo > cow &&
	git add cow &&
	git commit -m "this should not be skipped" &&
	git branch pre-rebase skip-reference &&
	git branch skip-merge skip-reference
	
[master (root-commit) c3251c9] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 hello
[master a9d4b41] hello world
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 5afebd9] goodbye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[skip-reference ec3ab8d] we should skip this
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[skip-reference 2905ae6] this should not be skipped
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 cow

ok 1 - setup

expecting success: 
	test_must_fail git rebase master
First, rewinding head to replay your work on top of it...
Applying: we should skip this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with we should skip this
Merging:
5afebd9 goodbye
virtual we should skip this
found 1 common ancestor(s):
virtual b4d01e9b0c4a9356736dfddf8830ba9a54f5271c
Auto-merging hello
CONFLICT (content): Merge conflict in hello
Failed to merge in the changes.
Patch failed at 0001 we should skip this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 2 - rebase with git am -3 (default)

expecting success: 
	git rebase --skip
	
HEAD is now at 5afebd9 goodbye
Applying: this should not be skipped
ok 3 - rebase --skip with am -3
expecting success: 
	test refs/heads/skip-reference = $(git symbolic-ref HEAD) &&
	git branch post-rebase &&
	git reset --hard pre-rebase &&
	test_must_fail git rebase master &&
	echo "hello" > hello &&
	git add hello &&
	git rebase --continue &&
	test refs/heads/skip-reference = $(git symbolic-ref HEAD) &&
	git reset --hard post-rebase
HEAD is now at 2905ae6 this should not be skipped
First, rewinding head to replay your work on top of it...
Applying: we should skip this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with we should skip this
Merging:
5afebd9 goodbye
virtual we should skip this
found 1 common ancestor(s):
virtual b4d01e9b0c4a9356736dfddf8830ba9a54f5271c
Auto-merging hello
CONFLICT (content): Merge conflict in hello
Failed to merge in the changes.
Patch failed at 0001 we should skip this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".
Applying: we should skip this
Applying: this should not be skipped
HEAD is now at 982d8fe this should not be skipped

ok 4 - rebase moves back to skip-reference

expecting success: git checkout -f skip-merge

ok 5 - checkout skip-merge

expecting success: 
	test_must_fail git rebase --merge master
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
5afebd9 goodbye
ec3ab8d we should skip this
found 1 common ancestor(s):
c3251c9 hello
Auto-merging hello
CONFLICT (content): Merge conflict in hello

ok 6 - rebase with --merge

expecting success: 
	git rebase --skip
	
HEAD is now at 5afebd9 goodbye
Merging master with HEAD~1
Merging:
5afebd9 goodbye
2905ae6 this should not be skipped
found 1 common ancestor(s):
ec3ab8d we should skip this
[detached HEAD f13ecc3] this should not be skipped
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 cow
Committed: 0001 this should not be skipped
Merging master with HEAD~0
Merging:
f13ecc3 this should not be skipped
2905ae6 this should not be skipped
found 1 common ancestor(s):
ec3ab8d we should skip this
Already applied: 0002 this should not be skipped
All done.

ok 7 - rebase --skip with --merge

expecting success: test -z "`git diff-tree skip-merge skip-reference`"

ok 8 - merge and reference trees equal

expecting success: 
	test refs/heads/skip-merge = $(git symbolic-ref HEAD)

ok 9 - moved back to branch correctly

# passed all 9 test(s)
1..9
