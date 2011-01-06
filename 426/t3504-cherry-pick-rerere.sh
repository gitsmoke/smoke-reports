Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3504-cherry-pick-rerere/.git/
expecting success: 
	echo foo >foo &&
	git add foo && test_tick && git commit -q -m 1 &&
	echo foo-master >foo &&
	git add foo && test_tick && git commit -q -m 2 &&

	git checkout -b dev HEAD^ &&
	echo foo-dev >foo &&
	git add foo && test_tick && git commit -q -m 3 &&
	git config rerere.enabled true

ok 1 - setup

expecting success: 
	test_must_fail git merge master

Merging:
9381111 3
virtual master
found 1 common ancestor(s):
61fb246 1
Auto-merging foo
CONFLICT (content): Merge conflict in foo
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - conflicting merge

expecting success: 
	echo foo-dev >foo &&
	git add foo && test_tick && git commit -q -m 4 &&
	git reset --hard HEAD^ &&
	echo foo-dev >expect

HEAD is now at 9381111 3

ok 3 - fixup

expecting success: 
	test_must_fail git cherry-pick master &&
	test_cmp expect foo

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 4 - cherry-pick conflict

expecting success: 
	git config rerere.enabled false &&
	git reset --hard

HEAD is now at 9381111 3

ok 5 - reconfigure

expecting success: 
	test_must_fail git cherry-pick master &&
	test_must_fail test_cmp expect foo

Auto-merging foo
CONFLICT (content): Merge conflict in foo
--- expect	2011-01-06 04:07:15.000000000 +0000
+++ foo	2011-01-06 04:07:15.000000000 +0000
@@ -1 +1,5 @@
+<<<<<<< HEAD
 foo-dev
+=======
+foo-master
+>>>>>>> 802539e... 2

ok 6 - cherry-pick conflict without rerere

# passed all 6 test(s)
1..6
