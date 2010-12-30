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

[master (root-commit) 444f692] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master f5302dc] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 1191da3] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 05c2e4e] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 2176e6d] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 1c09561] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
		rm -f .git/info/grafts &&
		check basic 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 2 - without grafts

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check basic 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e f5302dc8bfc8287d7ec8e13beee6ad038cb45485 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check basic 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 6 - without grafts

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check parents 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e f5302dc8bfc8287d7ec8e13beee6ad038cb45485 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check parents 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 10 - without grafts

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check parents-raw 1c095612da0fb952c4452ebefffa1bd9b99c8975 -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 2176e6d5fe7db1f9224e5ee3093f240e6fa218d3 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e f5302dc8bfc8287d7ec8e13beee6ad038cb45485 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e' >.git/info/grafts &&
		check parents-raw 1c095612da0fb952c4452ebefffa1bd9b99c8975 subdir -- 1c095612da0fb952c4452ebefffa1bd9b99c8975 05c2e4e8ae0f0fec28af10ddec19a7616fc61de2 1191da3a99d31bd78786d808e1069ab8ad27de0e 444f6920547078bcadfce66695cce7cb8ebd3a3b
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
