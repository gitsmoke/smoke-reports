Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4109-apply-multifrag/.git/
expecting success: 
	git apply patch1.patch patch2.patch &&
	test_cmp "$TEST_DIRECTORY/t4109/expect-1" main.c
ok 1 - git apply (1)
expecting success: 
	git apply patch1.patch patch2.patch patch3.patch &&
	test_cmp "$TEST_DIRECTORY/t4109/expect-2" main.c
ok 2 - git apply (2)
expecting success: 
	git apply patch1.patch patch4.patch &&
	test_cmp "$TEST_DIRECTORY/t4109/expect-3" main.c
ok 3 - git apply (3)
# passed all 3 test(s)
1..3
