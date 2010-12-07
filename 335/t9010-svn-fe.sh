ok 1 - t9135/svn.dump
ok 2 - empty dump
ok 3 - v4 dumps not supported
not ok 4 - empty revision # TODO known breakage
ok 5 - empty properties
ok 6 - author name and commit message
ok 7 - unsupported properties are ignored
not ok 8 - timestamp and empty file # TODO known breakage
ok 9 - directory with files
ok 10 - node without action
ok 11 - action: add node without text
not ok 12 - change file mode but keep old content # TODO known breakage
ok 13 - change file mode and reiterate content
ok 14 - deltas not supported
ok 15 - property deltas supported
ok 16 - deltas for typechange
not ok - 17 t9135/svn.dump
#	
#		svnadmin create simple-svn &&
#		svnadmin load simple-svn <"$TEST_DIRECTORY/t9135/svn.dump" &&
#		svn_cmd export "file://$PWD/simple-svn" simple-svnco &&
#		git init simple-git &&
#		test-svn-fe "$TEST_DIRECTORY/t9135/svn.dump" >simple.fe &&
#		(
#			cd simple-git &&
#			git fast-import <../simple.fe
#		) &&
#		(
#			cd simple-svnco &&
#			git init &&
#			git add . &&
#			git fetch ../simple-git master &&
#			git diff --exit-code FETCH_HEAD
#		)
#	
# still have 3 known breakage(s)
# failed 1 among remaining 14 test(s)
1..17
