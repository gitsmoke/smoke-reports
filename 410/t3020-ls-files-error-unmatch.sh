Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3020-ls-files-error-unmatch/.git/
expecting success: 
	touch foo bar &&
	git update-index --add foo bar &&
	git commit -m "add foo bar"
[master (root-commit) cdce39e] add foo bar
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 foo

ok 1 - setup

expecting success: test_must_fail git ls-files --error-unmatch foo bar-does-not-match
foo

ok 2 - git ls-files --error-unmatch should fail with unmatched path.

expecting success: git ls-files --error-unmatch foo bar
bar
foo

ok 3 - git ls-files --error-unmatch should succeed eith matched paths.
# passed all 3 test(s)
1..3
