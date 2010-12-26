Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176

ok 1 - start is valid
expecting success: test fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176 = fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176 = fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176

ok 4 - second^1 = second^
expecting success: test fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176 = fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176
ok 5 - final^1^1^1
expecting success: test fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176 = fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176
ok 6 - final^1^1^1 = final^^^
expecting success: test b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f = b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f

ok 7 - final^1^2
expecting success: test b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f != 764bcba63086984557ef3ed89867cfc2c3d37144

ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f

ok 11 - --verify start2^0

expecting success: test "764bcba63086984557ef3ed89867cfc2c3d37144
b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f" = "764bcba63086984557ef3ed89867cfc2c3d37144
b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "8acf6ddf67eab94857bf94181ed57e5525036fe4
^764bcba63086984557ef3ed89867cfc2c3d37144
^b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f" = "8acf6ddf67eab94857bf94181ed57e5525036fe4
^764bcba63086984557ef3ed89867cfc2c3d37144
^b9e0f3549b54a2de5b1cfd3c37b0838ede3df46f"

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
fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176
fcb47c97d8b6f9c13e5a9d13a56033e3ad2f517
fcb47c97d8b6f9c13e5a9d13a56033e3ad2f5176

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
