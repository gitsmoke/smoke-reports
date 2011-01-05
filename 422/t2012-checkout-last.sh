Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2012-checkout-last/.git/
expecting success: 
	echo hello >world &&
	git add world &&
	git commit -m initial &&
	git branch other &&
	echo "hello again" >>world &&
	git add world &&
	git commit -m second
[master (root-commit) 08855c9] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 world
[master d3ebf2b] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	test_must_fail git checkout -

ok 2 - "checkout -" does not work initially

expecting success: 
	git checkout other
ok 3 - first branch switch

expecting success: 
	git checkout - &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/master"
ok 4 - "checkout -" switches back

expecting success: 
	git checkout - &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/other"
ok 5 - "checkout -" switches forth
expecting success: 
	git checkout $(git rev-parse HEAD)
ok 6 - detach HEAD
expecting success: 
	git checkout - &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/other"
ok 7 - "checkout -" attaches again
expecting success: 
	git checkout - &&
	test "z$(git rev-parse HEAD)" = "z$(git rev-parse other)" &&
	test_must_fail git symbolic-ref HEAD
ok 8 - "checkout -" detaches again

expecting success: 
	for i in 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
	do
		git checkout -b branch$i
	done
ok 9 - more switches

expecting success: 
	more_switches &&
	git checkout @{-1} &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/branch2"
ok 10 - switch to the last
expecting success: 
	more_switches &&
	git checkout @{-2} &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/branch3"
ok 11 - switch to second from the last

expecting success: 
	more_switches &&
	git checkout @{-3} &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/branch4"
ok 12 - switch to third from the last
expecting success: 
	more_switches &&
	git checkout @{-4} &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/branch5"
ok 13 - switch to fourth from the last

expecting success: 
	more_switches &&
	git checkout @{-12} &&
	test "z$(git symbolic-ref HEAD)" = "zrefs/heads/branch13"
ok 14 - switch to twelfth from the last

expecting success: 
	git checkout -b another other &&
	echo "hello again" >>world &&
	git add world &&
	git commit -m third
[another 5a59432] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 15 - merge base test setup

expecting success: 
	git checkout another &&
	git checkout another...master &&
	test "z$(git rev-parse --verify HEAD)" = "z$(git rev-parse --verify master^)"
ok 16 - another...master
expecting success: 
	git checkout another &&
	git checkout ...master &&
	test "z$(git rev-parse --verify HEAD)" = "z$(git rev-parse --verify master^)"

ok 17 - ...master

expecting success: 
	git checkout another &&
	git checkout master... &&
	test "z$(git rev-parse --verify HEAD)" = "z$(git rev-parse --verify master^)"
ok 18 - master...

# passed all 18 test(s)
1..18
