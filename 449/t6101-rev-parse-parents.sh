Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
ad468efa39edfe754b5c0e736ad2d10943e7f3d3
ok 1 - start is valid
expecting success: test ad468efa39edfe754b5c0e736ad2d10943e7f3d3 = ad468efa39edfe754b5c0e736ad2d10943e7f3d3

ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test ad468efa39edfe754b5c0e736ad2d10943e7f3d3 = ad468efa39edfe754b5c0e736ad2d10943e7f3d3
ok 4 - second^1 = second^
expecting success: test ad468efa39edfe754b5c0e736ad2d10943e7f3d3 = ad468efa39edfe754b5c0e736ad2d10943e7f3d3

ok 5 - final^1^1^1
expecting success: test ad468efa39edfe754b5c0e736ad2d10943e7f3d3 = ad468efa39edfe754b5c0e736ad2d10943e7f3d3

ok 6 - final^1^1^1 = final^^^

expecting success: test 2ebbdca6bec9ec8f4c405d8ce8e45df340916802 = 2ebbdca6bec9ec8f4c405d8ce8e45df340916802

ok 7 - final^1^2

expecting success: test 2ebbdca6bec9ec8f4c405d8ce8e45df340916802 != b4bcc5e03829878cbd4d61dc56ddf4f0fd85e922

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
2ebbdca6bec9ec8f4c405d8ce8e45df340916802

ok 11 - --verify start2^0

expecting success: test "b4bcc5e03829878cbd4d61dc56ddf4f0fd85e922
2ebbdca6bec9ec8f4c405d8ce8e45df340916802" = "b4bcc5e03829878cbd4d61dc56ddf4f0fd85e922
2ebbdca6bec9ec8f4c405d8ce8e45df340916802"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "e93cdac2cd44073c0df700264fbe203f70df2bf6
^b4bcc5e03829878cbd4d61dc56ddf4f0fd85e922
^2ebbdca6bec9ec8f4c405d8ce8e45df340916802" = "e93cdac2cd44073c0df700264fbe203f70df2bf6
^b4bcc5e03829878cbd4d61dc56ddf4f0fd85e922
^2ebbdca6bec9ec8f4c405d8ce8e45df340916802"

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
ad468efa39edfe754b5c0e736ad2d10943e7f3d3
ad468efa39edfe754b5c0e736ad2d10943e7f3d
ad468efa39edfe754b5c0e736ad2d10943e7f3d3

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
