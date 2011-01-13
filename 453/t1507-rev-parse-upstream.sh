ok 1 - setup
ok 2 - @{upstream} resolves to correct full name
ok 3 - @{u} resolves to correct full name
ok 4 - my-side@{upstream} resolves to correct full name
ok 5 - my-side@{u} resolves to correct commit
ok 6 - not-tracking@{u} fails
ok 7 - <branch>@{u}@{1} resolves correctly
ok 8 - @{u} without specifying branch fails on a detached HEAD
ok 9 - checkout -b new my-side@{u} forks from the same
not ok - 10 merge my-side@{u} records the correct name
#	
#	(
#		sq="'" &&
#		cd clone || exit
#		git checkout master || exit
#		git branch -D new ;# can fail but is ok
#		git branch -t new my-side@{u} &&
#		git merge -s ours new@{u} &&
#		git show -s --pretty=format:%s >actual &&
#		echo "Merge remote-tracking branch ${sq}origin/side${sq}" >expect &&
#		test_cmp expect actual
#	)
#	
ok 11 - branch -d other@{u}
ok 12 - checkout other@{u}
ok 13 - log -g other@{u}
ok 14 - log -g other@{u}@{now}
# failed 1 among 14 test(s)
1..14
