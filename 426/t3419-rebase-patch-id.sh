Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3419-rebase-patch-id/.git/
expecting success: 
	git commit --allow-empty -m initial
	git tag root

[master (root-commit) ebec4c5] initial
 Author: A U Thor <author@example.com>

ok 1 - setup

expecting success: 
		rm -f .gitattributes &&
		git checkout -q -f master &&
		git reset --hard root &&
		count 500 >file &&
		git add file &&
		git commit -q -m initial &&
		git branch -f other &&

		scramble file &&
		git add file &&
		git commit -q -m 'change big file' &&

		git checkout -q other &&
		: >newfile &&
		git add newfile &&
		git commit -q -m 'add small file' &&

		git cherry-pick master >/dev/null 2>&1
	
HEAD is now at ebec4c5 initial

ok 2 - setup: 500 lines

expecting success: 
		echo 'file binary' >.gitattributes
	

ok 3 - setup attributes

expecting success: 
		git checkout -q master &&
		scramble file &&
		git add file &&
		git commit -q -m 'change big file again' &&
		git checkout -q other^{} &&
		git rebase master &&
		test_must_fail test -n "$(git rev-list master...HEAD~)"
	
First, rewinding head to replay your work on top of it...
Applying: add small file

ok 4 - detect upstream patch

expecting success: 
		git branch -f squashed master &&
		git checkout -q -f squashed &&
		git reset -q --soft HEAD~2 &&
		git commit -q -m squashed &&
		git checkout -q other^{} &&
		test_must_fail git rebase squashed &&
		rm -rf .git/rebase-apply
	
First, rewinding head to replay your work on top of it...
Applying: add small file
Applying: change big file
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with change big file
Merging:
c09240a add small file
virtual change big file
found 1 common ancestor(s):
virtual e5dcc7c81f494dce9da11f93c6ea59bdc75c6013
Auto-merging file
CONFLICT (content): Merge conflict in file
Failed to merge in the changes.
Patch failed at 0002 change big file

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 5 - do not drop patch

skipping test: setup: 50000 lines 
		rm -f .gitattributes &&
		git checkout -q -f master &&
		git reset --hard root &&
		count 50000 >file &&
		git add file &&
		git commit -q -m initial &&
		git branch -f other &&

		scramble file &&
		git add file &&
		git commit -q -m 'change big file' &&

		git checkout -q other &&
		: >newfile &&
		git add newfile &&
		git commit -q -m 'add small file' &&

		git cherry-pick master >/dev/null 2>&1
	
ok 6 # skip setup: 50000 lines (missing EXPENSIVE)

skipping test: setup attributes 
		echo 'file binary' >.gitattributes
	
ok 7 # skip setup attributes (missing EXPENSIVE)

skipping test: detect upstream patch 
		git checkout -q master &&
		scramble file &&
		git add file &&
		git commit -q -m 'change big file again' &&
		git checkout -q other^{} &&
		git rebase master &&
		test_must_fail test -n "$(git rev-list master...HEAD~)"
	
ok 8 # skip detect upstream patch (missing EXPENSIVE)

skipping test: do not drop patch 
		git branch -f squashed master &&
		git checkout -q -f squashed &&
		git reset -q --soft HEAD~2 &&
		git commit -q -m squashed &&
		git checkout -q other^{} &&
		test_must_fail git rebase squashed &&
		rm -rf .git/rebase-apply
	
ok 9 # skip do not drop patch (missing EXPENSIVE)

# passed all 9 test(s)
1..9
