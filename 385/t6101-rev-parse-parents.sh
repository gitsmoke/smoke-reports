Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
0130a43c150f4bc04450f90043e5261467fa4d94

ok 1 - start is valid

expecting success: test 0130a43c150f4bc04450f90043e5261467fa4d94 = 0130a43c150f4bc04450f90043e5261467fa4d94

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test 0130a43c150f4bc04450f90043e5261467fa4d94 = 0130a43c150f4bc04450f90043e5261467fa4d94

ok 4 - second^1 = second^
expecting success: test 0130a43c150f4bc04450f90043e5261467fa4d94 = 0130a43c150f4bc04450f90043e5261467fa4d94

ok 5 - final^1^1^1
expecting success: test 0130a43c150f4bc04450f90043e5261467fa4d94 = 0130a43c150f4bc04450f90043e5261467fa4d94

ok 6 - final^1^1^1 = final^^^
expecting success: test 3067714e2c5928945eb0a71b9f952c6f47e2403e = 3067714e2c5928945eb0a71b9f952c6f47e2403e

ok 7 - final^1^2
expecting success: test 3067714e2c5928945eb0a71b9f952c6f47e2403e != 20c6ad1828cd6e9c5ddcddf0d36a8ef8b4979020
ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
3067714e2c5928945eb0a71b9f952c6f47e2403e
ok 11 - --verify start2^0
expecting success: test "20c6ad1828cd6e9c5ddcddf0d36a8ef8b4979020
3067714e2c5928945eb0a71b9f952c6f47e2403e" = "20c6ad1828cd6e9c5ddcddf0d36a8ef8b4979020
3067714e2c5928945eb0a71b9f952c6f47e2403e"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "6d6598b65a81c1eddfc9b7e3f76f118511402538
^20c6ad1828cd6e9c5ddcddf0d36a8ef8b4979020
^3067714e2c5928945eb0a71b9f952c6f47e2403e" = "6d6598b65a81c1eddfc9b7e3f76f118511402538
^20c6ad1828cd6e9c5ddcddf0d36a8ef8b4979020
^3067714e2c5928945eb0a71b9f952c6f47e2403e"

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
0130a43c150f4bc04450f90043e5261467fa4d94
0130a43c150f4bc04450f90043e5261467fa4d9
0130a43c150f4bc04450f90043e5261467fa4d94

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
