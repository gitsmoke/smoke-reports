Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9501-gitweb-standalone-http-status/.git/
expecting success: 
	test_commit 'SnapshotTests' 'i can has snapshot'
[master (root-commit) cea0920] SnapshotTests
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 i can has snapshot

ok 1 - setup
expecting success: gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
    grep "Status: 200 OK" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tbz2" &&
    grep "403 - Unsupported snapshot format" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=txz" &&
    grep "403 - Snapshot format not allowed" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
    grep "403 - Unsupported snapshot format" gitweb.output
Binary file gitweb.output matches
403 - Unsupported snapshot format
403 - Snapshot format not allowed
403 - Unsupported snapshot format

ok 2 - snapshots: tgz only default format enabled

expecting success: gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
    grep "Status: 200 OK" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tbz2" &&
    grep "Status: 200 OK" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=txz" &&
    grep "403 - Snapshot format not allowed" gitweb.output &&
    gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
    grep "Status: 200 OK" gitweb.output
Binary file gitweb.output matches
Binary file gitweb.output matches
403 - Snapshot format not allowed
Binary file gitweb.output matches

ok 3 - snapshots: all enabled in default, use default disabled value

expecting success: gitweb_run "p=.git;a=snapshot;h=HEAD;sf=zip" &&
    grep "403 - Snapshot format not allowed" gitweb.output
403 - Snapshot format not allowed

ok 4 - snapshots: zip explicitly disabled

expecting success: gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tgz" &&
    grep "Status: 200 OK" gitweb.output
Binary file gitweb.output matches

ok 5 - snapshots: tgz explicitly enabled

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=master;sf=tgz" &&
	grep "Status: 200 OK" gitweb.output

Binary file gitweb.output matches

ok 6 - snapshots: good tree-ish id

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=frizzumFrazzum;sf=tgz" &&
	grep "404 - Object does not exist" gitweb.output

404 - Object does not exist

ok 7 - snapshots: bad tree-ish id

expecting success: 
	echo object > tag-object &&
	git add tag-object &&
	git commit -m "Object to be tagged" &&
	git tag tagged-object `git hash-object tag-object` &&
	gitweb_run "p=.git;a=snapshot;h=tagged-object;sf=tgz" &&
	grep "400 - Object is not a tree-ish" gitweb.output

[master ce373f1] Object to be tagged
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 tag-object
400 - Object is not a tree-ish

ok 8 - snapshots: bad tree-ish id (tagged object)

expecting success: 
	ID=`git rev-parse --verify HEAD` &&
	gitweb_run "p=.git;a=snapshot;h=$ID;sf=tgz" &&
	grep "Status: 200 OK" gitweb.output

Binary file gitweb.output matches

ok 9 - snapshots: good object id

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=abcdef01234;sf=tgz" &&
	grep "404 - Object does not exist" gitweb.output

404 - Object does not exist

ok 10 - snapshots: bad object id

expecting success: 
	gitweb_run "p=.git" &&
	grep "Status: 503 Service Unavailable" gitweb.headers &&
	grep "503 - The load average on the server is too high" gitweb.body

Status: 503 Service Unavailable
503 - The load average on the server is too high

ok 11 - load checking: load too high (default action)

# passed all 11 test(s)
1..11
