Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7611-merge-abort/.git/
expecting success: 
	# Create the above repo
	echo foo > foo &&
	echo bar > bar &&
	echo baz > baz &&
	git add foo bar baz &&
	git commit -m initial &&
	echo bazz > baz &&
	git commit -a -m "second" &&
	git checkout -b conflict_branch HEAD^ &&
	echo barf > bar &&
	echo bazf > baz &&
	git commit -a -m "conflict" &&
	git checkout -b clean_branch HEAD^ &&
	echo bart > bar &&
	git commit -a -m "clean" &&
	git checkout master
[master (root-commit) 1aa7995] initial
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 baz
 create mode 100644 foo
[master 2be0027] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[conflict_branch d8a4485] conflict
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)
[clean_branch 0d1ecc6] clean
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	test_must_fail git merge --abort 2>output &&
	grep -q MERGE_HEAD output &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)"


ok 2 - fails without MERGE_HEAD (unstarted merge)

expecting success: 
	git merge clean_branch &&
	test ! -f .git/MERGE_HEAD &&
	# Merge successfully completed
	post_merge_head="$(git rev-parse HEAD)" &&
	test_must_fail git merge --abort 2>output &&
	grep -q MERGE_HEAD output &&
	test ! -f .git/MERGE_HEAD &&
	test "$post_merge_head" = "$(git rev-parse HEAD)"

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial
Merge made by recursive.
 bar |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - fails without MERGE_HEAD (completed merge)

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 4 - Forget previous merge

expecting success: 
	# Redo merge, but stop before creating merge commit
	git merge --no-commit clean_branch &&
	test -f .git/MERGE_HEAD &&
	# Abort non-conflicting merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff)" &&
	test -z "$(git diff --staged)"

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial

ok 5 - Abort after --no-commit

expecting success: 
	# Create conflicting merge
	test_must_fail git merge conflict_branch &&
	test -f .git/MERGE_HEAD &&
	# Abort conflicting merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff)" &&
	test -z "$(git diff --staged)"

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Auto-merging baz
CONFLICT (content): Merge conflict in baz
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - Abort after conflicts

expecting success: 
	echo xyzzy >> foo &&
	git add foo &&
	git diff --staged > expect &&
	test_must_fail git merge clean_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff)" &&
	git diff --staged > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 7 - Clean merge with dirty index fails

expecting success: 
	test_must_fail git merge conflict_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff)" &&
	git diff --staged > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 8 - Conflicting merge with dirty index fails

expecting success: 
	git reset "$pre_merge_head" &&
	git diff > actual &&
	test_cmp expect actual

Unstaged changes after reset:
M	foo

ok 9 - Reset index (but preserve worktree changes)

expecting success: 
	git merge --no-commit clean_branch &&
	test -f .git/MERGE_HEAD &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial

ok 10 - Abort clean merge with non-conflicting dirty worktree

expecting success: 
	test_must_fail git merge conflict_branch &&
	test -f .git/MERGE_HEAD &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Auto-merging baz
CONFLICT (content): Merge conflict in baz
Automatic merge failed; fix conflicts and then commit the result.

ok 11 - Abort conflicting merge with non-conflicting dirty worktree

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 12 - Reset worktree changes

expecting success: 
	echo xyzzy >> bar &&
	git diff > expect &&
	test_must_fail git merge --no-commit clean_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 13 - Fail clean merge with conflicting dirty worktree

expecting success: 
	test_must_fail git merge conflict_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 14 - Fail conflicting merge with conflicting dirty worktree

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 15 - Reset worktree changes

expecting success: 
	echo bart > bar &&
	git diff > expect &&
	test_must_fail git merge --no-commit clean_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 16 - Fail clean merge with matching dirty worktree

expecting success: 
	git add bar &&
	git diff --staged > expect &&
	git merge --no-commit clean_branch &&
	test -f .git/MERGE_HEAD &&
	### When aborting the merge, git will discard all staged changes,
	### including those that were staged pre-merge. In other words,
	### --abort will LOSE any staged changes (the staged changes that
	### are lost must match the merge result, or the merge would not
	### have been allowed to start). Change expectations accordingly:
	rm expect &&
	touch expect &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	git diff --staged > actual &&
	test_cmp expect actual &&
	test -z "$(git diff)"

Merging:
2be0027 second
virtual clean_branch
found 1 common ancestor(s):
1aa7995 initial

ok 17 - Abort clean merge with matching dirty index

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 18 - Reset worktree changes

expecting success: 
	echo barf > bar &&
	git diff > expect &&
	test_must_fail git merge conflict_branch &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	test -z "$(git diff --staged)" &&
	git diff > actual &&
	test_cmp expect actual

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Aborting

ok 19 - Fail conflicting merge with matching dirty worktree

expecting success: 
	git add bar &&
	git diff --staged > expect &&
	test_must_fail git merge conflict_branch &&
	test -f .git/MERGE_HEAD &&
	### When aborting the merge, git will discard all staged changes,
	### including those that were staged pre-merge. In other words,
	### --abort will LOSE any staged changes (the staged changes that
	### are lost must match the merge result, or the merge would not
	### have been allowed to start). Change expectations accordingly:
	rm expect &&
	touch expect &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	git diff --staged > actual &&
	test_cmp expect actual &&
	test -z "$(git diff)"

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Auto-merging baz
CONFLICT (content): Merge conflict in baz
Automatic merge failed; fix conflicts and then commit the result.

ok 20 - Abort conflicting merge with matching dirty index

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 21 - Reset worktree changes

expecting success: 
	# Pre-merge worktree changes
	echo xyzzy > foo &&
	echo barf > bar &&
	git add bar &&
	git diff > expect &&
	git diff --staged > expect-staged &&
	# Perform merge
	test_must_fail git merge conflict_branch &&
	test -f .git/MERGE_HEAD &&
	# Post-merge worktree changes
	echo yzxxz > foo &&
	echo blech > baz &&
	### When aborting the merge, git will discard staged changes (bar)
	### and unmerged changes (baz). Other changes that are neither
	### staged nor marked as unmerged (foo), will be preserved. For
	### these changed, git cannot tell pre-merge changes apart from
	### post-merge changes, so the post-merge changes will be
	### preserved. Change expectations accordingly:
	git diff -- foo > expect &&
	rm expect-staged &&
	touch expect-staged &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	git diff > actual &&
	test_cmp expect actual &&
	git diff --staged > actual-staged &&
	test_cmp expect-staged actual-staged

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Auto-merging baz
CONFLICT (content): Merge conflict in baz
Automatic merge failed; fix conflicts and then commit the result.

ok 22 - Abort merge with pre- and post-merge worktree changes

expecting success: 
	git reset --hard "$pre_merge_head"

HEAD is now at 2be0027 second

ok 23 - Reset worktree changes

expecting success: 
	# Pre-merge worktree changes
	echo xyzzy > foo &&
	echo barf > bar &&
	git add bar &&
	git diff > expect &&
	git diff --staged > expect-staged &&
	# Perform merge
	test_must_fail git merge conflict_branch &&
	test -f .git/MERGE_HEAD &&
	# Post-merge worktree changes
	echo yzxxz > foo &&
	echo blech > baz &&
	git add foo bar &&
	### When aborting the merge, git will discard all staged changes
	### (foo, bar and baz), and no changes will be preserved. Whether
	### the changes were staged pre- or post-merge does not matter
	### (except for not preventing starting the merge).
	### Change expectations accordingly:
	rm expect expect-staged &&
	touch expect &&
	touch expect-staged &&
	# Abort merge
	git merge --abort &&
	test ! -f .git/MERGE_HEAD &&
	test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
	git diff > actual &&
	test_cmp expect actual &&
	git diff --staged > actual-staged &&
	test_cmp expect-staged actual-staged

Merging:
2be0027 second
virtual conflict_branch
found 1 common ancestor(s):
1aa7995 initial
Auto-merging baz
CONFLICT (content): Merge conflict in baz
Automatic merge failed; fix conflicts and then commit the result.

ok 24 - Abort merge with pre- and post-merge index changes

# passed all 24 test(s)
1..24
