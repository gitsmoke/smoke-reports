Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7503-pre-commit-hook/.git/
expecting success: 

	echo "foo" > file &&
	git add file &&
	git commit -m "first"
[master (root-commit) a547e32] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - with no hook
expecting success: 

	echo "bar" > file &&
	git add file &&
	git commit --no-verify -m "bar"
[master 4a66223] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - --no-verify with no hook
expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -m "more"
[master 0288166] more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - with succeeding hook

expecting success: 

	echo "even more" >> file &&
	git add file &&
	git commit --no-verify -m "even more"
[master 531ba3d] even more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - --no-verify with succeeding hook
expecting success: 

	echo "another" >> file &&
	git add file &&
	test_must_fail git commit -m "another"

ok 5 - with failing hook
expecting success: 

	echo "stuff" >> file &&
	git add file &&
	git commit --no-verify -m "stuff"
[master fbbca5f] stuff
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 6 - --no-verify with failing hook

expecting success: 

	echo "content" >> file &&
	git add file &&
	git commit -m "content"


[master 301ef15] content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - with non-executable hook

expecting success: 

	echo "more content" >> file &&
	git add file &&
	git commit --no-verify -m "more content"


[master cf6f90a] more content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - --no-verify with non-executable hook

# passed all 8 test(s)
1..8
