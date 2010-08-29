ok 1 - setup
ok 2 - change submodule
ok 3 - change submodule url
not ok - 4 "git submodule sync" should update submodule URLs
#	
#		(cd super-clone &&
#		 git pull &&
#		 git submodule sync
#		) &&
#		test -d "$(git config -f super-clone/submodule/.git/config \
#		                        remote.origin.url)" &&
#		(cd super-clone/submodule &&
#		 git checkout master &&
#		 git pull
#		) &&
#		(cd super-clone &&
#		 test -d "$(git config submodule.submodule.url)"
#		)
#	
# failed 1 among 4 test(s)
1..4
