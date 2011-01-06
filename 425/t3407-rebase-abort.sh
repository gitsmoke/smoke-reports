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
[master (root-commit) 1fbccfb] a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master 06e8d45] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 4445797] c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase 846b93a] merge should fail on this
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase d582eb0] merge should fail on this, too
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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
4445797 c
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

HEAD is now at d582eb0 merge should fail on this, too

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
4445797 c
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
HEAD is now at 4445797 c
Applying: merge should fail on this, too
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this, too
Merging:
4445797 c
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

HEAD is now at d582eb0 merge should fail on this, too

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
4445797 c
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
85d86e7 merge should fail on this
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

HEAD is now at d582eb0 merge should fail on this, too

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Applying: merge should fail on this
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with merge should fail on this
Merging:
4445797 c
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

HEAD is now at d582eb0 merge should fail on this, too

ok 5 - rebase --abort does not update reflog

expecting success: 
		cd "$work_dir" &&
		# Clean up the state from the previous one
		git reset --hard pre-rebase &&
		test_must_fail git rebase$type master &&
		test_path_is_dir "$dotest" &&
		git rebase --abort &&
		test $(git rev-parse to-rebase) = $(git rev-parse pre-rebase) &&
		test ! -d "$dotest"
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
4445797 c
846b93a merge should fail on this
found 1 common ancestor(s):
1fbccfb a
Auto-merging a
CONFLICT (content): Merge conflict in a
HEAD is now at d582eb0 merge should fail on this, too

ok 6 - rebase --merge --abort

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
4445797 c
846b93a merge should fail on this
found 1 common ancestor(s):
1fbccfb a
Auto-merging a
CONFLICT (content): Merge conflict in a
HEAD is now at 4445797 c
Merging master with HEAD~1
Merging:
4445797 c
d582eb0 merge should fail on this, too
found 1 common ancestor(s):
846b93a merge should fail on this
Auto-merging a
CONFLICT (content): Merge conflict in a
HEAD is now at d582eb0 merge should fail on this, too

ok 7 - rebase --merge --abort after --skip

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
4445797 c
846b93a merge should fail on this
found 1 common ancestor(s):
1fbccfb a
Auto-merging a
CONFLICT (content): Merge conflict in a
[detached HEAD 320bba2] merge should fail on this
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committed: 0001 merge should fail on this
Merging master with HEAD~0
Merging:
320bba2 merge should fail on this
d582eb0 merge should fail on this, too
found 1 common ancestor(s):
846b93a merge should fail on this
Auto-merging a
CONFLICT (content): Merge conflict in a
HEAD is now at d582eb0 merge should fail on this, too

ok 8 - rebase --merge --abort after --continue

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
	
HEAD is now at d582eb0 merge should fail on this, too
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
4445797 c
846b93a merge should fail on this
found 1 common ancestor(s):
1fbccfb a
Auto-merging a
CONFLICT (content): Merge conflict in a
HEAD is now at d582eb0 merge should fail on this, too

ok 9 - rebase --merge --abort does not update reflog

# passed all 9 test(s)
1..9
