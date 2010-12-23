Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3501-revert-cherry-pick/.git/
expecting success: 

	for l in a b c d e f g h i j k l m n o
	do
		echo $l$l$l$l$l$l$l$l$l
	done >oops &&

	test_tick &&
	git add oops &&
	git commit -m initial &&
	git tag initial &&

	test_tick &&
	echo "Add extra line at the end" >>oops &&
	git commit -a -m added &&
	git tag added &&

	test_tick &&
	git mv oops spoo &&
	git commit -m rename1 &&
	git tag rename1 &&

	test_tick &&
	git checkout -b side initial &&
	git mv oops opos &&
	git commit -m rename2 &&
	git tag rename2
[master (root-commit) a242c62] initial
 Author: A U Thor <author@example.com>
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 oops
[master 4399171] added
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 31df260] rename1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename oops => spoo (100%)
[side f6d0551] rename2
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename oops => opos (100%)

ok 1 - setup

expecting success: 

	pos=$(git rev-parse HEAD) &&
	git diff --exit-code HEAD &&
	test_must_fail git cherry-pick --nonsense 2>msg &&
	git diff --exit-code HEAD "$pos" &&
	grep [Uu]sage: msg

usage: git cherry-pick [options] <commit-ish>

ok 2 - cherry-pick --nonsense

expecting success: 

	pos=$(git rev-parse HEAD) &&
	git diff --exit-code HEAD &&
	test_must_fail git revert --nonsense 2>msg &&
	git diff --exit-code HEAD "$pos" &&
	grep [Uu]sage: msg

usage: git revert [options] <commit-ish>

ok 3 - revert --nonsense

expecting success: 

	git checkout rename2 &&
	git cherry-pick added &&
	test $(git rev-parse HEAD^) = $(git rev-parse rename2) &&
	test -f opos &&
	grep "Add extra line at the end" opos &&
	git reflog -1 | grep cherry-pick


Auto-merging opos
[detached HEAD 2da2754] added
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Add extra line at the end
2da2754 HEAD@{0}: cherry-pick: added

ok 4 - cherry-pick after renaming branch

expecting success: 

	git checkout rename1 &&
	git revert added &&
	test $(git rev-parse HEAD^) = $(git rev-parse rename1) &&
	test -f spoo &&
	! grep "Add extra line at the end" spoo &&
	git reflog -1 | grep revert


Auto-merging spoo
[detached HEAD 9990ddc] Revert "added"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
9990ddc HEAD@{0}: revert: Revert "added"

ok 5 - revert after renaming branch

expecting success: 
	git clone . copy &&
	(
		cd copy &&
		git checkout initial &&
		test-chmtime +40 oops &&
		git cherry-pick added
	)

Cloning into copy...
done.
[detached HEAD 096ed54] added
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - cherry-pick on stat-dirty working tree

expecting success: 

	echo content >extra_file &&
	git add extra_file &&
	test_must_fail git revert HEAD 2>errors &&
	grep "Your local changes would be overwritten by " errors


fatal: Your local changes would be overwritten by revert.

ok 7 - revert forbidden on dirty working tree

# passed all 7 test(s)
1..7
