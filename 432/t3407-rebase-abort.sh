Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3407-rebase-abort/.git/
expecting success: 
	mkdir -p "$work_dir" &&
	cd "$work_dir" &&
	git init &&
	echo a > a &&
	git add a &&
	git commit -m a &&
	git branch to-rebase &&

	echo b > a &&
	git commit -a -m b &&
	echo c > a &&
	git commit -a -m c &&

	git checkout to-rebase &&
	echo d > a &&
	git commit -a -m "merge should fail on this" &&
	echo e > a &&
	git commit -a -m "merge should fail on this, too" &&
	git branch pre-rebase

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3407-rebase-abort/test dir/.git/
[master (root-commit) 7e46613] a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master 07982f2] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 211d3d7] c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase f44943e] merge should fail on this
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase 0ee6c67] merge should fail on this, too
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
211d3d7 c
virtual merge should fail on this
found 1 common ancestor(s):
virtual aaff74984cccd156a469afa7d9ab10e4777beb24
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0001 merge should fail on this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

ok 2 - rebase --abort

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		test_must_fail git rebase --skip &&
		test $(git rev-parse HEAD) = $(git rev-parse master) &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
211d3d7 c
virtual merge should fail on this
found 1 common ancestor(s):
virtual aaff74984cccd156a469afa7d9ab10e4777beb24
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0001 merge should fail on this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".
Applying: merge should fail on this, too
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this, too
Merging:
211d3d7 c
virtual merge should fail on this, too
found 1 common ancestor(s):
virtual f788de73cfc81f8d734fa7efc658cc63ca083f50
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0002 merge should fail on this, too

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

ok 3 - rebase --abort after --skip

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		echo c > a &&
		echo d >> a &&
		git add a &&
		test_must_fail git rebase --continue &&
		test $(git rev-parse HEAD) != $(git rev-parse master) &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
211d3d7 c
virtual merge should fail on this
found 1 common ancestor(s):
virtual aaff74984cccd156a469afa7d9ab10e4777beb24
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0001 merge should fail on this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Applying: merge should fail on this
Applying: merge should fail on this, too
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this, too
Merging:
3e008e5 merge should fail on this
virtual merge should fail on this, too
found 1 common ancestor(s):
virtual f788de73cfc81f8d734fa7efc658cc63ca083f50
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0002 merge should fail on this, too

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

ok 4 - rebase --abort after --continue

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		git reflog show to-rebase > reflog_before &&
		test_must_fail git rebase$type master &&
		git rebase --abort &&
		git reflog show to-rebase > reflog_after &&
		test_cmp reflog_before reflog_after &&
		rm reflog_before reflog_after
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
211d3d7 c
virtual merge should fail on this
found 1 common ancestor(s):
virtual aaff74984cccd156a469afa7d9ab10e4777beb24
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0001 merge should fail on this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 5 - rebase --abort does not update reflog

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_must_fail git rebase -v --abort &&
		test_must_fail git rebase --abort -v &&
		git rebase --abort
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
211d3d7 c
virtual merge should fail on this
found 1 common ancestor(s):
virtual aaff74984cccd156a469afa7d9ab10e4777beb24
Auto-merging a
CONFLICT (content): Merge conflict in a
Failed to merge in the changes.
Patch failed at 0001 merge should fail on this

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

ok 6 - rebase --abort can not be used with other options

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
211d3d7 c
f44943e merge should fail on this
found 1 common ancestor(s):
7e46613 a
Auto-merging a
CONFLICT (content): Merge conflict in a
ok 7 - rebase --merge --abort
expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		test_must_fail git rebase --skip &&
		test $(git rev-parse HEAD) = $(git rev-parse master) &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
211d3d7 c
f44943e merge should fail on this
found 1 common ancestor(s):
7e46613 a
Auto-merging a
CONFLICT (content): Merge conflict in a
Merging master with HEAD~1
Merging:
211d3d7 c
0ee6c67 merge should fail on this, too
found 1 common ancestor(s):
f44943e merge should fail on this
Auto-merging a
CONFLICT (content): Merge conflict in a

ok 8 - rebase --merge --abort after --skip

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		echo c > a &&
		echo d >> a &&
		git add a &&
		test_must_fail git rebase --continue &&
		test $(git rev-parse HEAD) != $(git rev-parse master) &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
211d3d7 c
f44943e merge should fail on this
found 1 common ancestor(s):
7e46613 a
Auto-merging a
CONFLICT (content): Merge conflict in a
[detached HEAD 3b4fc11] merge should fail on this
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committed: 0001 merge should fail on this
Merging master with HEAD~0
Merging:
3b4fc11 merge should fail on this
0ee6c67 merge should fail on this, too
found 1 common ancestor(s):
f44943e merge should fail on this
Auto-merging a
CONFLICT (content): Merge conflict in a

ok 9 - rebase --merge --abort after --continue

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		git reflog show to-rebase > reflog_before &&
		test_must_fail git rebase$type master &&
		git rebase --abort &&
		git reflog show to-rebase > reflog_after &&
		test_cmp reflog_before reflog_after &&
		rm reflog_before reflog_after
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
211d3d7 c
f44943e merge should fail on this
found 1 common ancestor(s):
7e46613 a
Auto-merging a
CONFLICT (content): Merge conflict in a

ok 10 - rebase --merge --abort does not update reflog

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_must_fail git rebase -v --abort &&
		test_must_fail git rebase --abort -v &&
		git rebase --abort
	
HEAD is now at 0ee6c67 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
211d3d7 c
f44943e merge should fail on this
found 1 common ancestor(s):
7e46613 a
Auto-merging a
CONFLICT (content): Merge conflict in a

ok 11 - rebase --abort can not be used with other options

# passed all 11 test(s)
1..11
