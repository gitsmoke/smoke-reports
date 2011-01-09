Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
1dd9ef5fabf4476cbe29b17679ad27a373c7f848

ok 1 - start is valid

expecting success: test 1dd9ef5fabf4476cbe29b17679ad27a373c7f848 = 1dd9ef5fabf4476cbe29b17679ad27a373c7f848

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test 1dd9ef5fabf4476cbe29b17679ad27a373c7f848 = 1dd9ef5fabf4476cbe29b17679ad27a373c7f848
ok 4 - second^1 = second^
expecting success: test 1dd9ef5fabf4476cbe29b17679ad27a373c7f848 = 1dd9ef5fabf4476cbe29b17679ad27a373c7f848

ok 5 - final^1^1^1
expecting success: test 1dd9ef5fabf4476cbe29b17679ad27a373c7f848 = 1dd9ef5fabf4476cbe29b17679ad27a373c7f848

ok 6 - final^1^1^1 = final^^^
expecting success: test 31213659f96791b2540a93b067a05716e597ca8b = 31213659f96791b2540a93b067a05716e597ca8b

ok 7 - final^1^2
expecting success: test 31213659f96791b2540a93b067a05716e597ca8b != 57d9c0dfbd20fc576298e2e50906fddae8c87126

ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
31213659f96791b2540a93b067a05716e597ca8b
ok 11 - --verify start2^0
expecting success: test "57d9c0dfbd20fc576298e2e50906fddae8c87126
31213659f96791b2540a93b067a05716e597ca8b" = "57d9c0dfbd20fc576298e2e50906fddae8c87126
31213659f96791b2540a93b067a05716e597ca8b"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "4a3066b7d121d67cddca183509240255701ce995
^57d9c0dfbd20fc576298e2e50906fddae8c87126
^31213659f96791b2540a93b067a05716e597ca8b" = "4a3066b7d121d67cddca183509240255701ce995
^57d9c0dfbd20fc576298e2e50906fddae8c87126
^31213659f96791b2540a93b067a05716e597ca8b"
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
1dd9ef5fabf4476cbe29b17679ad27a373c7f848
1dd9ef5fabf4476cbe29b17679ad27a373c7f84
1dd9ef5fabf4476cbe29b17679ad27a373c7f848

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
