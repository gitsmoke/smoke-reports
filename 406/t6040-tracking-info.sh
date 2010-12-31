Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6040-tracking-info/.git/
expecting success: 
	for i in a b c;
	do
		advance $i || break
	done &&
	git clone . test &&
	(
		cd test &&
		git checkout -b b1 origin &&
		git reset --hard HEAD^ &&
		advance d &&
		git checkout -b b2 origin &&
		git reset --hard b1 &&
		git checkout -b b3 origin &&
		git reset --hard HEAD^ &&
		git checkout -b b4 origin &&
		advance e &&
		advance f
	) &&
	git checkout -b follower --track master &&
	advance g

[master (root-commit) cc33353] a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master 7e1cf2d] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b
[master ac11e55] c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c
Cloning into test...
done.
Branch b1 set up to track remote branch master from origin.
HEAD is now at 7e1cf2d b
[b1 afc0d66] d
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 d
Branch b2 set up to track remote branch master from origin.
HEAD is now at afc0d66 d
Branch b3 set up to track remote branch master from origin.
HEAD is now at 7e1cf2d b
Branch b4 set up to track remote branch master from origin.
[b4 ec9b031] e
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 e
[b4 59ecd1d] f
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 f
Branch follower set up to track local branch master.
[follower ae28603] g
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 g

ok 1 - setup

expecting success: 
	(
		cd test &&
		git branch -v
	) |
	sed -n -e "$script" >actual &&
	test_cmp expect actual


ok 2 - branch -v

expecting success: 
	(
		cd test && git checkout b1
	) >actual &&
	grep "have 1 and 1 different" actual
and have 1 and 1 different commit(s) each, respectively.

ok 3 - checkout

expecting success: 
	git checkout master &&
	git checkout follower >actual &&
	grep "is ahead of" actual

Your branch is ahead of 'master' by 1 commit.

ok 4 - checkout with local tracked branch

expecting success: 
	(
		cd test &&
		git checkout b1 >/dev/null &&
		# reports nothing to commit
		test_must_fail git commit --dry-run
	) >actual &&
	grep "have 1 and 1 different" actual

# and have 1 and 1 different commit(s) each, respectively.

ok 5 - status

expecting success: 
	git checkout master &&
	git tag light &&
	git branch --track lighttrack light >actual &&
	grep "set up to track" actual &&
	git checkout lighttrack

Branch lighttrack set up to track local ref refs/tags/light.

ok 6 - status when tracking lightweight tags

expecting success: 
	git checkout master &&
	git tag -m heavy heavy &&
	git branch --track heavytrack heavy >actual &&
	grep "set up to track" actual &&
	git checkout heavytrack
Branch heavytrack set up to track local ref refs/tags/heavy.

ok 7 - status when tracking annotated tags

expecting success: 
	git branch from-master master &&
	test_must_fail git config branch.from-master.merge > actual &&
	git branch --set-upstream from-master master &&
	git config branch.from-master.merge > actual &&
	grep -q "^refs/heads/master$" actual
Branch from-master set up to track local branch master.
ok 8 - setup tracking with branch --set-upstream on existing branch
expecting success: 
	git branch from-master2 master &&
	test_must_fail git config branch.from-master2.merge > actual &&
	git rev-list from-master2 &&
	git update-ref refs/heads/from-master2 from-master2^ &&
	git rev-parse from-master2 >expect2 &&
	git branch --set-upstream from-master2 master &&
	git config branch.from-master.merge > actual &&
	git rev-parse from-master2 >actual2 &&
	grep -q "^refs/heads/master$" actual &&
	cmp expect2 actual2
ac11e552c8e799a6af00e91a64888439b699d9fd
7e1cf2dc889e845623128125195d11533d8aef5e
cc33353f1c71fb0fa9b4671a6a0a8539ad9ecd0a
Branch from-master2 set up to track local branch master.
ok 9 - --set-upstream does not change branch

# passed all 9 test(s)
1..9
