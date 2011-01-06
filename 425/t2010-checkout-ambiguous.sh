Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2010-checkout-ambiguous/.git/
expecting success: 
	echo hello >world &&
	echo hello >all &&
	git add all world &&
	git commit -m initial &&
	git branch world

[master (root-commit) 8a0f19c] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 all
 create mode 100644 world

ok 1 - setup

expecting success: 
	test_must_fail git checkout $(git hash-object ./all) --


ok 2 - reference must be a tree

expecting success: 
	test "refs/heads/master" = "$(git symbolic-ref HEAD)" &&
	git checkout world -- &&
	test "refs/heads/world" = "$(git symbolic-ref HEAD)"
ok 3 - branch switching

expecting success: 
	echo bye > world &&
	git checkout -- world &&
	git diff --exit-code --quiet

ok 4 - checkout world from the index

expecting success: 
	git checkout all

ok 5 - non ambiguous call

expecting success: 
	git checkout world &&
	test "refs/heads/world" = "$(git symbolic-ref HEAD)"
ok 6 - allow the most common case
expecting success: 
	test_must_fail git checkout world all
ok 7 - check ambiguity
expecting success: 
	echo bye > world &&
	git checkout world -- world &&
	git diff --exit-code --quiet

ok 8 - disambiguate checking out from a tree-ish
# passed all 8 test(s)
1..8
