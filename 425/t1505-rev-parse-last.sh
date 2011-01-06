Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1505-rev-parse-last/.git/
expecting success: 

	make_commit 1 &&
	git branch side &&
	make_commit 2 &&
	make_commit 3 &&
	git checkout side &&
	make_commit 4 &&
	git merge master &&
	git checkout master
[master (root-commit) 10ddaea] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1
[master 0895944] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2
[master 1f883c9] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 3
[side b655e5b] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 4
Merging:
b655e5b 4
virtual master
found 1 common ancestor(s):
10ddaea 1
Merge made by recursive.
 2 |    1 +
 3 |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 2
 create mode 100644 3
ok 1 - setup
expecting success: 
	test_rev_equivalent side @{-1}

ok 2 - @{-1} works

expecting success: 
	test_rev_equivalent side~2 @{-1}~2


ok 3 - @{-1}~2 works

expecting success: 
	test_rev_equivalent side^2 @{-1}^2


ok 4 - @{-1}^2 works

expecting success: 
	test_rev_equivalent side@{1} @{-1}@{1}

ok 5 - @{-1}@{1} works

expecting success: 
	test_rev_equivalent master @{-2}

ok 6 - @{-2} works

expecting success: 
	test_must_fail git rev-parse @{-3}

@{-3}

ok 7 - @{-3} fails

# passed all 7 test(s)
1..7
