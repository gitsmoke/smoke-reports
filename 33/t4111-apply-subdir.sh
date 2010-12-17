ok 1 - setup
ok 2 - setup: subdir
not ok - 3 apply from subdir of toplevel
#	
#		cp postimage expected &&
#		reset_subdir other preimage &&
#		(
#			cd sub/dir &&
#			git apply "$patch"
#		) &&
#		test_cmp expected sub/dir/file
#	
not ok - 4 apply --cached from subdir of toplevel
#	
#		cp postimage expected &&
#		cp other expected.working &&
#		reset_subdir preimage other &&
#		(
#			cd sub/dir &&
#			git apply --cached "$patch"
#		) &&
#		git show :sub/dir/file >actual &&
#		test_cmp expected actual &&
#		test_cmp expected.working sub/dir/file
#	
not ok - 5 apply --index from subdir of toplevel
#	
#		cp postimage expected &&
#		reset_subdir preimage other &&
#		(
#			cd sub/dir &&
#			test_must_fail git apply --index "$patch"
#		) &&
#		reset_subdir other preimage &&
#		(
#			cd sub/dir &&
#			test_must_fail git apply --index "$patch"
#		) &&
#		reset_subdir preimage preimage &&
#		(
#			cd sub/dir &&
#			git apply --index "$patch"
#		) &&
#		git show :sub/dir/file >actual &&
#		test_cmp expected actual &&
#		test_cmp expected sub/dir/file
#	
ok 6 - apply from .git dir
ok 7 - apply from subdir of .git dir
ok 8 - apply --cached from .git dir
ok 9 - apply --cached from subdir of .git dir
# failed 3 among 9 test(s)
1..9
