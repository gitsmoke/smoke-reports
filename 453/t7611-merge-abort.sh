ok 1 - setup
not ok - 2 fails without MERGE_HEAD (unstarted merge)
#	
#		test_must_fail git merge --abort 2>output &&
#		grep -q MERGE_HEAD output &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)"
#	
not ok - 3 fails without MERGE_HEAD (completed merge)
#	
#		git merge clean_branch &&
#		test ! -f .git/MERGE_HEAD &&
#		# Merge successfully completed
#		post_merge_head="$(git rev-parse HEAD)" &&
#		test_must_fail git merge --abort 2>output &&
#		grep -q MERGE_HEAD output &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$post_merge_head" = "$(git rev-parse HEAD)"
#	
ok 4 - Forget previous merge
not ok - 5 Abort after --no-commit
#	
#		# Redo merge, but stop before creating merge commit
#		git merge --no-commit clean_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Abort non-conflicting merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff)" &&
#		test -z "$(git diff --staged)"
#	
not ok - 6 Abort after conflicts
#	
#		# Create conflicting merge
#		test_must_fail git merge conflict_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Abort conflicting merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff)" &&
#		test -z "$(git diff --staged)"
#	
not ok - 7 Clean merge with dirty index fails
#	
#		echo xyzzy >> foo &&
#		git add foo &&
#		git diff --staged > expect &&
#		test_must_fail git merge clean_branch &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff)" &&
#		git diff --staged > actual &&
#		test_cmp expect actual
#	
not ok - 8 Conflicting merge with dirty index fails
#	
#		test_must_fail git merge conflict_branch &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff)" &&
#		git diff --staged > actual &&
#		test_cmp expect actual
#	
ok 9 - Reset index (but preserve worktree changes)
not ok - 10 Abort clean merge with non-conflicting dirty worktree
#	
#		git merge --no-commit clean_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff --staged)" &&
#		git diff > actual &&
#		test_cmp expect actual
#	
not ok - 11 Abort conflicting merge with non-conflicting dirty worktree
#	
#		test_must_fail git merge conflict_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		test -z "$(git diff --staged)" &&
#		git diff > actual &&
#		test_cmp expect actual
#	
ok 12 - Reset worktree changes
ok 13 - Fail clean merge with conflicting dirty worktree
ok 14 - Fail conflicting merge with conflicting dirty worktree
ok 15 - Reset worktree changes
ok 16 - Fail clean merge with matching dirty worktree
not ok - 17 Abort clean merge with matching dirty index
#	
#		git add bar &&
#		git diff --staged > expect &&
#		git merge --no-commit clean_branch &&
#		test -f .git/MERGE_HEAD &&
#		### When aborting the merge, git will discard all staged changes,
#		### including those that were staged pre-merge. In other words,
#		### --abort will LOSE any staged changes (the staged changes that
#		### are lost must match the merge result, or the merge would not
#		### have been allowed to start). Change expectations accordingly:
#		rm expect &&
#		touch expect &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		git diff --staged > actual &&
#		test_cmp expect actual &&
#		test -z "$(git diff)"
#	
ok 18 - Reset worktree changes
ok 19 - Fail conflicting merge with matching dirty worktree
not ok - 20 Abort conflicting merge with matching dirty index
#	
#		git add bar &&
#		git diff --staged > expect &&
#		test_must_fail git merge conflict_branch &&
#		test -f .git/MERGE_HEAD &&
#		### When aborting the merge, git will discard all staged changes,
#		### including those that were staged pre-merge. In other words,
#		### --abort will LOSE any staged changes (the staged changes that
#		### are lost must match the merge result, or the merge would not
#		### have been allowed to start). Change expectations accordingly:
#		rm expect &&
#		touch expect &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		git diff --staged > actual &&
#		test_cmp expect actual &&
#		test -z "$(git diff)"
#	
ok 21 - Reset worktree changes
not ok - 22 Abort merge with pre- and post-merge worktree changes
#	
#		# Pre-merge worktree changes
#		echo xyzzy > foo &&
#		echo barf > bar &&
#		git add bar &&
#		git diff > expect &&
#		git diff --staged > expect-staged &&
#		# Perform merge
#		test_must_fail git merge conflict_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Post-merge worktree changes
#		echo yzxxz > foo &&
#		echo blech > baz &&
#		### When aborting the merge, git will discard staged changes (bar)
#		### and unmerged changes (baz). Other changes that are neither
#		### staged nor marked as unmerged (foo), will be preserved. For
#		### these changed, git cannot tell pre-merge changes apart from
#		### post-merge changes, so the post-merge changes will be
#		### preserved. Change expectations accordingly:
#		git diff -- foo > expect &&
#		rm expect-staged &&
#		touch expect-staged &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		git diff > actual &&
#		test_cmp expect actual &&
#		git diff --staged > actual-staged &&
#		test_cmp expect-staged actual-staged
#	
ok 23 - Reset worktree changes
not ok - 24 Abort merge with pre- and post-merge index changes
#	
#		# Pre-merge worktree changes
#		echo xyzzy > foo &&
#		echo barf > bar &&
#		git add bar &&
#		git diff > expect &&
#		git diff --staged > expect-staged &&
#		# Perform merge
#		test_must_fail git merge conflict_branch &&
#		test -f .git/MERGE_HEAD &&
#		# Post-merge worktree changes
#		echo yzxxz > foo &&
#		echo blech > baz &&
#		git add foo bar &&
#		### When aborting the merge, git will discard all staged changes
#		### (foo, bar and baz), and no changes will be preserved. Whether
#		### the changes were staged pre- or post-merge does not matter
#		### (except for not preventing starting the merge).
#		### Change expectations accordingly:
#		rm expect expect-staged &&
#		touch expect &&
#		touch expect-staged &&
#		# Abort merge
#		git merge --abort &&
#		test ! -f .git/MERGE_HEAD &&
#		test "$pre_merge_head" = "$(git rev-parse HEAD)" &&
#		git diff > actual &&
#		test_cmp expect actual &&
#		git diff --staged > actual-staged &&
#		test_cmp expect-staged actual-staged
#	
# failed 12 among 24 test(s)
1..24
