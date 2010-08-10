ok 1 - setup
ok 2 - branch -v
ok 3 - checkout
ok 4 - checkout with local tracked branch
not ok - 5 status
#	
#		(
#			cd test &&
#			git checkout b1 >/dev/null &&
#			# reports nothing to commit
#			test_must_fail git commit --dry-run
#		) >actual &&
#		grep "have 1 and 1 different" actual
#	
ok 6 - status when tracking lightweight tags
ok 7 - status when tracking annotated tags
ok 8 - setup tracking with branch --set-upstream on existing branch
ok 9 - --set-upstream does not change branch
# failed 1 among 9 test(s)
1..9
