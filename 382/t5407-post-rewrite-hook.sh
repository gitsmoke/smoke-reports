Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5407-post-rewrite-hook/.git/
expecting success: 
	test_commit A foo A &&
	test_commit B foo B &&
	test_commit C foo C &&
	test_commit D foo D
[master (root-commit) be6e19b] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master df02547] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2362ae8] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master babc8a4] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
	clear_hook_input &&
	echo "D new message" > newmsg &&
	oldsha=$(git rev-parse HEAD^0) &&
	git commit -Fnewmsg --amend &&
	echo amend > expected.args &&
	echo $oldsha $(git rev-parse HEAD^0) > expected.data &&
	verify_hook_input
[master fb3e31a] D new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - git commit --amend
expecting success: 
	clear_hook_input &&
	echo "D new message again" > newmsg &&
	git commit --no-post-rewrite -Fnewmsg --amend &&
	test ! -f post-rewrite.args &&
	test ! -f post-rewrite.data
[master e49a697] D new message again
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - git commit --amend --no-post-rewrite

expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_must_fail git rebase --onto A B &&
	echo C > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD^)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
First, rewinding head to replay your work on top of it...
Applying: C
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with C
Merging:
be6e19b A
virtual C
found 1 common ancestor(s):
virtual e6a635ee70776f6585de405639ebebd74da5c390
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0001 C

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".
Applying: C
Applying: D
ok 4 - git rebase
expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_must_fail git rebase --onto A B &&
	test_must_fail git rebase --skip &&
	echo D > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
First, rewinding head to replay your work on top of it...
Applying: C
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with C
Merging:
be6e19b A
virtual C
found 1 common ancestor(s):
virtual e6a635ee70776f6585de405639ebebd74da5c390
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0001 C

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

HEAD is now at be6e19b A
Applying: D
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with D
Merging:
be6e19b A
virtual D
found 1 common ancestor(s):
virtual a0d64960e32dc5d0cf8eff7ded11a413a31c0891
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0002 D

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Applying: D

ok 5 - git rebase --skip

expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_must_fail git rebase -m --onto A B &&
	echo C > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD^)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input

HEAD is now at babc8a4 D
First, rewinding head to replay your work on top of it...
Merging A with HEAD~1
Merging:
be6e19b A
2362ae8 C
found 1 common ancestor(s):
df02547 B
Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD 49491fc] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0001 C
Merging A with HEAD~0
Merging:
49491fc C
babc8a4 D
found 1 common ancestor(s):
2362ae8 C
[detached HEAD 8146bbc] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0002 D
All done.

ok 6 - git rebase -m

expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_must_fail git rebase --onto A B &&
	test_must_fail git rebase --skip &&
	echo D > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input

HEAD is now at babc8a4 D
First, rewinding head to replay your work on top of it...
Applying: C
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with C
Merging:
be6e19b A
virtual C
found 1 common ancestor(s):
virtual e6a635ee70776f6585de405639ebebd74da5c390
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0001 C

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

HEAD is now at be6e19b A
Applying: D
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with D
Merging:
be6e19b A
virtual D
found 1 common ancestor(s):
virtual a0d64960e32dc5d0cf8eff7ded11a413a31c0891
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0002 D

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Applying: D

ok 7 - git rebase -m --skip
expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_fail_interactive_rebase "1 2" --onto A B &&
	echo C > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD^)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
rebase -i script before editing:
pick 2362ae8 C
pick babc8a4 D
rebase -i script after editing:
pick 2362ae8 C
pick babc8a4 D
Rebasing (1/2)error: could not apply 2362ae8... C
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD 49491fc] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)
ok 8 - git rebase -i (unchanged)

expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_fail_interactive_rebase "2" --onto A B &&
	echo D > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
rebase -i script before editing:
pick 2362ae8 C
pick babc8a4 D
rebase -i script after editing:
pick babc8a4 D
Rebasing (1/1)error: could not apply babc8a4... D
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD 2a28a9d] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (1/1)
ok 9 - git rebase -i (skip)
expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	test_fail_interactive_rebase "1 squash 2" --onto A B &&
	echo C > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
rebase -i script before editing:
pick 2362ae8 C
pick babc8a4 D
rebase -i script after editing:
pick 2362ae8 C
squash babc8a4 D
Rebasing (1/2)error: could not apply 2362ae8... C
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD 49491fc] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)[detached HEAD 23841fa] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 10 - git rebase -i (squash)
expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	FAKE_LINES="1 fixup 2" git rebase -i B &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input
HEAD is now at babc8a4 D
rebase -i script before editing:
pick 2362ae8 C
pick babc8a4 D

rebase -i script after editing:
pick 2362ae8 C
fixup babc8a4 D
Rebasing (2/2)[detached HEAD 4fcb727] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 11 - git rebase -i (fixup without conflict)

expecting success: 
	git reset --hard D &&
	clear_hook_input &&
	FAKE_LINES="edit 1 edit 2" git rebase -i B &&
	git rebase --continue &&
	echo something > foo &&
	git add foo &&
	git rebase --continue &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse C) $(git rev-parse HEAD^)
$(git rev-parse D) $(git rev-parse HEAD)
EOF
	verify_hook_input

HEAD is now at babc8a4 D
rebase -i script before editing:
pick 2362ae8 C
pick babc8a4 D

rebase -i script after editing:
edit 2362ae8 C
edit babc8a4 D
Rebasing (1/2)Rebasing (2/2)[detached HEAD 8063421] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)
ok 12 - git rebase -i (double edit)

# passed all 12 test(s)
1..12
