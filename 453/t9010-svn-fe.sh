ok 1 - empty dump
not ok - 2 v3 dumps not supported
#	
#		reinit_git &&
#		echo "SVN-fs-dump-format-version: 3" >input &&
#		test_must_fail test-svn-fe input >stream &&
#		test_cmp empty stream
#	
ok 3 - set up svn repo
ok 4 - t9135/svn.dump
# failed 1 among 4 test(s)
1..4
