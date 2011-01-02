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

[master (root-commit) b1e7a6e] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 2e06439] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master af2d844] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 7e1d9cd] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 8945fb9] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 893d9d8] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 2 - without grafts

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check basic 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be 2e06439490e8d6fdb0dfb3e33b46d26a19060a22 b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check basic 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 6 - without grafts

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check parents 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be 2e06439490e8d6fdb0dfb3e33b46d26a19060a22 b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check parents 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 10 - without grafts

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check parents-raw 893d9d82ee8bffc54f957d7359cb433b44a18c3f -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 8945fb993b6a3b87f89279bbc176b924a18cd019 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be 2e06439490e8d6fdb0dfb3e33b46d26a19060a22 b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be' >.git/info/grafts &&
		check parents-raw 893d9d82ee8bffc54f957d7359cb433b44a18c3f subdir -- 893d9d82ee8bffc54f957d7359cb433b44a18c3f 7e1d9cd53c926d6646519f0d4e3bb0be45ccaac7 af2d844972c785f7b2f09fe1598c2dd5c2df08be b1e7a6e2cd793d382a487008fe11efea957ec449
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
