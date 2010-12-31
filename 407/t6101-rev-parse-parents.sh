Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
34aa589c2fcbedfa43676458cdc63a725683517a

ok 1 - start is valid

expecting success: test 34aa589c2fcbedfa43676458cdc63a725683517a = 34aa589c2fcbedfa43676458cdc63a725683517a

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test 34aa589c2fcbedfa43676458cdc63a725683517a = 34aa589c2fcbedfa43676458cdc63a725683517a

ok 4 - second^1 = second^

expecting success: test 34aa589c2fcbedfa43676458cdc63a725683517a = 34aa589c2fcbedfa43676458cdc63a725683517a

ok 5 - final^1^1^1

expecting success: test 34aa589c2fcbedfa43676458cdc63a725683517a = 34aa589c2fcbedfa43676458cdc63a725683517a

ok 6 - final^1^1^1 = final^^^

expecting success: test 5a8fdac9d290f85cce240878aa118c0e4f008a78 = 5a8fdac9d290f85cce240878aa118c0e4f008a78

ok 7 - final^1^2

expecting success: test 5a8fdac9d290f85cce240878aa118c0e4f008a78 != d7d65fb7da0fdd163fe98fa6a0095e225602fe3c

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
5a8fdac9d290f85cce240878aa118c0e4f008a78

ok 11 - --verify start2^0

expecting success: test "d7d65fb7da0fdd163fe98fa6a0095e225602fe3c
5a8fdac9d290f85cce240878aa118c0e4f008a78" = "d7d65fb7da0fdd163fe98fa6a0095e225602fe3c
5a8fdac9d290f85cce240878aa118c0e4f008a78"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "250ea9881ad06d8d6afc515d44d62c1ee55656e1
^d7d65fb7da0fdd163fe98fa6a0095e225602fe3c
^5a8fdac9d290f85cce240878aa118c0e4f008a78" = "250ea9881ad06d8d6afc515d44d62c1ee55656e1
^d7d65fb7da0fdd163fe98fa6a0095e225602fe3c
^5a8fdac9d290f85cce240878aa118c0e4f008a78"

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
34aa589c2fcbedfa43676458cdc63a725683517a
34aa589c2fcbedfa43676458cdc63a725683517
34aa589c2fcbedfa43676458cdc63a725683517a

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
