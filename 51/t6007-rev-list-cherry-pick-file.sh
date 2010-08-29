ok 1 - setup
ok 2 - --left-right
not ok - 3 --count
#	
#		git rev-list --count B...C > actual &&
#		test "$(cat actual)" = 2
#	
ok 4 - --cherry-pick foo comes up empty
ok 5 - --cherry-pick bar does not come up empty
ok 6 - --cherry-pick with independent, but identical branches
not ok - 7 --count --left-right
#	
#		git checkout branch &&
#		test_commit D &&
#		git rev-list --count --left-right B...D > actual &&
#		test_cmp expect actual
#	
# failed 2 among 7 test(s)
1..7
