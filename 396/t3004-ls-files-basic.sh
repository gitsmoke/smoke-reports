Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3004-ls-files-basic/.git/
expecting success: 
	git ls-files >actual &&
	test_cmp empty actual

ok 1 - ls-files in empty repository
expecting success: 
	git ls-files doesnotexist >actual &&
	test_cmp empty actual

ok 2 - ls-files with nonexistent path

expecting success: 
	test_expect_code 129 git ls-files --nonsense 2>actual &&
	grep "[Uu]sage: git ls-files" actual
usage: git ls-files [options] [<file>...]

ok 3 - ls-files with nonsense option

expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		>.git/index &&
		test_expect_code 129 git ls-files -h >usage 2>&1
	) &&
	grep "[Uu]sage: git ls-files " broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3004-ls-files-basic/broken/.git/
usage: git ls-files [options] [<file>...]
ok 4 - ls-files -h in corrupt repository

# passed all 4 test(s)
1..4
