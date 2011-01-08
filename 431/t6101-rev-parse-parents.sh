Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 1 - start is valid

expecting success: test dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b = dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b = dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 4 - second^1 = second^

expecting success: test dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b = dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 5 - final^1^1^1

expecting success: test dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b = dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 6 - final^1^1^1 = final^^^

expecting success: test 367636fd751389e3f35392bbe0d37720cbc7b29c = 367636fd751389e3f35392bbe0d37720cbc7b29c

ok 7 - final^1^2

expecting success: test 367636fd751389e3f35392bbe0d37720cbc7b29c != 3f1a63f935f81c9f73af7f78d6808736f30e3d5c

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
367636fd751389e3f35392bbe0d37720cbc7b29c

ok 11 - --verify start2^0

expecting success: test "3f1a63f935f81c9f73af7f78d6808736f30e3d5c
367636fd751389e3f35392bbe0d37720cbc7b29c" = "3f1a63f935f81c9f73af7f78d6808736f30e3d5c
367636fd751389e3f35392bbe0d37720cbc7b29c"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "5bb1a7bb01a739c11de7eb69a79222db8281c1a2
^3f1a63f935f81c9f73af7f78d6808736f30e3d5c
^367636fd751389e3f35392bbe0d37720cbc7b29c" = "5bb1a7bb01a739c11de7eb69a79222db8281c1a2
^3f1a63f935f81c9f73af7f78d6808736f30e3d5c
^367636fd751389e3f35392bbe0d37720cbc7b29c"

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
dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b
dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1
dd81cb1ea20ee66ffcbf1b0cadddbef3d9605e1b

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
