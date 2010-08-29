not ok - 1 rename
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 2 rename with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 3 copy
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 4 copy with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 5 rewrite
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 6 rewrite with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 7 mode
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 8 mode with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 9 non git (1)
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 10 non git (1) with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 11 non git (2)
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 12 non git (2) with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 13 non git (3)
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 14 non git (3) with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 15 incomplete (1)
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 16 incomplete (1) with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 17 incomplete (2)
#	
#			git apply --stat --summary \
#				<"$TEST_DIRECTORY/t4100/t-apply-$num.patch" >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
not ok - 18 incomplete (2) with recount
#	
#			sed -e "$UNC" <"$TEST_DIRECTORY/t4100/t-apply-$num.patch" |
#			git apply --recount --stat --summary >current &&
#			test_cmp "$TEST_DIRECTORY"/t4100/t-apply-$num.expect current
#		
# failed 18 among 18 test(s)
1..18
