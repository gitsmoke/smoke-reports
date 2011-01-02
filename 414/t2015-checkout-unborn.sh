Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2015-checkout-unborn/.git/
expecting success: 
	mkdir parent &&
	(cd parent &&
	 git init &&
	 echo content >file &&
	 git add file &&
	 git commit -m base
	) &&
	git fetch parent master:origin
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2015-checkout-unborn/parent/.git/
[master (root-commit) e1f0a9c] base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	echo precious >expect &&
	echo precious >file &&
	test_must_fail git checkout -b new origin &&
	test_cmp expect file
Aborting

ok 2 - checkout from unborn preserves untracked files

expecting success: 
	echo precious >expect &&
	echo precious >file &&
	git add file &&
	test_must_fail git checkout -b new origin &&
	test_cmp expect file &&
	git show :file >file &&
	test_cmp expect file
Aborting

ok 3 - checkout from unborn preserves index contents

expecting success: 
	echo content >file &&
	git add file &&
	git checkout -b new origin
ok 4 - checkout from unborn merges identical index contents

# passed all 4 test(s)
1..4
