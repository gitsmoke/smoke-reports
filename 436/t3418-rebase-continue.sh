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

expecting success: 
	test_must_fail git rebase -v --continue &&
	test_must_fail git rebase --continue -v


ok 4 - rebase --continue can not be used with other options

expecting success: 
	rm -fr .git/rebase-* &&
	git reset --hard commit-new-file-F2-on-topic-branch &&
	test_commit "commit-new-file-F3-on-topic-branch" F3 32 &&
	test_when_finished "rm -fr test-bin funny.was.run" &&
	mkdir test-bin &&
	cat >test-bin/git-merge-funny <<-EOF
	#!$SHELL_PATH
	case "\$1" in --opt) ;; *) exit 2 ;; esac
	shift &&
	>funny.was.run &&
	exec git merge-recursive "\$@"
	EOF
	chmod +x test-bin/git-merge-funny &&
	(
		PATH=./test-bin:$PATH
		test_must_fail git rebase -s funny -Xopt master topic
	) &&
	test -f funny.was.run &&
	rm funny.was.run &&
	echo "Resolved" >F2 &&
	git add F2 &&
	(
		PATH=./test-bin:$PATH
		git rebase --continue
	) &&
	test -f funny.was.run

HEAD is now at 24c5d85 commit-new-file-F2-on-topic-branch
[topic 39de9a1] commit-new-file-F3-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F3
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
953b3db commit-new-file-F2
24c5d85 commit-new-file-F2-on-topic-branch
found 1 common ancestor(s):
dac1376 commit-new-file-F1
Auto-merging F2
CONFLICT (add/add): Merge conflict in F2
[detached HEAD 6396a51] commit-new-file-F2-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0001 commit-new-file-F2-on-topic-branch
Merging master with HEAD~0
Merging:
6396a51 commit-new-file-F2-on-topic-branch
39de9a1 commit-new-file-F3-on-topic-branch
found 1 common ancestor(s):
24c5d85 commit-new-file-F2-on-topic-branch
[detached HEAD 07d5098] commit-new-file-F3-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F3
Committed: 0002 commit-new-file-F3-on-topic-branch
All done.

ok 5 - rebase --continue remembers merge strategy and options

expecting success: 
	rm -fr .git/rebase-* &&
	git reset --hard commit-new-file-F3-on-topic-branch &&
	git checkout master
	test_commit "commit-new-file-F3" F3 3 &&
	git config rerere.enabled true &&
	test_must_fail git rebase -m master topic &&
	echo "Resolved" >F2 &&
	git add F2 &&
	test_must_fail git rebase --continue &&
	echo "Resolved" >F3 &&
	git add F3 &&
	git rebase --continue &&
	git reset --hard topic@{1} &&
	test_must_fail git rebase -m --rerere-autoupdate master &&
	test "$(cat F2)" = "Resolved" &&
	test_must_fail git rebase --continue &&
	test "$(cat F3)" = "Resolved" &&
	git rebase --continue

HEAD is now at 39de9a1 commit-new-file-F3-on-topic-branch
[master 2f543f5] commit-new-file-F3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F3
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
2f543f5 commit-new-file-F3
24c5d85 commit-new-file-F2-on-topic-branch
found 1 common ancestor(s):
dac1376 commit-new-file-F1
Auto-merging F2
CONFLICT (add/add): Merge conflict in F2
[detached HEAD bc07c2e] commit-new-file-F2-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0001 commit-new-file-F2-on-topic-branch
Merging master with HEAD~0
Merging:
bc07c2e commit-new-file-F2-on-topic-branch
39de9a1 commit-new-file-F3-on-topic-branch
found 1 common ancestor(s):
24c5d85 commit-new-file-F2-on-topic-branch
Auto-merging F3
CONFLICT (add/add): Merge conflict in F3
[detached HEAD abfd4f5] commit-new-file-F3-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0002 commit-new-file-F3-on-topic-branch
All done.
HEAD is now at 39de9a1 commit-new-file-F3-on-topic-branch
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
2f543f5 commit-new-file-F3
24c5d85 commit-new-file-F2-on-topic-branch
found 1 common ancestor(s):
dac1376 commit-new-file-F1
Auto-merging F2
CONFLICT (add/add): Merge conflict in F2
[detached HEAD bc07c2e] commit-new-file-F2-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0001 commit-new-file-F2-on-topic-branch
Merging master with HEAD~0
Merging:
bc07c2e commit-new-file-F2-on-topic-branch
39de9a1 commit-new-file-F3-on-topic-branch
found 1 common ancestor(s):
24c5d85 commit-new-file-F2-on-topic-branch
Auto-merging F3
CONFLICT (add/add): Merge conflict in F3
[detached HEAD abfd4f5] commit-new-file-F3-on-topic-branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0002 commit-new-file-F3-on-topic-branch
All done.

ok 6 - rebase --continue remembers --rerere-autoupdate

# passed all 6 test(s)
1..6
