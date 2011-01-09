Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1411-reflog-show/.git/
expecting success: 
	echo content >file &&
	git add file &&
	test_tick &&
	git commit -m one
[master (root-commit) e46513e] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	git log -g -1 >tmp &&
	grep ^Reflog <tmp >actual &&
	test_cmp expect actual

ok 2 - log -g shows reflog headers
expecting success: 
	git log -g -1 --oneline >actual &&
	test_cmp expect actual

ok 3 - oneline reflog format
expecting success: 
	git log -g -1 HEAD@{now} >tmp &&
	grep ^Reflog <tmp >actual &&
	test_cmp expect actual

ok 4 - using @{now} syntax shows reflog date (multiline)

expecting success: 
	git log -g -1 --oneline HEAD@{now} >actual &&
	test_cmp expect actual


ok 5 - using @{now} syntax shows reflog date (oneline)

expecting success: 
	git log -g -1 --date=raw >tmp &&
	grep ^Reflog <tmp >actual &&
	test_cmp expect actual

ok 6 - using --date= shows reflog date (multiline)
expecting success: 
	git log -g -1 --oneline --date=raw >actual &&
	test_cmp expect actual

ok 7 - using --date= shows reflog date (oneline)
expecting success: 
	git branch empty &&
	: >.git/logs/refs/heads/empty &&

	git log -g empty >actual &&
	test_cmp expect actual

ok 8 - empty reflog file

# passed all 8 test(s)
1..8
