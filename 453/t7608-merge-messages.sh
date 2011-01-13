ok 1 - merge local branch
ok 2 - merge octopus branches
ok 3 - merge tag
ok 4 - ambiguous tag
not ok - 5 remote-tracking branch
#	
#		git checkout -b remote master &&
#		test_commit remote-1 &&
#		git update-ref refs/remotes/origin/master remote &&
#		git checkout master &&
#		test_commit master-5 &&
#		git merge origin/master &&
#		check_oneline "Merge remote-tracking branch Qorigin/masterQ"
#	
# failed 1 among 5 test(s)
1..5
