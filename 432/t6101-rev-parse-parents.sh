Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
2ca7dd25333c77f0c2446fc29ca36c55051b447a

ok 1 - start is valid
expecting success: test 2ca7dd25333c77f0c2446fc29ca36c55051b447a = 2ca7dd25333c77f0c2446fc29ca36c55051b447a

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test 2ca7dd25333c77f0c2446fc29ca36c55051b447a = 2ca7dd25333c77f0c2446fc29ca36c55051b447a
ok 4 - second^1 = second^
expecting success: test 2ca7dd25333c77f0c2446fc29ca36c55051b447a = 2ca7dd25333c77f0c2446fc29ca36c55051b447a

ok 5 - final^1^1^1
expecting success: test 2ca7dd25333c77f0c2446fc29ca36c55051b447a = 2ca7dd25333c77f0c2446fc29ca36c55051b447a

ok 6 - final^1^1^1 = final^^^

expecting success: test 5762a1ad5ccb597bb266be4c363aec0e1da262d9 = 5762a1ad5ccb597bb266be4c363aec0e1da262d9

ok 7 - final^1^2

expecting success: test 5762a1ad5ccb597bb266be4c363aec0e1da262d9 != 390727eae6064e04dc7892f33cc7971e51f4d6f3

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
5762a1ad5ccb597bb266be4c363aec0e1da262d9

ok 11 - --verify start2^0

expecting success: test "390727eae6064e04dc7892f33cc7971e51f4d6f3
5762a1ad5ccb597bb266be4c363aec0e1da262d9" = "390727eae6064e04dc7892f33cc7971e51f4d6f3
5762a1ad5ccb597bb266be4c363aec0e1da262d9"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "630193616e5f3b05c6cc309db8b68efb2b807e89
^390727eae6064e04dc7892f33cc7971e51f4d6f3
^5762a1ad5ccb597bb266be4c363aec0e1da262d9" = "630193616e5f3b05c6cc309db8b68efb2b807e89
^390727eae6064e04dc7892f33cc7971e51f4d6f3
^5762a1ad5ccb597bb266be4c363aec0e1da262d9"

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
2ca7dd25333c77f0c2446fc29ca36c55051b447a
2ca7dd25333c77f0c2446fc29ca36c55051b447
2ca7dd25333c77f0c2446fc29ca36c55051b447a

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
