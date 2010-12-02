ok 1 - setup
not ok - 2 snapshots: tgz only default format enabled
#	gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
#	    grep "Status: 200 OK" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tbz2" &&
#	    grep "403 - Unsupported snapshot format" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=txz" &&
#	    grep "403 - Snapshot format not allowed" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
#	    grep "403 - Unsupported snapshot format" gitweb.output
not ok - 3 snapshots: all enabled in default, use default disabled value
#	gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
#	    grep "Status: 200 OK" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tbz2" &&
#	    grep "Status: 200 OK" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=txz" &&
#	    grep "403 - Snapshot format not allowed" gitweb.output &&
#	    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
#	    grep "Status: 200 OK" gitweb.output
not ok - 4 snapshots: zip explicitly disabled
#	gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
#	    grep "403 - Snapshot format not allowed" gitweb.output
not ok - 5 snapshots: tgz explicitly enabled
#	gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
#	    grep "Status: 200 OK" gitweb.output
not ok - 6 snapshots: good tree-ish id
#	
#		gitweb_run "p=.git;a=snapshot;h=master;sf=tgz" &&
#		grep "Status: 200 OK" gitweb.output
#	
not ok - 7 snapshots: bad tree-ish id
#	
#		gitweb_run "p=.git;a=snapshot;h=frizzumFrazzum;sf=tgz" &&
#		grep "404 - Object does not exist" gitweb.output
#	
not ok - 8 snapshots: bad tree-ish id (tagged object)
#	
#		echo object > tag-object &&
#		git add tag-object &&
#		git commit -m "Object to be tagged" &&
#		git tag tagged-object `git hash-object tag-object` &&
#		gitweb_run "p=.git;a=snapshot;h=tagged-object;sf=tgz" &&
#		grep "400 - Object is not a tree-ish" gitweb.output
#	
not ok - 9 snapshots: good object id
#	
#		ID=`git rev-parse --verify HEAD` &&
#		gitweb_run "p=.git;a=snapshot;h=$ID;sf=tgz" &&
#		grep "Status: 200 OK" gitweb.output
#	
not ok - 10 snapshots: bad object id
#	
#		gitweb_run "p=.git;a=snapshot;h=abcdef01234;sf=tgz" &&
#		grep "404 - Object does not exist" gitweb.output
#	
ok 11 - load checking: load too high (default action)
# failed 9 among 11 test(s)
1..11
