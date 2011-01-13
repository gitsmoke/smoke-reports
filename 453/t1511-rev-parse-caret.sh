ok 1 - setup
ok 2 - ref^{non-existent}
ok 3 - ref^{}
ok 4 - ref^{commit}
ok 5 - ref^{tree}
not ok - 6 ref^{/.}
#	
#		git rev-parse master >expected &&
#		git rev-parse master^{/.} >actual &&
#		test_cmp expected actual
#	
ok 7 - ref^{/non-existent}
not ok - 8 ref^{/Initial}
#	
#		git rev-parse ref >expected &&
#		git rev-parse master^{/Initial} >actual &&
#		test_cmp expected actual
#	
# failed 2 among 8 test(s)
1..8
