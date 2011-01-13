Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4032-diff-inter-hunk-context/.git/
expecting success: 
		test        2 = 2
	

ok 1 - diff -U0, 1 common line: count hunks (2)

expecting success: 
		git diff -U0 f1 | grep -v '^index ' >actual &&
		test_cmp expected.f1.0.2 actual
	

ok 2 - diff -U0, 1 common line: check output
expecting success: 
		test        2 = 2
	

ok 3 - diff -U0 --inter-hunk-context=0, 1 common line: count hunks (2)
expecting success: 
		git diff -U0 --inter-hunk-context=0 f1 | grep -v '^index ' >actual &&
		test_cmp expected.f1.0.2 actual
	

ok 4 - diff -U0 --inter-hunk-context=0, 1 common line: check output
expecting success: 
		test        1 = 1
	
ok 5 - diff -U0 --inter-hunk-context=1, 1 common line: count hunks (1)
expecting success: 
		git diff -U0 --inter-hunk-context=1 f1 | grep -v '^index ' >actual &&
		test_cmp expected.f1.0.1 actual
	

ok 6 - diff -U0 --inter-hunk-context=1, 1 common line: check output
expecting success: 
		test        1 = 1
	
ok 7 - diff -U0 --inter-hunk-context=2, 1 common line: count hunks (1)
expecting success: 
		git diff -U0 --inter-hunk-context=2 f1 | grep -v '^index ' >actual &&
		test_cmp expected.f1.0.1 actual
	

ok 8 - diff -U0 --inter-hunk-context=2, 1 common line: check output
expecting success: 
		test        1 = 1
	

ok 9 - diff -U1, 1 common line: count hunks (1)
expecting success: 
		test        2 = 2
	

ok 10 - diff -U0, 2 common lines: count hunks (2)
expecting success: 
		test        2 = 2
	

ok 11 - diff -U0 --inter-hunk-context=0, 2 common lines: count hunks (2)
expecting success: 
		test        2 = 2
	

ok 12 - diff -U0 --inter-hunk-context=1, 2 common lines: count hunks (2)
expecting success: 
		test        1 = 1
	

ok 13 - diff -U0 --inter-hunk-context=2, 2 common lines: count hunks (1)
expecting success: 
		test        1 = 1
	

ok 14 - diff -U1, 2 common lines: count hunks (1)
expecting success: 
		test        2 = 2
	

ok 15 - diff -U1, 3 common lines: count hunks (2)
expecting success: 
		test        2 = 2
	

ok 16 - diff -U1 --inter-hunk-context=0, 3 common lines: count hunks (2)
expecting success: 
		test        1 = 1
	

ok 17 - diff -U1 --inter-hunk-context=1, 3 common lines: count hunks (1)
expecting success: 
		test        1 = 1
	

ok 18 - diff -U1 --inter-hunk-context=2, 3 common lines: count hunks (1)
expecting success: 
		test        2 = 2
	

ok 19 - diff -U3, 9 common lines: count hunks (2)
expecting success: 
		test        2 = 2
	

ok 20 - diff -U3 --inter-hunk-context=2, 9 common lines: count hunks (2)
expecting success: 
		test        1 = 1
	

ok 21 - diff -U3 --inter-hunk-context=3, 9 common lines: count hunks (1)

# passed all 21 test(s)
1..21
