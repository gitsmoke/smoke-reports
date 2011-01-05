Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6009-rev-list-parent/.git/
expecting success: 

	touch file &&
	git add file &&

	commit one &&

	test_tick=$(($test_tick - 2400)) &&

	commit two &&
	commit three &&
	commit four &&

	git log --pretty=oneline --abbrev-commit
[master (root-commit) 3fbea72] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master aac40a3] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 0343f44] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 7612de8] four
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
7612de8 four
0343f44 three
aac40a3 two
3fbea72 one

ok 1 - setup

expecting success: 

	git rev-list one --not four >result &&
	>expect &&
	test_cmp expect result



ok 2 - one is ancestor of others and should not be shown

# passed all 2 test(s)
1..2
