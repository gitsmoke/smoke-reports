ok 1 - setup
ok 2 - setup: subdir
ok 3 - apply from subdir of toplevel
ok 4 - apply --cached from subdir of toplevel
ok 5 - apply --index from subdir of toplevel
ok 6 - apply from .git dir
not ok - 7 apply from subdir of .git dir
#	
#		cp postimage expected &&
#		cp preimage .git/file &&
#		cp preimage .git/objects/file
#		(
#			cd .git/objects &&
#			git apply "$patch"
#		) &&
#		test_cmp expected .git/objects/file
#	
ok 8 - apply --cached from .git dir
ok 9 - apply --cached from subdir of .git dir
# failed 1 among 9 test(s)
1..9
