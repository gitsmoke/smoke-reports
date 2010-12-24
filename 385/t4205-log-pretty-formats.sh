Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4205-log-pretty-formats/.git/
expecting success: 
	>foo &&
	>bar &&
	git add foo &&
	test_tick &&
	git commit -m initial &&
	git add bar &&
	test_tick &&
	git commit -m "add bar"
[master (root-commit) af20c06] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 1711bf9] add bar
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bar

ok 1 - set up basic repos

expecting success: 
	git log --pretty=oneline >expected &&
	git config pretty.test-alias oneline &&
	git log --pretty=test-alias >actual &&
	test_cmp expected actual

ok 2 - alias builtin format

expecting success: 
	git log --pretty=oneline >expected &&
	git config pretty.oneline "%H" &&
	git log --pretty=oneline >actual &&
	test_cmp expected actual


ok 3 - alias masking builtin format

expecting success: 
	git log --pretty="format:%h" >expected &&
	git config pretty.test-alias "format:%h" &&
	git log --pretty=test-alias >actual &&
	test_cmp expected actual


ok 4 - alias user-defined format

expecting success: 
	git log --pretty="tformat:%h" >expected &&
	git config pretty.test-alias "tformat:%h" &&
	git log --pretty=test-alias >actual &&
	test_cmp expected actual


ok 5 - alias user-defined tformat

expecting success: 
	git config pretty.test-alias format-that-will-never-exist &&
	test_must_fail git log --pretty=test-alias


ok 6 - alias non-existant format

expecting success: 
	git log --pretty="tformat:%h" >expected &&
	git config pretty.test-foo "tformat:%h" &&
	git config pretty.test-bar test-foo &&
	git log --pretty=test-bar >actual && test_cmp expected actual
ok 7 - alias of an alias

expecting success: 
	git log --pretty=format:"Two %H" >expected &&
	git config pretty.duplicate "format:One %H" &&
	git config --add pretty.duplicate "format:Two %H" &&
	git log --pretty=duplicate >actual &&
	test_cmp expected actual

ok 8 - alias masking an alias

expecting success: 
	git config pretty.test-foo test-bar &&
	git config pretty.test-bar test-foo &&
	test_must_fail git log --pretty=test-foo

ok 9 - alias loop

# passed all 9 test(s)
1..9
