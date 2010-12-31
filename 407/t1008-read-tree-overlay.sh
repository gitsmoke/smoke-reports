Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1008-read-tree-overlay/.git/
expecting success: 
	echo one >a &&
	git add a &&
	git commit -m initial &&
	git tag initial &&
	echo two >b &&
	git add b &&
	git commit -m second &&
	git checkout -b side initial &&
	echo three >a &&
	mkdir b &&
	echo four >b/c &&
	git add b/c &&
	git commit -m third
[master (root-commit) 56e4a28] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master 3aeaeab] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b
[side 4afc65a] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b/c

ok 1 - setup

expecting success: 
	git read-tree initial master side &&
	(echo a; echo b/c) >expect &&
	git ls-files >actual &&
	test_cmp expect actual

ok 2 - multi-read

# passed all 2 test(s)
1..2
