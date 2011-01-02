Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1507-rev-parse-upstream/.git/
expecting success: 

	test_commit 1 &&
	git checkout -b side &&
	test_commit 2 &&
	git checkout master &&
	git clone . clone &&
	test_commit 3 &&
	(cd clone &&
	 test_commit 4 &&
	 git branch --track my-side origin/side)
[master (root-commit) d0dcf97] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1.t
[side 82335b2] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2.t
Cloning into clone...
done.
[master 8f489d0] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 3.t
[master 6efda21] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 4.t
Branch my-side set up to track remote branch side from origin.

ok 1 - setup

expecting success: 
	test refs/remotes/origin/master = "$(full_name @{upstream})"


ok 2 - @{upstream} resolves to correct full name

expecting success: 
	test refs/remotes/origin/master = "$(full_name @{u})"

ok 3 - @{u} resolves to correct full name

expecting success: 
	test refs/remotes/origin/side = "$(full_name my-side@{u})"

ok 4 - my-side@{upstream} resolves to correct full name

expecting success: 
	git checkout side &&
	test_commit 5 &&
	(cd clone && git fetch) &&
	test 2 = "$(commit_subject my-side)" &&
	test 5 = "$(commit_subject my-side@{u})"
[side e3f9627] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 5.t
ok 5 - my-side@{u} resolves to correct commit
expecting success: 
	test_must_fail full_name non-tracking@{u} &&
	(cd clone && git checkout --no-track -b non-tracking) &&
	test_must_fail full_name non-tracking@{u}
non-tracking@{u}
non-tracking@{u}

ok 6 - not-tracking@{u} fails
expecting success: 
	test_commit 6 &&
	(cd clone && git fetch) &&
	test 5 = $(commit_subject my-side@{u}@{1})
[side 8bf5882] 6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 6.t
ok 7 - <branch>@{u}@{1} resolves correctly

expecting success: 
	git checkout HEAD^0 &&
	test_must_fail git rev-parse @{u}
@{u}

ok 8 - @{u} without specifying branch fails on a detached HEAD
expecting success: 
(
	cd clone &&
	git checkout -b new my-side@{u} &&
	git rev-parse --symbolic-full-name my-side@{u} >expect &&
	git rev-parse --symbolic-full-name new@{u} >actual &&
	test_cmp expect actual
)
Branch new set up to track remote branch side from origin.
ok 9 - checkout -b new my-side@{u} forks from the same

expecting success: 
(
	sq="'" &&
	cd clone || exit
	git checkout master || exit
	git branch -D new ;# can fail but is ok
	git branch -t new my-side@{u} &&
	git merge -s ours new@{u} &&
	git show -s --pretty=format:%s >actual &&
	echo "Merge remote-tracking branch ${sq}origin/side${sq}" >expect &&
	test_cmp expect actual
)
Your branch and 'origin/master' have diverged,
and have 1 and 1 different commit(s) each, respectively.
Deleted branch new (was 8bf5882).
Branch new set up to track remote branch side from origin.
Merge made by ours.
ok 10 - merge my-side@{u} records the correct name
expecting success: 
	git checkout -t -b other master &&
	git branch -d @{u} &&
	git for-each-ref refs/heads/master >actual &&
	>expect &&
	test_cmp expect actual
Branch other set up to track local branch master.
Deleted branch master (was 8f489d0).
ok 11 - branch -d other@{u}
expecting success: 
	git branch -f master HEAD &&
	git checkout -t -b another master &&
	git checkout @{u} &&
	git symbolic-ref HEAD >actual &&
	echo refs/heads/master >expect &&
	test_cmp expect actual
Branch another set up to track local branch master.
ok 12 - checkout other@{u}
expecting success: 
	git log -1 -g other@{u} >actual &&
	test_cmp expect actual

ok 13 - log -g other@{u}
expecting success: 
	git log -1 -g other@{u}@{now} >actual &&
	test_cmp expect actual

ok 14 - log -g other@{u}@{now}
# passed all 14 test(s)
1..14
