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

[master (root-commit) 65e4b1b] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master bfc5900] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 027600d] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) cc93364] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 3f8a854] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 348e37a] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 2 - without grafts

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check basic 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b bfc590063eff0a96aabfe9a835baa70e6e343c49 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check basic 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 6 - without grafts

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check parents 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b bfc590063eff0a96aabfe9a835baa70e6e343c49 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check parents 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 10 - without grafts

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check parents-raw 348e37a603b7997b361cb7b6a4d974212d7fcff0 -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 3f8a854eae35d9c1be10eb7ec7291186be6d9738 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b bfc590063eff0a96aabfe9a835baa70e6e343c49 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b' >.git/info/grafts &&
		check parents-raw 348e37a603b7997b361cb7b6a4d974212d7fcff0 subdir -- 348e37a603b7997b361cb7b6a4d974212d7fcff0 cc93364f2a4434807955ea051e2fd335c38f9700 027600d78f0115e2186e95d168481e2fa26f155b 65e4b1b7ada8048197f55fe360839fa612973728
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
