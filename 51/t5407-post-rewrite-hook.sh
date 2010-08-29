ok 1 - setup
ok 2 - git commit --amend
ok 3 - git commit --amend --no-post-rewrite
not ok - 4 git rebase
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_must_fail git rebase --onto A B &&
#		echo C > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD^)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 5 git rebase --skip
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_must_fail git rebase --onto A B &&
#		test_must_fail git rebase --skip &&
#		echo D > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 6 git rebase -m
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_must_fail git rebase -m --onto A B &&
#		echo C > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD^)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 7 git rebase -m --skip
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_must_fail git rebase --onto A B &&
#		test_must_fail git rebase --skip &&
#		echo D > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 8 git rebase -i (unchanged)
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_fail_interactive_rebase "1 2" --onto A B &&
#		echo C > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD^)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 9 git rebase -i (skip)
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_fail_interactive_rebase "2" --onto A B &&
#		echo D > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 10 git rebase -i (squash)
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		test_fail_interactive_rebase "1 squash 2" --onto A B &&
#		echo C > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 11 git rebase -i (fixup without conflict)
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		FAKE_LINES="1 fixup 2" git rebase -i B &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
not ok - 12 git rebase -i (double edit)
#	
#		git reset --hard D &&
#		clear_hook_input &&
#		FAKE_LINES="edit 1 edit 2" git rebase -i B &&
#		git rebase --continue &&
#		echo something > foo &&
#		git add foo &&
#		git rebase --continue &&
#		echo rebase >expected.args &&
#		cat >expected.data <<EOF &&
#	$(git rev-parse C) $(git rev-parse HEAD^)
#	$(git rev-parse D) $(git rev-parse HEAD)
#	EOF
#		verify_hook_input
#	
# failed 9 among 12 test(s)
1..12
