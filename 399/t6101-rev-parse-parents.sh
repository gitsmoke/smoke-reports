Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
8da263e35e20318b0c456306dda42d6b237f068d

ok 1 - start is valid

expecting success: test 8da263e35e20318b0c456306dda42d6b237f068d = 8da263e35e20318b0c456306dda42d6b237f068d

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test 8da263e35e20318b0c456306dda42d6b237f068d = 8da263e35e20318b0c456306dda42d6b237f068d

ok 4 - second^1 = second^
expecting success: test 8da263e35e20318b0c456306dda42d6b237f068d = 8da263e35e20318b0c456306dda42d6b237f068d
ok 5 - final^1^1^1
expecting success: test 8da263e35e20318b0c456306dda42d6b237f068d = 8da263e35e20318b0c456306dda42d6b237f068d
ok 6 - final^1^1^1 = final^^^
expecting success: test ae06d868baeca6b3448ad7f70ec434fc4a41ce74 = ae06d868baeca6b3448ad7f70ec434fc4a41ce74

ok 7 - final^1^2
expecting success: test ae06d868baeca6b3448ad7f70ec434fc4a41ce74 != 2c53efd27e0bdc93ee76cd7c0ba7e5a9d88999e6
ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
ae06d868baeca6b3448ad7f70ec434fc4a41ce74
ok 11 - --verify start2^0
expecting success: test "2c53efd27e0bdc93ee76cd7c0ba7e5a9d88999e6
ae06d868baeca6b3448ad7f70ec434fc4a41ce74" = "2c53efd27e0bdc93ee76cd7c0ba7e5a9d88999e6
ae06d868baeca6b3448ad7f70ec434fc4a41ce74"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "b5136af89131963354ae78cc77c45591f4c102d5
^2c53efd27e0bdc93ee76cd7c0ba7e5a9d88999e6
^ae06d868baeca6b3448ad7f70ec434fc4a41ce74" = "b5136af89131963354ae78cc77c45591f4c102d5
^2c53efd27e0bdc93ee76cd7c0ba7e5a9d88999e6
^ae06d868baeca6b3448ad7f70ec434fc4a41ce74"

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
8da263e35e20318b0c456306dda42d6b237f068d
8da263e35e20318b0c456306dda42d6b237f068
8da263e35e20318b0c456306dda42d6b237f068d
ok 15 - short SHA-1 works
# passed all 15 test(s)
1..15
