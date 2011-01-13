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
[master (root-commit) 666822c] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master bf1b1c4] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 3ff5064] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 808e5cd] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 89db158] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 06a8cc8] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 2 - without grafts

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check basic 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c bf1b1c40b7cc177035d43643958b8b7c64dae7e6 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check basic 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 6 - without grafts

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check parents 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c bf1b1c40b7cc177035d43643958b8b7c64dae7e6 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check parents 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 10 - without grafts

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check parents-raw 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 89db158f08a49955feebe810dd38cf7389bc3a4e 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c bf1b1c40b7cc177035d43643958b8b7c64dae7e6 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c' >.git/info/grafts &&
		check parents-raw 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 subdir -- 06a8cc83610059e73dd8dd4488cd68b2603d0fe0 808e5cde63453189fb6ff0fb99ac91c3bc9f5331 3ff5064a4ae5a16c77ec6e24e14f72528f8ef47c 666822c8430b5651b14688a0b7e04c5877fd70a1
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
