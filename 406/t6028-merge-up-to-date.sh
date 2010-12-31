Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6028-merge-up-to-date/.git/
expecting success: 
	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git tag c0 &&

	echo second >file &&
	git add file &&
	test_tick &&
	git commit -m second &&
	git tag c1 &&
	git branch test
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master e042178] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git reset --hard c1 &&
	test_tick &&
	git merge -s recursive c0 &&
	expect=$(git rev-parse c1) &&
	current=$(git rev-parse HEAD) &&
	test "$expect" = "$current"


HEAD is now at e042178 second
Already up-to-date.

ok 2 - merge -s recursive up-to-date

expecting success: 

	git reset --hard c0 &&
	test_tick &&
	git merge -s recursive c1 &&
	expect=$(git rev-parse c1) &&
	current=$(git rev-parse HEAD) &&
	test "$expect" = "$current"
HEAD is now at 1bd44cb initial
Updating 1bd44cb..e042178
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - merge -s recursive fast-forward

expecting success: 

	git reset --hard c1 &&
	test_tick &&
	git merge -s ours c0 &&
	expect=$(git rev-parse c1) &&
	current=$(git rev-parse HEAD) &&
	test "$expect" = "$current"


HEAD is now at e042178 second
Already up-to-date.

ok 4 - merge -s ours up-to-date

expecting success: 

	git reset --hard c0 &&
	test_tick &&
	git merge -s ours c1 &&
	expect=$(git rev-parse c0^{tree}) &&
	current=$(git rev-parse HEAD^{tree}) &&
	test "$expect" = "$current"


HEAD is now at 1bd44cb initial
Merge made by ours.

ok 5 - merge -s ours fast-forward

expecting success: 

	git reset --hard c1 &&
	test_tick &&
	git merge -s subtree c0 &&
	expect=$(git rev-parse c1) &&
	current=$(git rev-parse HEAD) &&
	test "$expect" = "$current"


HEAD is now at e042178 second
Already up-to-date.

ok 6 - merge -s subtree up-to-date

# passed all 6 test(s)
1..6
