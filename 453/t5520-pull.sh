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
ok 15 - git pull --rebase detects upstreamed changes
ok 16 - setup for avoiding reapplying old patches
ok 17 - git pull --rebase does not reapply old patches
not ok - 18 git pull --rebase against local branch
#	
#		git checkout -b copy2 to-rebase-orig &&
#		git pull --rebase . to-rebase &&
#		test "conflicting modification" = "$(cat file)" &&
#		test file = "$(cat file2)"
#	
# failed 1 among 18 test(s)
1..18
