ok 1 - setup
ok 2 - rebase --abort
ok 3 - rebase --abort after --skip
ok 4 - rebase --abort after --continue
ok 5 - rebase --abort does not update reflog
not ok - 6 rebase --abort can not be used with other options
#	
#			cd "$work_dir" &&
#			# Clean up the state from the previous one
#			git reset --hard pre-rebase &&
#			test_must_fail git rebase$type master &&
#			test_must_fail git rebase -v --abort &&
#			test_must_fail git rebase --abort -v &&
#			git rebase --abort
#		
ok 7 - rebase --merge --abort
ok 8 - rebase --merge --abort after --skip
ok 9 - rebase --merge --abort after --continue
ok 10 - rebase --merge --abort does not update reflog
not ok - 11 rebase --abort can not be used with other options
#	
#			cd "$work_dir" &&
#			# Clean up the state from the previous one
#			git reset --hard pre-rebase &&
#			test_must_fail git rebase$type master &&
#			test_must_fail git rebase -v --abort &&
#			test_must_fail git rebase --abort -v &&
#			git rebase --abort
#		
# failed 2 among 11 test(s)
1..11
