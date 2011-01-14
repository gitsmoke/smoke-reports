ok 1 - setup directories and test repo
ok 2 - checkout working copy from svn
ok 3 - set some properties to create an unhandled.log file
ok 4 - Setup repo
ok 5 - Fetch repo
ok 6 - make backup copy of unhandled.log
ok 7 - create leftover index
ok 8 - git svn gc runs
ok 9 - git svn index removed
not ok - 10 git svn gc produces a valid gzip file
#	
#			 gunzip .git/svn/refs/remotes/git-svn/unhandled.log.gz
#			
ok 11 - git svn gc does not change unhandled.log files
# failed 1 among 11 test(s)
1..11
