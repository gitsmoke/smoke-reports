Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3702-add-edit/.git/
expecting success: 

	git add file &&
	test_tick &&
	git commit -m initial file
[master (root-commit) e055285] initial
 Author: A U Thor <author@example.com>
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 

	cp second-part file &&
	git add -e &&
	test_cmp second-part file &&
	test_cmp orig-patch expected-patch &&
	git diff --cached > out &&
	test_cmp out expected



ok 2 - add -e

# passed all 2 test(s)
1..2
