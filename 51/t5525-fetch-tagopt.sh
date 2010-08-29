ok 1 - setup
ok 2 - fetch with tagopt=--no-tags does not get tag
not ok - 3 fetch --tags with tagopt=--no-tags gets tag
#	
#		git fetch --tags remote_one &&
#		git show-ref tag_one
#		
ok 4 - fetch --no-tags with tagopt=--tags does not get tag
ok 5 - fetch with tagopt=--tags gets tag
# failed 1 among 5 test(s)
1..5
