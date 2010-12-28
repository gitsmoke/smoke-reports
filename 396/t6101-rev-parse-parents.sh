Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
69a36684f416164a27309b2191b6c4f056771178
ok 1 - start is valid
expecting success: test 69a36684f416164a27309b2191b6c4f056771178 = 69a36684f416164a27309b2191b6c4f056771178

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test 69a36684f416164a27309b2191b6c4f056771178 = 69a36684f416164a27309b2191b6c4f056771178

ok 4 - second^1 = second^
expecting success: test 69a36684f416164a27309b2191b6c4f056771178 = 69a36684f416164a27309b2191b6c4f056771178

ok 5 - final^1^1^1

expecting success: test 69a36684f416164a27309b2191b6c4f056771178 = 69a36684f416164a27309b2191b6c4f056771178

ok 6 - final^1^1^1 = final^^^
expecting success: test 78eb3ee9a69af7c792eb12545f42abbc8764a46a = 78eb3ee9a69af7c792eb12545f42abbc8764a46a

ok 7 - final^1^2
expecting success: test 78eb3ee9a69af7c792eb12545f42abbc8764a46a != 5b0ea3675e627c9b269d3366b59b45b1d8e680db

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
78eb3ee9a69af7c792eb12545f42abbc8764a46a

ok 11 - --verify start2^0

expecting success: test "5b0ea3675e627c9b269d3366b59b45b1d8e680db
78eb3ee9a69af7c792eb12545f42abbc8764a46a" = "5b0ea3675e627c9b269d3366b59b45b1d8e680db
78eb3ee9a69af7c792eb12545f42abbc8764a46a"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "c3bb34a2760b4276ba8a5e89c1f16259cf1e08c4
^5b0ea3675e627c9b269d3366b59b45b1d8e680db
^78eb3ee9a69af7c792eb12545f42abbc8764a46a" = "c3bb34a2760b4276ba8a5e89c1f16259cf1e08c4
^5b0ea3675e627c9b269d3366b59b45b1d8e680db
^78eb3ee9a69af7c792eb12545f42abbc8764a46a"

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
69a36684f416164a27309b2191b6c4f056771178
69a36684f416164a27309b2191b6c4f05677117
69a36684f416164a27309b2191b6c4f056771178
ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
