ok 1 - setup
ok 2 - reference merge
ok 3 - rebase
ok 4 - test-rebase@{1} is pre rebase
ok 5 - merge and rebase should match
ok 6 - rebase the other way
not ok - 7 rebase -Xtheirs
#	
#		git checkout -b conflicting master~2 &&
#		echo "AB $T" >> original &&
#		git commit -mconflicting original &&
#		git rebase -Xtheirs master &&
#		grep AB original &&
#		! grep 11 original
#	
ok 8 - merge and rebase should match
ok 9 - picking rebase
# failed 1 among 9 test(s)
1..9
