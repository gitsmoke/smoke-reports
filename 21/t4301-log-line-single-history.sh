ok 1 - add path0/path1 and commit.
ok 2 - Change the 2,3 lines of path0 and path1.
ok 3 - Change the 5th line of path0.
ok 4 - Final change of path0.
ok 5 - Show the line level log of path0
not ok - 6 validate the path0 output.
#	
#	    test_cmp current-path0 expected-path0
#	
ok 7 - Show the line level log of path1
ok 8 - validate the path1 output.
ok 9 - Show the line level log of two files
not ok - 10 validate the all path output.
#	
#	    test_cmp current-pathall expected-pathall
#	
ok 11 - Test the line number argument
ok 12 - validate the line number output.
ok 13 - Test the --full-line-diff option
not ok - 14 validate the --full-line-diff output.
#	
#	    test_cmp current-always expected-always
#	
ok 15 - Show the line level log of path0 with --graph
ok 16 - Show the line level log of path1 with --graph
ok 17 - Show the line level log of two files with --graph
ok 18 - Test the line number argument with --graph
ok 19 - Test the --full-line-diff option with --graph option
not ok - 20 validate the path0 output.
#	test_cmp current-path0-graph expected-path0-graph
not ok - 21 validate the path1 output.
#	test_cmp current-path1-graph expected-path1-graph
not ok - 22 validate the all path output.
#	test_cmp current-pathall-graph expected-pathall-graph
not ok - 23 validate graph output
#	test_cmp current-linenum-graph expected-linenum-graph
not ok - 24 validate --full-line-diff output
#	test_cmp current-always-graph expected-always-graph
# failed 8 among 24 test(s)
1..24
