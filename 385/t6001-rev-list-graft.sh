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

[master (root-commit) 90cb559] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 5692b1a] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master d8181f2] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) ba28d1e] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master d6c1e9a] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master b2a7457] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 2 - without grafts

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check basic b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 5692b1abb6d01d6bd113ae80ac48a9d818e98f3a 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check basic b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 6 - without grafts

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check parents b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 5692b1abb6d01d6bd113ae80ac48a9d818e98f3a 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check parents b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 10 - without grafts

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check parents-raw b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 d6c1e9a018dc8e8971a4afbcec4f9dd3a8297487 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 5692b1abb6d01d6bd113ae80ac48a9d818e98f3a 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0' >.git/info/grafts &&
		check parents-raw b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 subdir -- b2a745707a1b9cc37b6c6498c58b7aeb14aaaeb9 ba28d1ee293f7574d22233811407d8b23201a2d0 d8181f2417451d07cc82097bb636f6fd622e38d0 90cb559e6cb9c66e809dd9fc03825b62e3223657
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
