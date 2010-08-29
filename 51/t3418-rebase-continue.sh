ok 1 - setup
ok 2 - interactive rebase --continue works with touched file
not ok - 3 non-interactive rebase --continue works with touched file
#	
#		rm -fr .git/rebase-* &&
#		git reset --hard &&
#		git checkout master &&
#	
#		test_must_fail git rebase --onto master master topic &&
#		echo "Resolved" >F2 &&
#		git add F2 &&
#		test-chmtime =-60 F1 &&
#		git rebase --continue
#	
# failed 1 among 3 test(s)
1..3
