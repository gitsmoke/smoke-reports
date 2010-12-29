Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4119-apply-config/.git/
expecting success: 
	mkdir sub &&
	echo A >sub/file1 &&
	cp sub/file1 saved &&
	git add sub/file1 &&
	echo "B " >sub/file1 &&
	git diff >patch.file

ok 1 - setup

expecting success: 

	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	git apply --whitespace=strip patch.file &&
	check_result sub/file1
B
Happy

ok 2 - apply --whitespace=strip

expecting success: 

	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	git config apply.whitespace strip &&
	git apply patch.file &&
	check_result sub/file1
B
Happy

ok 3 - apply --whitespace=strip from config
expecting success: 

	cd "$D" &&
	git config --unset-all apply.whitespace &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	cd sub &&
	git apply --whitespace=strip ../patch.file &&
	check_result file1
B
Happy
ok 4 - apply --whitespace=strip in subdir
expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	cd sub &&
	git apply ../patch.file &&
	check_result file1
B
Happy
ok 5 - apply --whitespace=strip from config in subdir
expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	cd sub &&
	git apply ../gpatch.file &&
	check_result file1
B
Happy

ok 6 - same in subdir but with traditional patch input

expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	cd sub &&
	git apply ../gpatch-sub.file &&
	check_result file1
B
Happy

ok 7 - same but with traditional patch input of depth 1

expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	cd sub &&
	git apply ../gpatch-ab-sub.file &&
	check_result file1

B
Happy

ok 8 - same but with traditional patch input of depth 2

expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	git apply -p0 gpatch-sub.file &&
	check_result sub/file1
B
Happy

ok 9 - same but with traditional patch input of depth 1

expecting success: 

	cd "$D" &&
	git config apply.whitespace strip &&
	rm -f sub/file1 &&
	cp saved sub/file1 &&
	git update-index --refresh &&

	git apply gpatch-ab-sub.file &&
	check_result sub/file1
B
Happy
ok 10 - same but with traditional patch input of depth 2
# passed all 10 test(s)
1..10
