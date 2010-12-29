Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
89c3e317d332d88c1238563edccb6d9e4e89e81c

ok 1 - start is valid

expecting success: test 89c3e317d332d88c1238563edccb6d9e4e89e81c = 89c3e317d332d88c1238563edccb6d9e4e89e81c

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test 89c3e317d332d88c1238563edccb6d9e4e89e81c = 89c3e317d332d88c1238563edccb6d9e4e89e81c

ok 4 - second^1 = second^
expecting success: test 89c3e317d332d88c1238563edccb6d9e4e89e81c = 89c3e317d332d88c1238563edccb6d9e4e89e81c

ok 5 - final^1^1^1
expecting success: test 89c3e317d332d88c1238563edccb6d9e4e89e81c = 89c3e317d332d88c1238563edccb6d9e4e89e81c
ok 6 - final^1^1^1 = final^^^
expecting success: test 2da2b4a7f51cf0d06f7f61540b188d9aa350a01b = 2da2b4a7f51cf0d06f7f61540b188d9aa350a01b

ok 7 - final^1^2
expecting success: test 2da2b4a7f51cf0d06f7f61540b188d9aa350a01b != 0b9b0d5ee55302732c08d3da53e5c78909800720

ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid
expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
2da2b4a7f51cf0d06f7f61540b188d9aa350a01b
ok 11 - --verify start2^0
expecting success: test "0b9b0d5ee55302732c08d3da53e5c78909800720
2da2b4a7f51cf0d06f7f61540b188d9aa350a01b" = "0b9b0d5ee55302732c08d3da53e5c78909800720
2da2b4a7f51cf0d06f7f61540b188d9aa350a01b"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "d8c23ed12f9e31d81180819a3e886cdb678b3e71
^0b9b0d5ee55302732c08d3da53e5c78909800720
^2da2b4a7f51cf0d06f7f61540b188d9aa350a01b" = "d8c23ed12f9e31d81180819a3e886cdb678b3e71
^0b9b0d5ee55302732c08d3da53e5c78909800720
^2da2b4a7f51cf0d06f7f61540b188d9aa350a01b"

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
89c3e317d332d88c1238563edccb6d9e4e89e81c
89c3e317d332d88c1238563edccb6d9e4e89e81
89c3e317d332d88c1238563edccb6d9e4e89e81c

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
