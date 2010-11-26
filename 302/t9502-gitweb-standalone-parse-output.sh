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
ok 10 - snapshot: hierarchical branch name (xx/test)
ok 11 - setup for caching tests (utf8 commit, binary file)
ok 12 - enable caching
not ok - 13 caching enabled, HTML output, generating cache
#	
#			gitweb_run "p=.git;a=patch" &&
#			mv gitweb.body cache.html &&
#			test_cmp no_cache.html cache.html
#		
ok 14 - caching enabled, HTML output, cached version
not ok - 15 caching enabled, binary output, generating cache
#	
#			gitweb_run "p=.git;a=blob_plain;f=image.png" &&
#			mv gitweb.body cache.png &&
#			cmp no_cache.png cache.png
#		
not ok - 16 caching enabled, binary output, cached version
#	
#			gitweb_run "p=.git;a=blob_plain;f=image.png" &&
#			mv gitweb.body cache.png &&
#			cmp no_cache.png cache.png
#		
# failed 11 among 16 test(s)
1..16
