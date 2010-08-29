not ok - 1 git apply (1)
#	
#		git apply patch1.patch patch2.patch &&
#		test_cmp "$TEST_DIRECTORY/t4109/expect-1" main.c
#	
not ok - 2 git apply (2)
#	
#		git apply patch1.patch patch2.patch patch3.patch &&
#		test_cmp "$TEST_DIRECTORY/t4109/expect-2" main.c
#	
not ok - 3 git apply (3)
#	
#		git apply patch1.patch patch4.patch &&
#		test_cmp "$TEST_DIRECTORY/t4109/expect-3" main.c
#	
# failed 3 among 3 test(s)
1..3
