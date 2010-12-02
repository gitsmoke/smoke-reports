ok 1 - setup
ok 2 - checkout -b to a new branch, set to HEAD
ok 3 - checkout -b to a new branch, set to an explicit ref
ok 4 - checkout -b to a new branch with unmergeable changes fails
ok 5 - checkout -f -b to a new branch with unmergeable changes discards changes
ok 6 - checkout -b to a new branch preserves mergeable changes
ok 7 - checkout -f -b to a new branch with mergeable changes discards changes
ok 8 - checkout -b to an existing branch fails
not ok - 9 checkout -B to an existing branch resets branch to HEAD
#	
#		git checkout branch1 &&
#	
#		do_checkout branch2 "" -B
#	
not ok - 10 checkout -B to an existing branch from detached HEAD resets branch to HEAD
#	
#		git checkout $(git rev-parse --verify HEAD) &&
#	
#		do_checkout branch2 "" -B
#	
not ok - 11 checkout -B to an existing branch with an explicit ref resets branch to that ref
#	
#		git checkout branch1 &&
#	
#		do_checkout branch2 $HEAD1 -B
#	
ok 12 - checkout -B to an existing branch with unmergeable changes fails
not ok - 13 checkout -f -B to an existing branch with unmergeable changes discards changes
#	
#		# still dirty and on branch1
#		do_checkout branch2 $HEAD1 "-f -B" &&
#		test_must_fail test_dirty_unmergeable
#	
not ok - 14 checkout -B to an existing branch preserves mergeable changes
#	
#		git checkout branch1 &&
#	
#		setup_dirty_mergeable &&
#		do_checkout branch2 $HEAD1 -B &&
#		test_dirty_mergeable
#	
not ok - 15 checkout -f -B to an existing branch with mergeable changes discards changes
#	
#		# clean up from previous test
#		git reset --hard &&
#	
#		git checkout branch1 &&
#	
#		setup_dirty_mergeable &&
#		do_checkout branch2 $HEAD1 "-f -B" &&
#		test_must_fail test_dirty_mergeable
#	
# failed 6 among 15 test(s)
1..15
