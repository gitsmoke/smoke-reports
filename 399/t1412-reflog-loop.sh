Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1412-reflog-loop/.git/
expecting success: 
	test_tick &&
	echo content >file && git add file && git commit -m one &&
	git tag one &&
	echo content >>file && git add file && git commit -m two &&
	git tag two
[master (root-commit) e46513e] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 441e5e0] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup commits
expecting success: 
	git checkout -b topic &&
	git reset one &&
	git reset two &&
	git reset one &&
	git reset two
Unstaged changes after reset:
M	file
Unstaged changes after reset:
M	file

ok 2 - setup reflog with alternating commits

expecting success: 
	cat >expect <<-\EOF
		topic@{0} two: updating HEAD
		topic@{1} one: updating HEAD
		topic@{2} two: updating HEAD
		topic@{3} one: updating HEAD
		topic@{4} branch: Created from HEAD
	EOF
	git log -g --format="%gd %gs" topic >actual &&
	test_cmp expect actual

ok 3 - reflog shows all entries

# passed all 3 test(s)
1..3
