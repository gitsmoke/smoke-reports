Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4021-format-patch-numbered/.git/
expecting success: 

	echo A > file &&
	git add file &&
	git commit -m First &&

	echo B >> file &&
	git commit -a -m Second &&

	echo C >> file &&
	git commit -a -m Third
[master (root-commit) 61b2cb5] First
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 3253fdd] Second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 27fb1bf] Third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup
expecting success: 
	git format-patch --stdout HEAD~1 >patch0.single &&
	test_single_no_numbered patch0.single

ok 2 - single patch defaults to no numbers

expecting success: 

	git format-patch --stdout HEAD~2 >patch0.multiple &&
	test_numbered patch0.multiple
Subject: [PATCH 1/2] Second
Subject: [PATCH 2/2] Third

ok 3 - multiple patch defaults to numbered
expecting success: 

	git format-patch --numbered --stdout HEAD~1 >patch1 &&
	test_single_numbered patch1
Subject: [PATCH 1/1] Third
ok 4 - Use --numbered
expecting success: 

	git config format.numbered true &&
	git format-patch --stdout HEAD~2 >patch2 &&
	test_numbered patch2
Subject: [PATCH 1/2] Second
Subject: [PATCH 2/2] Third
ok 5 - format.numbered = true
expecting success: 

	git format-patch --stdout HEAD^ > patch3 &&
	test_single_numbered patch3
Subject: [PATCH 1/1] Third
ok 6 - format.numbered && single patch
expecting success: 

	git format-patch --no-numbered --stdout HEAD~2 >patch4 &&
	test_no_numbered patch4

ok 7 - format.numbered && --no-numbered
expecting success: 

	git format-patch --keep-subject --stdout HEAD^ >patch4a &&
	grep "^Subject: Third" patch4a
Subject: Third

ok 8 - format.numbered && --keep-subject

expecting success: 

	git config format.numbered auto &&
	git format-patch --stdout HEAD~2 > patch5 &&
	test_numbered patch5
Subject: [PATCH 1/2] Second
Subject: [PATCH 2/2] Third
ok 9 - format.numbered = auto

expecting success: 

	git format-patch --stdout HEAD^ > patch6 &&
	test_single_no_numbered patch6

ok 10 - format.numbered = auto && single patch

expecting success: 

	git format-patch --no-numbered --stdout HEAD~2 > patch7 &&
	test_no_numbered patch7



ok 11 - format.numbered = auto && --no-numbered

expecting success: 

	git format-patch --start-number 3 --numbered --stdout HEAD~1 > patch8 &&
	grep "^Subject: \[PATCH 3/3\]" patch8

Subject: [PATCH 3/3] Third

ok 12 - --start-number && --numbered

# passed all 12 test(s)
1..12
