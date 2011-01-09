Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 1 - start is valid

expecting success: test 8e3154951a3f0dc5d26e047dbf7764daf2629bef = 8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test 8e3154951a3f0dc5d26e047dbf7764daf2629bef = 8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 4 - second^1 = second^

expecting success: test 8e3154951a3f0dc5d26e047dbf7764daf2629bef = 8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 5 - final^1^1^1
expecting success: test 8e3154951a3f0dc5d26e047dbf7764daf2629bef = 8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 6 - final^1^1^1 = final^^^
expecting success: test cedccdd618afd47fb2b267f51b2e377b6eaeabc2 = cedccdd618afd47fb2b267f51b2e377b6eaeabc2
ok 7 - final^1^2
expecting success: test cedccdd618afd47fb2b267f51b2e377b6eaeabc2 != d12a4d44a2bb49b2f4ea387a2f0beed61be9ff2b

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
cedccdd618afd47fb2b267f51b2e377b6eaeabc2

ok 11 - --verify start2^0
expecting success: test "d12a4d44a2bb49b2f4ea387a2f0beed61be9ff2b
cedccdd618afd47fb2b267f51b2e377b6eaeabc2" = "d12a4d44a2bb49b2f4ea387a2f0beed61be9ff2b
cedccdd618afd47fb2b267f51b2e377b6eaeabc2"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "bf7ecad8a02268f45fde72d6599a29e90fc8e52e
^d12a4d44a2bb49b2f4ea387a2f0beed61be9ff2b
^cedccdd618afd47fb2b267f51b2e377b6eaeabc2" = "bf7ecad8a02268f45fde72d6599a29e90fc8e52e
^d12a4d44a2bb49b2f4ea387a2f0beed61be9ff2b
^cedccdd618afd47fb2b267f51b2e377b6eaeabc2"
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
8e3154951a3f0dc5d26e047dbf7764daf2629bef
8e3154951a3f0dc5d26e047dbf7764daf2629be
8e3154951a3f0dc5d26e047dbf7764daf2629bef

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
