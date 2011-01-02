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
[master (root-commit) cbb7609] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 193866c] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master f6afd52] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) ebb6f4c] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 834016e] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master e6d3536] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 2 - without grafts

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check basic e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 193866c8be892e63b1aad73f33f366dca04606fa cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check basic e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 6 - without grafts

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check parents e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 193866c8be892e63b1aad73f33f366dca04606fa cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check parents e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 10 - without grafts

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check parents-raw e6d3536eba66e8ec340b093d12d046e86759ef39 -- e6d3536eba66e8ec340b093d12d046e86759ef39 834016ed0a65de90e8f93789c2de15bf33b732d8 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 193866c8be892e63b1aad73f33f366dca04606fa cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5' >.git/info/grafts &&
		check parents-raw e6d3536eba66e8ec340b093d12d046e86759ef39 subdir -- e6d3536eba66e8ec340b093d12d046e86759ef39 ebb6f4c6531ff75c2ba8408b78c52bfdbcb37fa7 f6afd52023aeed3b777f66faead97864568ad8b5 cbb7609c7a131a8f45e885addf5b383c24dc2aa1
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
