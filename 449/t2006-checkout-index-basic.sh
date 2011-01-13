Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2006-checkout-index-basic/.git/
expecting success: 
	test_expect_code 129 git checkout-index --gobbledegook 2>err &&
	grep "[Uu]sage" err
usage: git checkout-index [options] [--] [<file>...]
ok 1 - checkout-index --gobbledegook
expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		>.git/index &&
		test_expect_code 129 git checkout-index -h >usage 2>&1
	) &&
	grep "[Uu]sage" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2006-checkout-index-basic/broken/.git/
usage: git checkout-index [options] [--] [<file>...]
ok 2 - checkout-index -h in broken repository
# passed all 2 test(s)
1..2
