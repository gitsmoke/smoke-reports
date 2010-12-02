ok 1 - set up basic repo
ok 2 - correct file objects
ok 3 - correct relative file objects (0)
ok 4 - correct relative file objects (1)
ok 5 - correct relative file objects (2)
ok 6 - correct relative file objects (3)
ok 7 - correct relative file objects (4)
ok 8 - incorrect revision id
ok 9 - incorrect file in sha1:path
ok 10 - incorrect file in :path and :N:path
ok 11 - invalid @{n} reference
ok 12 - relative path not found
ok 13 - relative path outside worktree
ok 14 - relative path when cwd is outside worktree
not ok - 15 relative path when startup_info is NULL
#	
#		test_must_fail test-match-trees HEAD:./file.txt HEAD:./file.txt 2>error &&
#		grep "Relative path syntax is not supported in this command" error
#	
# failed 1 among 15 test(s)
1..15
