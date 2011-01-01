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

[master (root-commit) 722081f] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 9ec068e] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 376343f] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 0be969d] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 71d70ea] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 0c2f0fc] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 2 - without grafts

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check basic 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 9ec068e04acc69ff8eadc8d7c38a606bd390a051 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check basic 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 6 - without grafts

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check parents 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 9ec068e04acc69ff8eadc8d7c38a606bd390a051 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check parents 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 10 - without grafts

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check parents-raw 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 71d70ea8ccb82a905743582b97c961a78ac6d0b2 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 9ec068e04acc69ff8eadc8d7c38a606bd390a051 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7' >.git/info/grafts &&
		check parents-raw 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f subdir -- 0c2f0fc4dd850e380f517c55e5a04a48d942ff2f 0be969d64bb2e68cb521eae1257e1698d43df7e1 376343fd169cbb3afd827efe740a8832c3b19de7 722081f6d9b47a37270a40de8d0b0527141bb010
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
