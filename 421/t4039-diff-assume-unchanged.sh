Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4039-diff-assume-unchanged/.git/
expecting success: 
	echo zero > zero &&
	git add zero &&
	git commit -m zero &&
	echo one > one &&
	echo two > two &&
	git add one two &&
	git commit -m onetwo &&
	git update-index --assume-unchanged one &&
	echo borked >> one &&
	test "$(git ls-files -v one)" = "h one"

[master (root-commit) 03938b2] zero
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 zero
[master 0069ec2] onetwo
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 two

ok 1 - setup

expecting success: 
	git diff-index HEAD^ -- one | grep -q 5626abf0f72e58d7a153368ba57db4c673c0e171


ok 2 - diff-index does not examine assume-unchanged entries

expecting success: 
	rm one &&
	test -z "$(git diff-files -- one)"


ok 3 - diff-files does not examine assume-unchanged entries

# passed all 3 test(s)
1..3
