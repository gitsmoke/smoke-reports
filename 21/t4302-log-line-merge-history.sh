ok 1 - Add path0 and commit.
ok 2 - Change path0 in master.
ok 3 - Make a new branch from the base commit
ok 4 - Change path0 in feature.
ok 5 - Merge the master to feature
ok 6 - Resolve the conflict
ok 7 - Show the line level log of path0
ok 8 - Show the line log of the 2 line of path0 with graph
not ok - 9 validate the output.
#	test_cmp current expected
not ok - 10 validate the graph output.
#	test_cmp current-graph expected-graph
# failed 2 among 10 test(s)
1..10
