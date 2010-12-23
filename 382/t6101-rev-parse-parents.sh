Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3
ok 1 - start is valid
expecting success: test be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3 = be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3

ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3 = be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3

ok 4 - second^1 = second^
expecting success: test be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3 = be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3
ok 5 - final^1^1^1
expecting success: test be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3 = be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3

ok 6 - final^1^1^1 = final^^^
expecting success: test 9d2278dd204538209aa60b14e426bf3e27547465 = 9d2278dd204538209aa60b14e426bf3e27547465

ok 7 - final^1^2
expecting success: test 9d2278dd204538209aa60b14e426bf3e27547465 != 5beb84e325c7165749ba7d4cd2bb294da7ebc659

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
9d2278dd204538209aa60b14e426bf3e27547465

ok 11 - --verify start2^0
expecting success: test "5beb84e325c7165749ba7d4cd2bb294da7ebc659
9d2278dd204538209aa60b14e426bf3e27547465" = "5beb84e325c7165749ba7d4cd2bb294da7ebc659
9d2278dd204538209aa60b14e426bf3e27547465"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "2672084458a25dcee94cb502b0ba1a29772187ec
^5beb84e325c7165749ba7d4cd2bb294da7ebc659
^9d2278dd204538209aa60b14e426bf3e27547465" = "2672084458a25dcee94cb502b0ba1a29772187ec
^5beb84e325c7165749ba7d4cd2bb294da7ebc659
^9d2278dd204538209aa60b14e426bf3e27547465"

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
be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3
be5f001b8a7cadd0aa83cd71b45460ef6b97e7e
be5f001b8a7cadd0aa83cd71b45460ef6b97e7e3

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
