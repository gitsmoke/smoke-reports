Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6500-gc/.git/
expecting success: 
	git gc
Nothing new to pack.

ok 1 - gc empty repository

expecting success: 
	test_expect_code 129 git gc --nonsense 2>err &&
	grep "[Uu]sage: git gc" err
usage: git gc [options]

ok 2 - gc --gobbledegook
expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		echo "[gc] pruneexpire = CORRUPT" >>.git/config &&
		test_expect_code 129 git gc -h >usage 2>&1
	) &&
	grep "[Uu]sage" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6500-gc/broken/.git/
usage: git gc [options]

ok 3 - gc -h with invalid configuration

# passed all 3 test(s)
1..3
