Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6001-rev-list-graft/.git/
expecting success: 
	mkdir subdir &&
	echo >fileA fileA &&
	echo >subdir/fileB fileB &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in one history." &&
	A0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified &&
	git commit -a -m "Second in one history." &&
	A1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified &&
	git commit -a -m "Third in one history." &&
	A2=`git rev-parse --verify HEAD` &&

	rm -f .git/refs/heads/master .git/index &&

	echo >fileA fileA again &&
	echo >subdir/fileB fileB again &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in alternate history." &&
	B0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified in alternate history &&
	git commit -a -m "Second in alternate history." &&
	B1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified in alternate history &&
	git commit -a -m "Third in alternate history." &&
	B2=`git rev-parse --verify HEAD` &&
	: done
[master (root-commit) 96532fa] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 8400e63] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master bd16cf9] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 0cdc4e5] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 56ac39f] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 11d35bf] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 2 - without grafts

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check basic 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 8400e63924e4bcfae73d30b4571a07ea13ce2d43 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check basic 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 6 - without grafts

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check parents 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 8400e63924e4bcfae73d30b4571a07ea13ce2d43 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check parents 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 10 - without grafts

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check parents-raw 11d35bfa1207dd68cef30dbba0991c650dc0744e -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 56ac39fe535d5556834bd390ff604975ae538130 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 8400e63924e4bcfae73d30b4571a07ea13ce2d43 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298' >.git/info/grafts &&
		check parents-raw 11d35bfa1207dd68cef30dbba0991c650dc0744e subdir -- 11d35bfa1207dd68cef30dbba0991c650dc0744e 0cdc4e5e2037d33be04d69c381f49200a8b6a0b5 bd16cf9eda99369b67b73e3fe03b1cc584a55298 96532fa837a7c395a98440955ca3ba2f3e22616f
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
