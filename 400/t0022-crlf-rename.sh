Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0022-crlf-rename/.git/
expecting success: 

	cat "$TEST_DIRECTORY"/t0022-crlf-rename.sh >sample &&
	git add sample &&

	test_tick &&
	git commit -m Initial &&

	append_cr <"$TEST_DIRECTORY"/t0022-crlf-rename.sh >elpmas &&
	git add elpmas &&
	rm -f sample &&

	test_tick &&
	git commit -a -m Second
[master (root-commit) 6ee20c2] Initial
 Author: A U Thor <author@example.com>
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 sample
[master d248b45] Second
 Author: A U Thor <author@example.com>
 1 files changed, 33 insertions(+), 33 deletions(-)
 rename sample => elpmas (94%)

ok 1 - setup

expecting success: 

	git diff-tree -M -r --name-status HEAD^ HEAD |
	sed -e "s/R[0-9]*/RNUM/" >actual &&
	echo "RNUM	sample	elpmas" >expect &&
	test_cmp expect actual

ok 2 - diff -M

# passed all 2 test(s)
1..2
