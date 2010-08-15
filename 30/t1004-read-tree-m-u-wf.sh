ok 1 - two-way setup
ok 2 - two-way not clobbering
ok 3 - two-way with incorrect --exclude-per-directory (1)
ok 4 - two-way with incorrect --exclude-per-directory (2)
ok 5 - two-way clobbering a ignored file
ok 6 - three-way not complaining on an untracked path in both
ok 7 - three-way not clobbering a working tree file
ok 8 - three-way not complaining on an untracked file
ok 9 - 3-way not overwriting local changes (setup)
ok 10 - 3-way not overwriting local changes (our side)
ok 11 - 3-way not overwriting local changes (their side)
ok 12 - funny symlink in work tree
not ok - 13 funny symlink in work tree, un-unlink-able
#	
#	
#		rm -fr a b &&
#		git reset --hard &&
#	
#		git checkout sym-a &&
#		chmod a-w a &&
#		test_must_fail git read-tree -m -u sym-a sym-a sym-b
#	
#	
ok 14 - D/F setup
ok 15 - D/F
ok 16 - D/F resolve
ok 17 - D/F recursive
# failed 1 among 17 test(s)
1..17
