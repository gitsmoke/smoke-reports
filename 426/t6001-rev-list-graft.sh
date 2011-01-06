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

[master (root-commit) 2fff4ca] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 49e6c32] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master cd5af38] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 79247c8] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master f7628b8] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master aadef54] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 2 - without grafts

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check basic aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 49e6c327300d08ca1ddb18a585fe1ba758becef5 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check basic aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 6 - without grafts

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check parents aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 49e6c327300d08ca1ddb18a585fe1ba758becef5 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check parents aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 10 - without grafts

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check parents-raw aadef5465ac65db208473418c4516881cb7e8f74 -- aadef5465ac65db208473418c4516881cb7e8f74 f7628b867709bce1d276c975c94dcb9985cc2994 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 49e6c327300d08ca1ddb18a585fe1ba758becef5 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9' >.git/info/grafts &&
		check parents-raw aadef5465ac65db208473418c4516881cb7e8f74 subdir -- aadef5465ac65db208473418c4516881cb7e8f74 79247c8673b1dafc918a125f8769975632bf0a20 cd5af3883bb9887eeb869940307923bbda48d2e9 2fff4ca6a0e2ddb74f5d7d26c14745b056715f3a
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
