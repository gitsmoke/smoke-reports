Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7604-merge-custom-message/.git/
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
	create_merge_msgs
[master (root-commit) 6bb2b5d] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master fed8778] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
HEAD is now at 6bb2b5d c0
[master f74675d] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 1 - setup

expecting success: 
	git reset --hard c1 &&
	git merge -m "$(cat exp.subject)" c2 &&
	git cat-file commit HEAD | sed -e "1,/^$/d" >actual &&
	test_cmp exp.subject actual

HEAD is now at fed8778 c1
Merging:
fed8778 c1
virtual c2
found 1 common ancestor(s):
6bb2b5d c0
Merge made by recursive.
 c2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 2 - merge c2 with a custom message

expecting success: 
	git reset --hard c1 &&
	git merge --log -m "$(cat exp.subject)" c2 &&
	git cat-file commit HEAD | sed -e "1,/^$/d" >actual &&
	test_cmp exp.log actual

HEAD is now at fed8778 c1
Merging:
fed8778 c1
virtual c2
found 1 common ancestor(s):
6bb2b5d c0
Merge made by recursive.
 c2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 3 - merge --log appends to custom message

# passed all 3 test(s)
1..3
