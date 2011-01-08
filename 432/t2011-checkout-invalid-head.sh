Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2011-checkout-invalid-head/.git/
expecting success: 
	echo hello >world &&
	git add world &&
	git commit -m initial
[master (root-commit) c3bf359] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 world

ok 1 - setup
expecting success: 
	test_must_fail git checkout -b newbranch master^{tree}
ok 2 - checkout should not start branch from a tree
expecting success: 
	echo 0000000000000000000000000000000000000000 >.git/HEAD &&
	git checkout master --

ok 3 - checkout master from invalid HEAD

# passed all 3 test(s)
1..3
