ok 1 - setup
ok 2 - apply --whitespace=strip
ok 3 - apply --whitespace=strip from config
not ok - 4 apply --whitespace=strip in subdir
#	
#	
#		cd "$D" &&
#		git config --unset-all apply.whitespace
#		rm -f sub/file1 &&
#		cp saved sub/file1 &&
#		git update-index --refresh &&
#	
#		cd sub &&
#		git apply --whitespace=strip ../patch.file &&
#		check_result file1
#	
not ok - 5 apply --whitespace=strip from config in subdir
#	
#	
#		cd "$D" &&
#		git config apply.whitespace strip &&
#		rm -f sub/file1 &&
#		cp saved sub/file1 &&
#		git update-index --refresh &&
#	
#		cd sub &&
#		git apply ../patch.file &&
#		check_result file1
#	
not ok - 6 same in subdir but with traditional patch input
#	
#	
#		cd "$D" &&
#		git config apply.whitespace strip &&
#		rm -f sub/file1 &&
#		cp saved sub/file1 &&
#		git update-index --refresh &&
#	
#		cd sub &&
#		git apply ../gpatch.file &&
#		check_result file1
#	
not ok - 7 same but with traditional patch input of depth 1
#	
#	
#		cd "$D" &&
#		git config apply.whitespace strip &&
#		rm -f sub/file1 &&
#		cp saved sub/file1 &&
#		git update-index --refresh &&
#	
#		cd sub &&
#		git apply ../gpatch-sub.file &&
#		check_result file1
#	
not ok - 8 same but with traditional patch input of depth 2
#	
#	
#		cd "$D" &&
#		git config apply.whitespace strip &&
#		rm -f sub/file1 &&
#		cp saved sub/file1 &&
#		git update-index --refresh &&
#	
#		cd sub &&
#		git apply ../gpatch-ab-sub.file &&
#		check_result file1
#	
ok 9 - same but with traditional patch input of depth 1
ok 10 - same but with traditional patch input of depth 2
# failed 5 among 10 test(s)
1..10
