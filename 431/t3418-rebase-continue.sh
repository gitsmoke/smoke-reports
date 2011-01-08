Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3418-rebase-continue/.git/
expecting success: 
	test_commit "commit-new-file-F1" F1 1 &&
	test_commit "commit-new-file-F2" F2 2 &&

	git checkout -b topic HEAD^ &&
	test_commit "commit-new-file-F2-on-topic-branch" F2 22 &&

	git checkout master

[master (root-commit) dac1376] commit-new-file-F1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F1
[master 953b3db] commit-new-file-F2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F2
[topic 24c5d85] commit-new-file-F2-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F2

ok 1 - setup

expecting success: 
	rm -fr .git/rebase-* &&
	git reset --hard &&
	git checkout master &&

	FAKE_LINES="edit 1" git rebase -i HEAD^ &&
	test-chmtime =-60 F1 &&
	git rebase --continue

HEAD is now at 953b3db commit-new-file-F2
rebase -i script before editing:
pick 953b3db commit-new-file-F2

rebase -i script after editing:
edit 953b3db commit-new-file-F2
Rebasing (1/1)Rebasing (1/1)
ok 2 - interactive rebase --continue works with touched file
expecting success: 
	rm -fr .git/rebase-* &&
	git reset --hard &&
	git checkout master &&

	test_must_fail git rebase --onto master master topic &&
	echo "Resolved" >F2 &&
	git add F2 &&
	test-chmtime =-60 F1 &&
	git rebase --continue
HEAD is now at 953b3db commit-new-file-F2
First, rewinding head to replay your work on top of it...
Applying: commit-new-file-F2-on-topic-branch
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with commit-new-file-F2-on-topic-branch
Merging:
953b3db commit-new-file-F2
virtual commit-new-file-F2-on-topic-branch
found 1 common ancestor(s):
virtual 4b825dc642cb6eb9a060e54bf8d69288fbee4904
Auto-merging F2
CONFLICT (add/add): Merge conflict in F2
Failed to merge in the changes.
Patch failed at 0001 commit-new-file-F2-on-topic-branch

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Applying: commit-new-file-F2-on-topic-branch

ok 3 - non-interactive rebase --continue works with touched file

# passed all 3 test(s)
1..3
