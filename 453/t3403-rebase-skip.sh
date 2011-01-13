ok 1 - setup
ok 2 - rebase with git am -3 (default)
not ok - 3 rebase --skip can not be used with other options
#	
#		test_must_fail git rebase -v --skip &&
#		test_must_fail git rebase --skip -v
#	
not ok - 4 rebase --skip with am -3
#	
#		git rebase --skip
#		
ok 5 - rebase moves back to skip-reference
ok 6 - checkout skip-merge
ok 7 - rebase with --merge
ok 8 - rebase --skip with --merge
ok 9 - merge and reference trees equal
ok 10 - moved back to branch correctly
# failed 2 among 10 test(s)
1..10
