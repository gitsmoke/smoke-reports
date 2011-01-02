Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4033-diff-patience/.git/
expecting success: 

	test_must_fail git diff --no-index --patience file1 file2 > output &&
	test_cmp expect output

ok 1 - patience diff

expecting success: 

	mv file2 expect &&
	git apply < output &&
	test_cmp expect file2

ok 2 - patience diff output is valid
expecting success: 

	test_must_fail git diff --no-index --patience uniq1 uniq2 > output &&
	test_cmp expect output

ok 3 - completely different files
# passed all 3 test(s)
1..3
