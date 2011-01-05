Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7605-merge-resolve/.git/
expecting success: 
	echo c0 > c0.c &&
	git add c0.c &&
	git commit -m c0 &&
	git tag c0 &&
	echo c1 > c1.c &&
	git add c1.c &&
	git commit -m c1 &&
	git tag c1 &&
	git reset --hard c0 &&
	echo c2 > c2.c &&
	git add c2.c &&
	git commit -m c2 &&
	git tag c2 &&
	git reset --hard c0 &&
	echo c3 > c2.c &&
	git add c2.c &&
	git commit -m c3 &&
	git tag c3
[master (root-commit) fcc2f86] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master 75abb23] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
HEAD is now at fcc2f86 c0
[master 46fd904] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
HEAD is now at fcc2f86 c0
[master fae607d] c3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 1 - setup
expecting success: 
	git reset --hard c1 &&
	git merge -s resolve c2 &&
	test "$(git rev-parse c1)" != "$(git rev-parse HEAD)" &&
	test "$(git rev-parse c1)" = "$(git rev-parse HEAD^1)" &&
	test "$(git rev-parse c2)" = "$(git rev-parse HEAD^2)" &&
	git diff --exit-code &&
	test -f c0.c &&
	test -f c1.c &&
	test -f c2.c &&
	test 3 = $(git ls-tree -r HEAD | wc -l) &&
	test 3 = $(git ls-files | wc -l)
HEAD is now at 75abb23 c1
Trying really trivial in-index merge...
Wonderful.
In-index merge
 c2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 2 - merge c1 to c2
expecting success: 
	git reset --hard c2 &&
	test_must_fail git merge -s resolve c3
HEAD is now at 46fd904 c2
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Added c2.c in both, but differently.
ERROR: content conflict in c2.c
Automatic merge failed; fix conflicts and then commit the result.

ok 3 - merge c2 to c3 (fails)
# passed all 3 test(s)
1..3
