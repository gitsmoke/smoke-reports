Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
15e8c339a4e1fa12a0fd481062918a137d4989a5

ok 1 - start is valid

expecting success: test 15e8c339a4e1fa12a0fd481062918a137d4989a5 = 15e8c339a4e1fa12a0fd481062918a137d4989a5

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test 15e8c339a4e1fa12a0fd481062918a137d4989a5 = 15e8c339a4e1fa12a0fd481062918a137d4989a5

ok 4 - second^1 = second^
expecting success: test 15e8c339a4e1fa12a0fd481062918a137d4989a5 = 15e8c339a4e1fa12a0fd481062918a137d4989a5
ok 5 - final^1^1^1
expecting success: test 15e8c339a4e1fa12a0fd481062918a137d4989a5 = 15e8c339a4e1fa12a0fd481062918a137d4989a5
ok 6 - final^1^1^1 = final^^^
expecting success: test 07c167bb671ef55be4973c060654fceeef0e2915 = 07c167bb671ef55be4973c060654fceeef0e2915
ok 7 - final^1^2
expecting success: test 07c167bb671ef55be4973c060654fceeef0e2915 != ac4d02b7519b0e0c1396429c282e43c316b7cdae

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
07c167bb671ef55be4973c060654fceeef0e2915
ok 11 - --verify start2^0
expecting success: test "ac4d02b7519b0e0c1396429c282e43c316b7cdae
07c167bb671ef55be4973c060654fceeef0e2915" = "ac4d02b7519b0e0c1396429c282e43c316b7cdae
07c167bb671ef55be4973c060654fceeef0e2915"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "2d4592cb00bbefefcdc3e984b24754824f3a47ab
^ac4d02b7519b0e0c1396429c282e43c316b7cdae
^07c167bb671ef55be4973c060654fceeef0e2915" = "2d4592cb00bbefefcdc3e984b24754824f3a47ab
^ac4d02b7519b0e0c1396429c282e43c316b7cdae
^07c167bb671ef55be4973c060654fceeef0e2915"

ok 13 - final^1^! = final^1 ^final^1^1 ^final^1^2

expecting success: git repack -a -d

ok 14 - repack for next test

expecting success: 
	start=`git rev-parse --verify start` &&
	echo $start &&
	abbrv=`echo $start | sed s/.\$//` &&
	echo $abbrv &&
	abbrv=`git rev-parse --verify $abbrv` &&
	echo $abbrv &&
	test $start = $abbrv
15e8c339a4e1fa12a0fd481062918a137d4989a5
15e8c339a4e1fa12a0fd481062918a137d4989a
15e8c339a4e1fa12a0fd481062918a137d4989a5

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
