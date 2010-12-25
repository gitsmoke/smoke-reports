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
[master (root-commit) ffe25e9] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 17ac0d2] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 079fb78] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 5a89bdb] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master cc09925] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 6d1ca6a] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 2 - without grafts

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check basic 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb 17ac0d2e27e16707c02d92c1be334be3976acfae ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check basic 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 6 - without grafts

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check parents 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb 17ac0d2e27e16707c02d92c1be334be3976acfae ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check parents 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 10 - without grafts

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check parents-raw 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea cc099258a62dbae064112249293ebb55649f6f14 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb 17ac0d2e27e16707c02d92c1be334be3976acfae ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb' >.git/info/grafts &&
		check parents-raw 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea subdir -- 6d1ca6a576a552cae3c0e48557ed81f8b66c2bea 5a89bdb4f2ae28a3c066c669cd64c21936b41f2c 079fb780599ba98d9453c81ce906bc9c0dcc38cb ffe25e958d53ba2d601f6258879a6954c89d8529
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
