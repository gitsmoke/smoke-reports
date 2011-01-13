ok 1 - character classes (isspace, isalpha etc.)
not ok - 2 mktemp to nonexistent directory prints filename
#	
#		test_must_fail test-mktemp doesnotexist/testXXXXXX 2>err &&
#		grep "doesnotexist/test" err
#	
not ok - 3 mktemp to unwritable directory prints filename
#	
#		mkdir cannotwrite &&
#		chmod -w cannotwrite &&
#		test_when_finished "chmod +w cannotwrite" &&
#		test_must_fail test-mktemp cannotwrite/testXXXXXX 2>err &&
#		grep "cannotwrite/test" err
#	
# failed 2 among 3 test(s)
1..3
