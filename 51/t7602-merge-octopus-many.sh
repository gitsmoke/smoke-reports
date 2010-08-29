ok 1 - setup
ok 2 - merge c1 with c2, c3, c4, ... c29
not ok - 3 merge output uses pretty names
#	
#		git reset --hard c1 &&
#		git merge c2 c3 c4 >actual &&
#		test_cmp actual expected
#	
not ok - 4 merge up-to-date output uses pretty names
#	
#		git merge c4 c5 >actual &&
#		test_cmp actual expected
#	
not ok - 5 merge fast-forward output uses pretty names
#	
#		git reset --hard c0 &&
#		git merge c1 c2 >actual &&
#		test_cmp actual expected
#	
# failed 3 among 5 test(s)
1..5
