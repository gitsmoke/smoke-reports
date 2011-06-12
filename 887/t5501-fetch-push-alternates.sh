ok 1 - setup
not ok - 2 pushing into a repository with the same alternate
#	
#		(
#			cd one &&
#			git push ../receiver master:refs/heads/it
#		) &&
#		(
#			cd receiver &&
#			count_objects >../receiver.count
#		) &&
#		test_cmp one.count receiver.count
#	
ok 3 - fetching from a repository with the same alternate
# failed 1 among 3 test(s)
1..3
