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
[master (root-commit) 61466c7] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 0ad017a] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 89b0907] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 48f980a] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 0b85bab] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 7cb6cd4] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 2 - without grafts

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check basic 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 0ad017a9e9898b894acfde6cf2c736a7a3e65967 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check basic 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 6 - without grafts

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check parents 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 0ad017a9e9898b894acfde6cf2c736a7a3e65967 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check parents 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 10 - without grafts

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check parents-raw 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 0b85babfb94638f86e23b664722524a42042756d 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 0ad017a9e9898b894acfde6cf2c736a7a3e65967 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f' >.git/info/grafts &&
		check parents-raw 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 subdir -- 7cb6cd44bd73b6324f3bb35c2133612cd1456f01 48f980a0a12a3120abbaf4e4ccfa7b21355ae020 89b0907669542dfd1f2d972de96e7e32b858b23f 61466c741c32b83b7506d7311f86da6e559522d5
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
