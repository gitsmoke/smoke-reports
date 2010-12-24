Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6007-rev-list-cherry-pick-file/.git/
expecting success: 
	echo Hallo > foo &&
	git add foo &&
	test_tick &&
	git commit -m "A" &&
	git tag A &&
	git checkout -b branch &&
	echo Bello > foo &&
	echo Cello > bar &&
	git add foo bar &&
	test_tick &&
	git commit -m "C" &&
	git tag C &&
	git checkout master &&
	git checkout branch foo &&
	test_tick &&
	git commit -m "B" &&
	git tag B
[master (root-commit) 87a5b85] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[branch d81b112] C
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 bar
[master 77115c1] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
	git rev-list --left-right B...C > actual &&
	git name-rev --stdin --name-only --refs="*tags/*" \
		< actual > actual.named &&
	test_cmp actual.named expect

ok 2 - --left-right

expecting success: 
	git rev-list --count B...C > actual &&
	test "$(cat actual)" = 2

ok 3 - --count

expecting success: 
	test -z "$(git rev-list --left-right --cherry-pick B...C -- foo)"

ok 4 - --cherry-pick foo comes up empty

expecting success: 
	! test -z "$(git rev-list --left-right --cherry-pick B...C -- bar)"

ok 5 - --cherry-pick bar does not come up empty

expecting success: 
	git symbolic-ref HEAD refs/heads/independent &&
	rm .git/index &&
	echo Hallo > foo &&
	git add foo &&
	test_tick &&
	git commit -m "independent" &&
	echo Bello > foo &&
	test_tick &&
	git commit -m "independent, too" foo &&
	test -z "$(git rev-list --left-right --cherry-pick \
		HEAD...master -- foo)"
[independent (root-commit) 2033a80] independent
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[independent 6214f96] independent, too
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - --cherry-pick with independent, but identical branches
expecting success: 
	git checkout branch &&
	test_commit D &&
	git rev-list --count --left-right B...D > actual &&
	test_cmp expect actual
[branch bd2b055] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D.t

ok 7 - --count --left-right

# passed all 7 test(s)
1..7
