define NO_SVN_TESTS to skip git svn tests
ok 1 - initialize source svn repo
ok 2 - clone svn repo
not ok - 3 change svn:mergeinfo
#	
#		touch bar &&
#		git add bar &&
#		git commit -m "bar" &&
#		git svn dcommit --mergeinfo="/branches/foo:1-10"
#	
not ok - 4 verify svn:mergeinfo
#	
#		mergeinfo=$(svn_cmd propget svn:mergeinfo "$svnrepo"/trunk)
#		test "$mergeinfo" = "/branches/foo:1-10"
#	
# failed 2 among 4 test(s)
1..4
