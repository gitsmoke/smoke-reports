ok 1 - initialize repo
ok 2 - init and fetch a moved directory
not ok - 3 init and fetch from one svn-remote
#	
#	        git config svn-remote.svn.url "$svnrepo" &&
#	        git config --add svn-remote.svn.fetch \
#	          trunk:refs/remotes/svn/trunk &&
#	        git config --add svn-remote.svn.fetch \
#	          thunk:refs/remotes/svn/thunk &&
#	        git svn fetch -i svn/thunk &&
#		test "`git rev-parse --verify refs/remotes/svn/trunk`" \
#	           = "`git rev-parse --verify refs/remotes/svn/thunk~1`" &&
#	        test "`git cat-file blob refs/remotes/svn/thunk:readme |\
#	                 sed -n -e "3p"`" = goodbye
#	        
ok 4 - follow deleted parent
ok 5 - follow larger parent
ok 6 - follow higher-level parent
ok 7 - follow deleted directory
ok 8 - follow-parent avoids deleting relevant info
ok 9 - track initial change if it was only made to parent
ok 10 - follow-parent is atomic
ok 11 - track multi-parent paths
ok 12 - multi-fetch continues to work
ok 13 - multi-fetch works off a 'clean' repository
# failed 1 among 13 test(s)
1..13
