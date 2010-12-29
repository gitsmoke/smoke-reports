Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5407-post-rewrite-hook/.git/
expecting success: 
	test_commit A foo A &&
	test_commit B foo B &&
	test_commit C foo C &&
	test_commit D foo D &&
	git checkout A^0 &&
	test_commit E bar E &&
	test_commit F foo F &&
	git checkout master

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
[detached HEAD 5baa167] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[detached HEAD 38c24e8] F
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
[master 1333da2] D new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - git commit --amend
expecting success: 
	clear_hook_input &&
	echo "D new message again" > newmsg &&
	git commit --no-post-rewrite -Fnewmsg --amend &&
	test ! -f post-rewrite.args &&
	test ! -f post-rewrite.data
[master 18a65a5] D new message again
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
	git reset --hard F &&
	clear_hook_input &&
	test_must_fail git rebase --onto D A &&
	git rebase --skip &&
	echo rebase >expected.args &&
	cat >expected.data <<EOF &&
$(git rev-parse E) $(git rev-parse HEAD)
EOF
	verify_hook_input

HEAD is now at 38c24e8 F
First, rewinding head to replay your work on top of it...
Applying: E
Applying: F
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with F
Merging:
726c769 E
virtual F
found 1 common ancestor(s):
virtual bdb58bd8ea55127260d069a5e7ee2995726633f9
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Failed to merge in the changes.
Patch failed at 0002 F

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 6 - git rebase --skip the last one

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
[detached HEAD bd57595] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0001 C
Merging A with HEAD~0
Merging:
bd57595 C
babc8a4 D
found 1 common ancestor(s):
2362ae8 C
[detached HEAD f7cc6b6] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committed: 0002 D
All done.

ok 7 - git rebase -m

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

ok 8 - git rebase -m --skip
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

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".
Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD bd57595] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)
ok 9 - git rebase -i (unchanged)

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

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD a087d55] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (1/1)
ok 10 - git rebase -i (skip)

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

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Auto-merging foo
CONFLICT (content): Merge conflict in foo
[detached HEAD bd57595] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)[detached HEAD 341a9e4] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 11 - git rebase -i (squash)

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
Rebasing (2/2)[detached HEAD 9ccd140] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 12 - git rebase -i (fixup without conflict)

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
Rebasing (1/2)Rebasing (2/2)[detached HEAD 4d045be] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/2)
ok 13 - git rebase -i (double edit)

# passed all 13 test(s)
1..13
