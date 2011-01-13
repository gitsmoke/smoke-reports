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

[master (root-commit) 37c1c7c] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master cad9bc6] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 7a47358] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) b4db76e] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 63b5cdc] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 0278afa] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 2 - without grafts

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check basic 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 cad9bc619bf2a075d0e097a6a36da7e211603705 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check basic 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 6 - without grafts

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check parents 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 cad9bc619bf2a075d0e097a6a36da7e211603705 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check parents 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 10 - without grafts

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check parents-raw 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 63b5cdcf357b125fc2e780b2ae99c4278f7a6bda b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 cad9bc619bf2a075d0e097a6a36da7e211603705 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2' >.git/info/grafts &&
		check parents-raw 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 subdir -- 0278afac3c3bdc7cf247f4acd9552f7d138b9cb4 b4db76e3a2809fa1141272af4c337fb11b5a29c7 7a47358ad83383a60028428320eec6accdbeabe2 37c1c7c4a0256f6bca40a3fd0b18319df542248e
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
