ok 1 - set up basic repo
ok 2 - correct file objects
not ok - 3 correct relative file objects (0)
#	
#		git rev-parse :file.txt >expected &&
#		git rev-parse :./file.txt >result &&
#		test_cmp expected result &&
#		git rev-parse :0:./file.txt >result &&
#		test_cmp expected result
#	
not ok - 4 correct relative file objects (1)
#	
#		git rev-parse HEAD:file.txt >expected &&
#		git rev-parse HEAD:./file.txt >result &&
#		test_cmp expected result
#	
not ok - 5 correct relative file objects (2)
#	
#		(
#			cd subdir &&
#			git rev-parse HEAD:../file.txt >result &&
#			test_cmp ../expected result
#		)
#	
not ok - 6 correct relative file objects (3)
#	
#		(
#			cd subdir &&
#			git rev-parse HEAD:../subdir/../file.txt >result &&
#			test_cmp ../expected result
#		)
#	
not ok - 7 correct relative file objects (4)
#	
#		git rev-parse HEAD:subdir/file.txt >expected &&
#		(
#			cd subdir &&
#			git rev-parse HEAD:./file.txt >result &&
#			test_cmp ../expected result
#		)
#	
not ok - 8 correct relative file objects (5)
#	
#		git rev-parse :subdir/file.txt >expected &&
#		(
#			cd subdir &&
#			git rev-parse :./file.txt >result &&
#			test_cmp ../expected result &&
#			git rev-parse :0:./file.txt >result &&
#			test_cmp ../expected result
#		)
#	
not ok - 9 correct relative file objects (6)
#	
#		git rev-parse :file.txt >expected &&
#		(
#			cd subdir &&
#			git rev-parse :../file.txt >result &&
#			test_cmp ../expected result &&
#			git rev-parse :0:../file.txt >result &&
#			test_cmp ../expected result
#		)
#	
ok 10 - incorrect revision id
ok 11 - incorrect file in sha1:path
ok 12 - incorrect file in :path and :N:path
ok 13 - invalid @{n} reference
not ok - 14 relative path not found
#	
#		(
#			cd subdir &&
#			test_must_fail git rev-parse HEAD:./nonexistent.txt 2>error &&
#			grep subdir/nonexistent.txt error
#		)
#	
not ok - 15 relative path outside worktree
#	
#		test_must_fail git rev-parse HEAD:../file.txt >output 2>error &&
#		test -z "$(cat output)" &&
#		grep "outside repository" error
#	
not ok - 16 relative path when cwd is outside worktree
#	
#		test_must_fail git --git-dir=.git --work-tree=subdir rev-parse HEAD:./file.txt >output 2>error &&
#		test -z "$(cat output)" &&
#		grep "relative path syntax can.t be used outside working tree." error
#	
not ok - 17 relative path when startup_info is NULL
#	
#		test_must_fail test-match-trees HEAD:./file.txt HEAD:./file.txt 2>error &&
#		grep "BUG: startup_info struct is not initialized." error
#	
# failed 11 among 17 test(s)
1..17
