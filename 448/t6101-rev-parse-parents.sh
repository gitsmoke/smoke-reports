Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
676061b245ac81f3acd98df713f1aeb2b12fcd2a
ok 1 - start is valid
expecting success: test 676061b245ac81f3acd98df713f1aeb2b12fcd2a = 676061b245ac81f3acd98df713f1aeb2b12fcd2a

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test 676061b245ac81f3acd98df713f1aeb2b12fcd2a = 676061b245ac81f3acd98df713f1aeb2b12fcd2a
ok 4 - second^1 = second^
expecting success: test 676061b245ac81f3acd98df713f1aeb2b12fcd2a = 676061b245ac81f3acd98df713f1aeb2b12fcd2a
ok 5 - final^1^1^1
expecting success: test 676061b245ac81f3acd98df713f1aeb2b12fcd2a = 676061b245ac81f3acd98df713f1aeb2b12fcd2a

ok 6 - final^1^1^1 = final^^^
expecting success: test 96c311e8fb77daf9605f60bd7def3f0b18894402 = 96c311e8fb77daf9605f60bd7def3f0b18894402

ok 7 - final^1^2
expecting success: test 96c311e8fb77daf9605f60bd7def3f0b18894402 != c82f3ee4dcc5e7b052f2f5576f8c702c0cd34168

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
96c311e8fb77daf9605f60bd7def3f0b18894402

ok 11 - --verify start2^0

expecting success: test "c82f3ee4dcc5e7b052f2f5576f8c702c0cd34168
96c311e8fb77daf9605f60bd7def3f0b18894402" = "c82f3ee4dcc5e7b052f2f5576f8c702c0cd34168
96c311e8fb77daf9605f60bd7def3f0b18894402"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "cf2125e9266c80630e896af77c3fab4eda35410f
^c82f3ee4dcc5e7b052f2f5576f8c702c0cd34168
^96c311e8fb77daf9605f60bd7def3f0b18894402" = "cf2125e9266c80630e896af77c3fab4eda35410f
^c82f3ee4dcc5e7b052f2f5576f8c702c0cd34168
^96c311e8fb77daf9605f60bd7def3f0b18894402"

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
676061b245ac81f3acd98df713f1aeb2b12fcd2a
676061b245ac81f3acd98df713f1aeb2b12fcd2
676061b245ac81f3acd98df713f1aeb2b12fcd2a

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
