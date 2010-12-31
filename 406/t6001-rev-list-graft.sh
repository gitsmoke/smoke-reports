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

[master (root-commit) 2168e4a] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master a1c868c] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 4ce994c] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) f781822] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 75e35d0] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 15734f6] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 2 - without grafts

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check basic 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d a1c868c76a2f61279ff1cb0d53c67a05965efe4b 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check basic 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 6 - without grafts

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check parents 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d a1c868c76a2f61279ff1cb0d53c67a05965efe4b 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check parents 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 10 - without grafts

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check parents-raw 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 75e35d001390e5a9f95343cbe8804dbd594e472e f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d a1c868c76a2f61279ff1cb0d53c67a05965efe4b 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d' >.git/info/grafts &&
		check parents-raw 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 subdir -- 15734f6db4ffde2e2128b176a19cf6ce0dceb7f9 f781822f521a68ab582f47c93afb87cdf54a7edf 4ce994c376278510d729d838cd08e798509a1a7d 2168e4afd602e69b2d40ca2d2f2b66a158501adb
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
