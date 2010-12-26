Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9502-gitweb-standalone-parse-output/.git/
expecting success: 
	test_commit first foo &&
	git branch xx/test &&
	FULL_ID=$(git rev-parse --verify HEAD) &&
	SHORT_ID=$(git rev-parse --verify --short=7 HEAD)

[master (root-commit) 1005c80] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 1 - setup

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=$FULL_ID;sf=tar" &&
	check_snapshot ".git-$SHORT_ID"

basename=.git-1005c80

ok 2 - snapshot: full sha1

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=$SHORT_ID;sf=tar" &&
	check_snapshot ".git-$SHORT_ID"

basename=.git-1005c80

ok 3 - snapshot: shortened sha1

expecting success: 
	ID=$(git rev-parse --short=30 HEAD) &&
	gitweb_run "p=.git;a=snapshot;h=$ID;sf=tar" &&
	check_snapshot ".git-$SHORT_ID"

basename=.git-1005c80

ok 4 - snapshot: almost full sha1

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=HEAD;sf=tar" &&
	check_snapshot ".git-HEAD-$SHORT_ID"

basename=.git-HEAD-1005c80

ok 5 - snapshot: HEAD

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=master;sf=tar" &&
	ID=$(git rev-parse --verify --short=7 master) &&
	check_snapshot ".git-master-$ID"

basename=.git-master-1005c80

ok 6 - snapshot: short branch name (master)

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=first;sf=tar" &&
	ID=$(git rev-parse --verify --short=7 first) &&
	check_snapshot ".git-first-$ID"
basename=.git-first-1005c80

ok 7 - snapshot: short tag name (first)

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=refs/heads/master;sf=tar" &&
	ID=$(git rev-parse --verify --short=7 master) &&
	check_snapshot ".git-master-$ID"

basename=.git-master-1005c80

ok 8 - snapshot: full branch name (refs/heads/master)

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=refs/tags/first;sf=tar" &&
	check_snapshot ".git-first"

basename=.git-first

ok 9 - snapshot: full tag name (refs/tags/first)

expecting success: 
	gitweb_run "p=.git;a=snapshot;h=xx/test;sf=tar" &&
	! grep "filename=.*/" gitweb.headers


ok 10 - snapshot: hierarchical branch name (xx/test)

# passed all 10 test(s)
1..10
