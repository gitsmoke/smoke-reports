Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4100-apply-stat/.git/
expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 1 - rename
expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 2 - rename with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 3 - copy

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 4 - copy with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 5 - rewrite

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 6 - rewrite with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 7 - mode

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 8 - mode with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 9 - non git (1)

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 10 - non git (1) with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 11 - non git (2)

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 12 - non git (2) with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 13 - non git (3)

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 14 - non git (3) with recount
expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 15 - incomplete (1)

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 16 - incomplete (1) with recount

expecting success: 
		git apply --stat --summary \
			<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 17 - incomplete (2)

expecting success: 
		sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
		git apply --recount --stat --summary >current &&
		test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
	

ok 18 - incomplete (2) with recount

# passed all 18 test(s)
1..18
