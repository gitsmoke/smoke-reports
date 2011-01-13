ok 1 - setup ambiguous refs
ok 2 - checkout ambiguous ref succeeds
ok 3 - checkout produces ambiguity warning
not ok - 4 checkout chooses branch over tag
#	
#		echo refs/heads/ambiguity >expect &&
#		git symbolic-ref HEAD >actual &&
#		test_cmp expect actual &&
#		echo branch >expect &&
#		test_cmp expect file
#	
ok 5 - checkout reports switch to branch
not ok - 6 checkout vague ref succeeds
#	
#		git checkout vagueness >stdout 2>stderr &&
#		test_set_prereq VAGUENESS_SUCCESS
#	
ok 7 # skip checkout produces ambiguity warning (missing VAGUENESS_SUCCESS)
ok 8 # skip checkout chooses branch over tag (missing VAGUENESS_SUCCESS)
ok 9 # skip checkout reports switch to branch (missing VAGUENESS_SUCCESS)
# failed 2 among 9 test(s)
1..9
