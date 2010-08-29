ok 1 - setup
ok 2 - cherry-pick --nonsense
ok 3 - revert --nonsense
not ok - 4 cherry-pick after renaming branch
#	
#	
#		git checkout rename2 &&
#		git cherry-pick added &&
#		test $(git rev-parse HEAD^) = $(git rev-parse rename2) &&
#		test -f opos &&
#		grep "Add extra line at the end" opos &&
#		git reflog -1 | grep cherry-pick
#	
#	
not ok - 5 revert after renaming branch
#	
#	
#		git checkout rename1 &&
#		git revert added &&
#		test $(git rev-parse HEAD^) = $(git rev-parse rename1) &&
#		test -f spoo &&
#		! grep "Add extra line at the end" spoo &&
#		git reflog -1 | grep revert
#	
#	
ok 6 - revert forbidden on dirty working tree
# failed 2 among 6 test(s)
1..6
