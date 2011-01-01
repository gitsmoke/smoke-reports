Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
fbe6e6544c0bb26819b0f341c235c452023c89f1
ok 1 - start is valid
expecting success: test fbe6e6544c0bb26819b0f341c235c452023c89f1 = fbe6e6544c0bb26819b0f341c235c452023c89f1

ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test fbe6e6544c0bb26819b0f341c235c452023c89f1 = fbe6e6544c0bb26819b0f341c235c452023c89f1

ok 4 - second^1 = second^
expecting success: test fbe6e6544c0bb26819b0f341c235c452023c89f1 = fbe6e6544c0bb26819b0f341c235c452023c89f1
ok 5 - final^1^1^1
expecting success: test fbe6e6544c0bb26819b0f341c235c452023c89f1 = fbe6e6544c0bb26819b0f341c235c452023c89f1
ok 6 - final^1^1^1 = final^^^
expecting success: test 58ad95aebd31b5d914379b8158741d4575935e46 = 58ad95aebd31b5d914379b8158741d4575935e46
ok 7 - final^1^2
expecting success: test 58ad95aebd31b5d914379b8158741d4575935e46 != 7ff50dfe3f25e9814c045749c9be93b99cb71eeb
ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
58ad95aebd31b5d914379b8158741d4575935e46
ok 11 - --verify start2^0
expecting success: test "7ff50dfe3f25e9814c045749c9be93b99cb71eeb
58ad95aebd31b5d914379b8158741d4575935e46" = "7ff50dfe3f25e9814c045749c9be93b99cb71eeb
58ad95aebd31b5d914379b8158741d4575935e46"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "41d68aeaadad364b56854431f86dab7d8bb9976a
^7ff50dfe3f25e9814c045749c9be93b99cb71eeb
^58ad95aebd31b5d914379b8158741d4575935e46" = "41d68aeaadad364b56854431f86dab7d8bb9976a
^7ff50dfe3f25e9814c045749c9be93b99cb71eeb
^58ad95aebd31b5d914379b8158741d4575935e46"
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
fbe6e6544c0bb26819b0f341c235c452023c89f1
fbe6e6544c0bb26819b0f341c235c452023c89f
fbe6e6544c0bb26819b0f341c235c452023c89f1
ok 15 - short SHA-1 works
# passed all 15 test(s)
1..15
