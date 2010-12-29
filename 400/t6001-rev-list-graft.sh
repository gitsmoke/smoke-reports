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
[master (root-commit) b08ae63] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master edf1d16] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 70bbf2a] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) f24a830] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 2f37aef] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ea079ae] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 2 - without grafts

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check basic ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 edf1d16b2d6fa877261d09ba80587f6cf02e5045 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check basic ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 6 - without grafts

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check parents ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 edf1d16b2d6fa877261d09ba80587f6cf02e5045 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check parents ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 10 - without grafts

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check parents-raw ea079aef736f55f97d4d53b113ea795955617046 -- ea079aef736f55f97d4d53b113ea795955617046 2f37aef4240de5dad79f76787ee6dad274f776f8 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 edf1d16b2d6fa877261d09ba80587f6cf02e5045 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2' >.git/info/grafts &&
		check parents-raw ea079aef736f55f97d4d53b113ea795955617046 subdir -- ea079aef736f55f97d4d53b113ea795955617046 f24a8303671c67fb7e217de6a21b5802bc466c3c 70bbf2aed1ea7cfaf1c74e929197d99f86667cf2 b08ae638eaa926287d8308115c33a301dbea9397
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
