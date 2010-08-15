ok 1 - setup
ok 2 - criss-cross rename
ok 3 - diff -M -B
not ok - 4 apply
#	
#		git apply diff &&
#		test_cmp file1 file1-swapped &&
#		test_cmp file2 file2-swapped
#	
ok 5 - criss-cross rename
ok 6 - diff -M -B
ok 7 - apply
# failed 1 among 7 test(s)
1..7
