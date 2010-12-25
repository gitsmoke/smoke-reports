Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
ab7f45e782027afcac92b1ccaf53fc60feef4592

ok 1 - start is valid

expecting success: test ab7f45e782027afcac92b1ccaf53fc60feef4592 = ab7f45e782027afcac92b1ccaf53fc60feef4592

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test ab7f45e782027afcac92b1ccaf53fc60feef4592 = ab7f45e782027afcac92b1ccaf53fc60feef4592

ok 4 - second^1 = second^
expecting success: test ab7f45e782027afcac92b1ccaf53fc60feef4592 = ab7f45e782027afcac92b1ccaf53fc60feef4592

ok 5 - final^1^1^1
expecting success: test ab7f45e782027afcac92b1ccaf53fc60feef4592 = ab7f45e782027afcac92b1ccaf53fc60feef4592

ok 6 - final^1^1^1 = final^^^
expecting success: test d1025dd5e20efece2daa13fb3491c3076006679c = d1025dd5e20efece2daa13fb3491c3076006679c

ok 7 - final^1^2

expecting success: test d1025dd5e20efece2daa13fb3491c3076006679c != 388f9bb56226630197e2b455fdc2972cf4154e4f

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
d1025dd5e20efece2daa13fb3491c3076006679c

ok 11 - --verify start2^0
expecting success: test "388f9bb56226630197e2b455fdc2972cf4154e4f
d1025dd5e20efece2daa13fb3491c3076006679c" = "388f9bb56226630197e2b455fdc2972cf4154e4f
d1025dd5e20efece2daa13fb3491c3076006679c"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "49a989e3cf160ba6845cf1c9b13d40f850f35725
^388f9bb56226630197e2b455fdc2972cf4154e4f
^d1025dd5e20efece2daa13fb3491c3076006679c" = "49a989e3cf160ba6845cf1c9b13d40f850f35725
^388f9bb56226630197e2b455fdc2972cf4154e4f
^d1025dd5e20efece2daa13fb3491c3076006679c"
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
ab7f45e782027afcac92b1ccaf53fc60feef4592
ab7f45e782027afcac92b1ccaf53fc60feef459
ab7f45e782027afcac92b1ccaf53fc60feef4592
ok 15 - short SHA-1 works
# passed all 15 test(s)
1..15
