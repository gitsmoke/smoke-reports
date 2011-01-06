Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3409-rebase-preserve-merges/.git/
expecting success: echo First > A &&
	git add A &&
	git commit -m "Add A1" &&
	git checkout -b topic &&
	echo Second > B &&
	git add B &&
	git commit -m "Add B1" &&
	git checkout -f master &&
	echo Third >> A &&
	git commit -a -m "Modify A2" &&

	git clone ./. clone1 &&
	(cd clone1 &&
	git checkout -b topic origin/topic &&
	git merge origin/master
	) &&

	echo Fifth > B &&
	git add B &&
	git commit -m "Add different B" &&

	git clone ./. clone2 &&
	(
		cd clone2 &&
		git checkout -b topic origin/topic &&
		test_must_fail git merge origin/master &&
		echo Resolved >B &&
		git add B &&
		git commit -m "Merge origin/master into topic"
	) &&

	git checkout topic &&
	echo Fourth >> B &&
	git commit -a -m "Modify B2"
[master (root-commit) 9bf6d98] Add A1
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[topic a0ebcd1] Add B1
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
[master 0743c3f] Modify A2
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
Cloning into clone1
done.
Branch topic set up to track remote branch topic from origin.
Merging:
a0ebcd1 Add B1
virtual origin/master
found 1 common ancestor(s):
9bf6d98 Add A1
Merge made by recursive.
 A |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
[master aca2073] Add different B
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
Cloning into clone2
done.
Branch topic set up to track remote branch topic from origin.
Merging:
a0ebcd1 Add B1
virtual origin/master
found 1 common ancestor(s):
9bf6d98 Add A1
Auto-merging B
CONFLICT (add/add): Merge conflict in B
Automatic merge failed; fix conflicts and then commit the result.
[topic e6c3dbb] Merge origin/master into topic
 Author: A U Thor <bogus_email_address>
[topic 0510f56] Modify B2
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup for merge-preserving rebase

expecting success: 
	(
	cd clone1 &&
	git fetch &&
	git rebase -p origin/topic &&
	test 1 = $(git rev-list --all --pretty=oneline | grep "Modify A" | wc -l) &&
	test 1 = $(git rev-list --all --pretty=oneline | grep "Merge remote-tracking branch " | wc -l)
	)
Rebasing (1/1)
ok 2 - rebase -p fakes interactive rebase

expecting success: 
	(
	cd clone2 &&
	git fetch &&
	test_must_fail git rebase -p origin/topic &&
	test 2 = $(git ls-files B | wc -l) &&
	echo Resolved again > B &&
	test_must_fail git rebase --continue &&
	grep "^@@@ " .git/rebase-merge/patch &&
	git add B &&
	git rebase --continue &&
	test 1 = $(git rev-list --all --pretty=oneline | grep "Modify A" | wc -l) &&
	test 1 = $(git rev-list --all --pretty=oneline | grep "Add different" | wc -l) &&
	test 1 = $(git rev-list --all --pretty=oneline | grep "Merge origin" | wc -l)
	)
Rebasing (1/1)Merging:
0510f56 Modify B2
virtual aca2073e5be39d3e8d296ca5e1400c67aea96eb2
found 1 common ancestor(s):
9bf6d98 Add A1
Auto-merging B
CONFLICT (add/add): Merge conflict in B
Automatic merge failed; fix conflicts and then commit the result.
B: needs merge
You must edit all merge conflicts and then
mark them as resolved using git add
@@@ -1,1 -1,1 +1,1 @@@
[detached HEAD 017c0ee] Merge origin/master into topic
 Author: A U Thor <bogus_email_address>
Rebasing (1/1)
ok 3 - --continue works after a conflict

# passed all 3 test(s)
1..3
