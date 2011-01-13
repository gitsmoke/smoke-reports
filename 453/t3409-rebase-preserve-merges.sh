ok 1 - setup for merge-preserving rebase
not ok - 2 rebase -p fakes interactive rebase
#	
#		(
#		cd clone1 &&
#		git fetch &&
#		git rebase -p origin/topic &&
#		test 1 = $(git rev-list --all --pretty=oneline | grep "Modify A" | wc -l) &&
#		test 1 = $(git rev-list --all --pretty=oneline | grep "Merge remote-tracking branch " | wc -l)
#		)
#	
ok 3 - --continue works after a conflict
# failed 1 among 3 test(s)
1..3
