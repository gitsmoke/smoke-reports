ok 1 - setup
ok 2 - pulling into void
ok 3 - checking the results
ok 4 - pulling into void using master:master
ok 5 - test . as a remote
ok 6 - the default remote . should not break explicit pull
ok 7 - --rebase
ok 8 - branch.to-rebase.rebase
ok 9 - --rebase with rebased upstream
ok 10 - --rebase with rebased default upstream
ok 11 - rebased upstream + fetch + pull --rebase
ok 12 - pull --rebase dies early with dirty working directory
ok 13 - pull --rebase works on branch yet to be born
ok 14 - setup for detecting upstreamed changes
not ok - 15 git pull --rebase detects upstreamed changes
#	
#		(cd dst &&
#		 git pull --rebase &&
#		 test -z "$(git ls-files -u)"
#		)
#	
ok 16 - setup for avoiding reapplying old patches
not ok - 17 git pull --rebase does not reapply old patches
#	
#		(cd dst &&
#		 test_must_fail git pull --rebase &&
#		 test 1 = $(find .git/rebase-apply -name "000*" | wc -l)
#		)
#	
# failed 2 among 17 test(s)
1..17
