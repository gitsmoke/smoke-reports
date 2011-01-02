Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb
ok 1 - start is valid
expecting success: test f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb = f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb

ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb = f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb

ok 4 - second^1 = second^
expecting success: test f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb = f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb

ok 5 - final^1^1^1

expecting success: test f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb = f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb

ok 6 - final^1^1^1 = final^^^

expecting success: test 0727a000fab4445e5ef64a1efa20cc4298d19a80 = 0727a000fab4445e5ef64a1efa20cc4298d19a80

ok 7 - final^1^2

expecting success: test 0727a000fab4445e5ef64a1efa20cc4298d19a80 != 82a541665871a10e91a1c1ce4d4390c17192be3b

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
0727a000fab4445e5ef64a1efa20cc4298d19a80

ok 11 - --verify start2^0

expecting success: test "82a541665871a10e91a1c1ce4d4390c17192be3b
0727a000fab4445e5ef64a1efa20cc4298d19a80" = "82a541665871a10e91a1c1ce4d4390c17192be3b
0727a000fab4445e5ef64a1efa20cc4298d19a80"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "ee1d82472afa2861a8311e13a513d1412c148036
^82a541665871a10e91a1c1ce4d4390c17192be3b
^0727a000fab4445e5ef64a1efa20cc4298d19a80" = "ee1d82472afa2861a8311e13a513d1412c148036
^82a541665871a10e91a1c1ce4d4390c17192be3b
^0727a000fab4445e5ef64a1efa20cc4298d19a80"

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
f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb
f1ba9f28f0b94aef759bb5096fdfc2e6ea011cb
f1ba9f28f0b94aef759bb5096fdfc2e6ea011cbb

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
