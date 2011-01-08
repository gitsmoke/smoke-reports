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

[master (root-commit) d86a71c] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 14561b6] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 0f499d3] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) dbdcd7d] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master fc61ed1] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master d953e2c] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 2 - without grafts

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check basic d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf 14561b6c5a2299f217b3cc4d1e1dd819b8b1ad2a d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check basic d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 6 - without grafts

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check parents d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf 14561b6c5a2299f217b3cc4d1e1dd819b8b1ad2a d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check parents d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 10 - without grafts

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check parents-raw d953e2c23ca485a32e2f8a12c8c1d502daaa6585 -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 fc61ed17d971d3fac6fcf03b31e7e0ed2d5692c5 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf 14561b6c5a2299f217b3cc4d1e1dd819b8b1ad2a d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf' >.git/info/grafts &&
		check parents-raw d953e2c23ca485a32e2f8a12c8c1d502daaa6585 subdir -- d953e2c23ca485a32e2f8a12c8c1d502daaa6585 dbdcd7d9b1ca43e79de3f1e37e0e3d9e42e560f5 0f499d340f2af5773c9d55ebf986132dd49bf1cf d86a71c36ec2eb689912b4b80d086ab7377af8e0
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
