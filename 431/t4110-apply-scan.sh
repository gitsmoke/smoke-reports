Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4110-apply-scan/.git/
expecting success: 
	git apply \
		"$TEST_DIRECTORY/t4110/patch1.patch" \
		"$TEST_DIRECTORY/t4110/patch2.patch" \
		"$TEST_DIRECTORY/t4110/patch3.patch" \
		"$TEST_DIRECTORY/t4110/patch4.patch" \
		"$TEST_DIRECTORY/t4110/patch5.patch" &&
	test_cmp new.txt "$TEST_DIRECTORY/t4110/expect"

ok 1 - git apply scan

# passed all 1 test(s)
1..1
