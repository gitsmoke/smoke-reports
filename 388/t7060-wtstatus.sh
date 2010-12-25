Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7060-wtstatus/.git/
expecting success: 
	test_commit A &&
	test_commit B oneside added &&
	git checkout A^0 &&
	test_commit C oneside created
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
[master 5747a32] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 oneside
[detached HEAD f7fe030] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 oneside

ok 1 - setup

expecting success: 
	git checkout B^0 &&
	test_must_fail git merge C

Merging:
5747a32 B
virtual C
found 1 common ancestor(s):
0ddfaf1 A
Auto-merging oneside
CONFLICT (add/add): Merge conflict in oneside
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - A/A conflict

expecting success: 
	git diff --cached --name-status >actual &&
	echo "U	oneside" >expect &&
	test_cmp expect actual


ok 3 - Report path with conflict

expecting success: 
	git diff --cached --name-status HEAD^ >actual &&
	echo "U	oneside" >expect &&
	test_cmp expect actual


ok 4 - Report new path with conflict
expecting success: 
	mkdir mdconflict &&
	(
		cd mdconflict &&
		git init &&
		test_commit initial foo "" &&
		test_commit modify foo foo &&
		git checkout -b side HEAD^ &&
		git rm foo &&
		git commit -m delete &&
		test_must_fail git merge master &&
		test_must_fail git commit --dry-run >../actual &&
		test_cmp ../expect ../actual &&
		git status >../actual &&
		test_cmp ../expect ../actual
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7060-wtstatus/mdconflict/.git/
[master (root-commit) a3c5375] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master efd4a38] modify
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
rm 'foo'
[side 0599bc2] delete
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 foo
Merging:
0599bc2 delete
virtual master
found 1 common ancestor(s):
a3c5375 initial
CONFLICT (delete/modify): foo deleted in HEAD and modified in master. Version master of foo left in tree.
Automatic merge failed; fix conflicts and then commit the result.

ok 5 - M/D conflict does not segfault

# passed all 5 test(s)
1..5
