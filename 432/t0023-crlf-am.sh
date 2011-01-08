Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0023-crlf-am/.git/
expecting success: 

	git config core.autocrlf true &&
	echo foo >bar &&
	git add bar &&
	test_tick &&
	git commit -m initial
[master (root-commit) 1adb513] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar

ok 1 - setup

expecting success: 

	git am -3 <patchfile &&
	git diff-files --name-status --exit-code
Applying: test1
ok 2 - am

# passed all 2 test(s)
1..2
