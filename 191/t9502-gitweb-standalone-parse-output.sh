ok 1 - setup
not ok - 2 snapshot: full sha1
#	
#		gitweb_run "p=.git;a=snapshot;h=$FULL_ID;sf=tar" &&
#		check_snapshot ".git-$SHORT_ID"
#	
not ok - 3 snapshot: shortened sha1
#	
#		gitweb_run "p=.git;a=snapshot;h=$SHORT_ID;sf=tar" &&
#		check_snapshot ".git-$SHORT_ID"
#	
not ok - 4 snapshot: almost full sha1
#	
#		ID=$(git rev-parse --short=30 HEAD) &&
#		gitweb_run "p=.git;a=snapshot;h=$ID;sf=tar" &&
#		check_snapshot ".git-$SHORT_ID"
#	
not ok - 5 snapshot: HEAD
#	
#		gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tar" &&
#		check_snapshot ".git-HEAD-$SHORT_ID"
#	
not ok - 6 snapshot: short branch name (master)
#	
#		gitweb_run "p=.git;a=snapshot;h=master;sf=tar" &&
#		ID=$(git rev-parse --verify --short=7 master) &&
#		check_snapshot ".git-master-$ID"
#	
not ok - 7 snapshot: short tag name (first)
#	
#		gitweb_run "p=.git;a=snapshot;h=first;sf=tar" &&
#		ID=$(git rev-parse --verify --short=7 first) &&
#		check_snapshot ".git-first-$ID"
#	
not ok - 8 snapshot: full branch name (refs/heads/master)
#	
#		gitweb_run "p=.git;a=snapshot;h=refs/heads/master;sf=tar" &&
#		ID=$(git rev-parse --verify --short=7 master) &&
#		check_snapshot ".git-master-$ID"
#	
not ok - 9 snapshot: full tag name (refs/tags/first)
#	
#		gitweb_run "p=.git;a=snapshot;h=refs/tags/first;sf=tar" &&
#		check_snapshot ".git-first"
#	
not ok - 10 snapshot: hierarchical branch name (xx/test)
#	
#		gitweb_run "p=.git;a=snapshot;h=xx/test;sf=tar" &&
#		! grep "filename=.*/" gitweb.headers
#	
# failed 9 among 10 test(s)
1..10
