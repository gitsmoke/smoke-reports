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

[master (root-commit) 968dd10] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master f1420ae] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 03ecced] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 72ed880] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master df98e32] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2a641a0] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 2 - without grafts

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check basic 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a f1420ae8b3a46ff4e14fa7defaa8497715c41125 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check basic 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 6 - without grafts

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check parents 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a f1420ae8b3a46ff4e14fa7defaa8497715c41125 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check parents 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 10 - without grafts

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check parents-raw 2a641a0fa3827fbb3589f219fea787929bab2fe0 -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 df98e32d589a735188ddde3f013ab7cabdd898a2 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a f1420ae8b3a46ff4e14fa7defaa8497715c41125 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a' >.git/info/grafts &&
		check parents-raw 2a641a0fa3827fbb3589f219fea787929bab2fe0 subdir -- 2a641a0fa3827fbb3589f219fea787929bab2fe0 72ed880fba0deb65cf5a300087a0e0842f9dfccb 03ecced87a4d8921cf89b9f7cbafda26755f409a 968dd10784a7bb27f1650c7d0d4b054e1856e116
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
