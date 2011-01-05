Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 1 - start is valid

expecting success: test 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4 = 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid

expecting success: test 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4 = 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 4 - second^1 = second^

expecting success: test 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4 = 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 5 - final^1^1^1

expecting success: test 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4 = 70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 6 - final^1^1^1 = final^^^

expecting success: test 1dfde1ea99626529207297a25af6d1ae1988669c = 1dfde1ea99626529207297a25af6d1ae1988669c

ok 7 - final^1^2

expecting success: test 1dfde1ea99626529207297a25af6d1ae1988669c != 230f0a14bdbac9e60b5405a52c54bfd208394bcf

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
1dfde1ea99626529207297a25af6d1ae1988669c

ok 11 - --verify start2^0

expecting success: test "230f0a14bdbac9e60b5405a52c54bfd208394bcf
1dfde1ea99626529207297a25af6d1ae1988669c" = "230f0a14bdbac9e60b5405a52c54bfd208394bcf
1dfde1ea99626529207297a25af6d1ae1988669c"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "0b7421bf2b39f4a95f9bd104f91d83734bbadf01
^230f0a14bdbac9e60b5405a52c54bfd208394bcf
^1dfde1ea99626529207297a25af6d1ae1988669c" = "0b7421bf2b39f4a95f9bd104f91d83734bbadf01
^230f0a14bdbac9e60b5405a52c54bfd208394bcf
^1dfde1ea99626529207297a25af6d1ae1988669c"

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
70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4
70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e
70a8cf8d9e1fb32ac1b601f659dba75dbffdf8e4

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
