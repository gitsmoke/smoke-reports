Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5518-fetch-exit-status/.git/
expecting success: 

	>file &&
	git add file &&
	git commit -m initial &&

	git checkout -b side &&
	echo side >file &&
	git commit -a -m side &&

	git checkout master &&
	echo next >file &&
	git commit -a -m next

[master (root-commit) 2f65f52] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[side 650a183] side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master f9f2805] next
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	test_must_fail git fetch . master:side



ok 2 - non-fast-forward fetch

expecting success: 

	git fetch . +master:side



ok 3 - forced update

# passed all 3 test(s)
1..3
