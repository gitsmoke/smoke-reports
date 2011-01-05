Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2009-checkout-statinfo/.git/
expecting success: 

	echo hello >world &&
	git update-index --add world &&
	git commit -m initial &&
	git branch side &&
	echo goodbye >world &&
	git update-index --add world &&
	git commit -m second
[master (root-commit) 1039bae] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 world
[master d8ad7cb] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	git reset --hard &&
	test "$(git diff-files --raw)" = "" &&

	git checkout master &&
	test "$(git diff-files --raw)" = "" &&

	git checkout side &&
	test "$(git diff-files --raw)" = "" &&

	git checkout master &&
	test "$(git diff-files --raw)" = ""


HEAD is now at d8ad7cb second
ok 2 - branch switching

expecting success: 

	git reset --hard &&
	test "$(git diff-files --raw)" = "" &&

	git checkout master world &&
	test "$(git diff-files --raw)" = "" &&

	git checkout side world &&
	test "$(git diff-files --raw)" = "" &&

	git checkout master world &&
	test "$(git diff-files --raw)" = ""
HEAD is now at d8ad7cb second
ok 3 - path checkout
# passed all 3 test(s)
1..3
