Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
388177f48d483c9813f31ac08496cd74e30739d8
ok 1 - start is valid
expecting success: test 388177f48d483c9813f31ac08496cd74e30739d8 = 388177f48d483c9813f31ac08496cd74e30739d8

ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test 388177f48d483c9813f31ac08496cd74e30739d8 = 388177f48d483c9813f31ac08496cd74e30739d8

ok 4 - second^1 = second^
expecting success: test 388177f48d483c9813f31ac08496cd74e30739d8 = 388177f48d483c9813f31ac08496cd74e30739d8

ok 5 - final^1^1^1
expecting success: test 388177f48d483c9813f31ac08496cd74e30739d8 = 388177f48d483c9813f31ac08496cd74e30739d8

ok 6 - final^1^1^1 = final^^^
expecting success: test 5781d1f1354146780b98d8c2c86f20a186d35fce = 5781d1f1354146780b98d8c2c86f20a186d35fce

ok 7 - final^1^2
expecting success: test 5781d1f1354146780b98d8c2c86f20a186d35fce != b91fdd7e74c42b1b4ac01d85ed9443a0960c14f7

ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
5781d1f1354146780b98d8c2c86f20a186d35fce
ok 11 - --verify start2^0
expecting success: test "b91fdd7e74c42b1b4ac01d85ed9443a0960c14f7
5781d1f1354146780b98d8c2c86f20a186d35fce" = "b91fdd7e74c42b1b4ac01d85ed9443a0960c14f7
5781d1f1354146780b98d8c2c86f20a186d35fce"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "2860b3e41c9a2352bff572094648672c541e6424
^b91fdd7e74c42b1b4ac01d85ed9443a0960c14f7
^5781d1f1354146780b98d8c2c86f20a186d35fce" = "2860b3e41c9a2352bff572094648672c541e6424
^b91fdd7e74c42b1b4ac01d85ed9443a0960c14f7
^5781d1f1354146780b98d8c2c86f20a186d35fce"

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
388177f48d483c9813f31ac08496cd74e30739d8
388177f48d483c9813f31ac08496cd74e30739d
388177f48d483c9813f31ac08496cd74e30739d8
ok 15 - short SHA-1 works
# passed all 15 test(s)
1..15
