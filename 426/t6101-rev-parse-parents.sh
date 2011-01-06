Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
b66ed416049bbf52ca085bf25c60fc41e8208734

ok 1 - start is valid

expecting success: test b66ed416049bbf52ca085bf25c60fc41e8208734 = b66ed416049bbf52ca085bf25c60fc41e8208734

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi

ok 3 - start^1 not valid
expecting success: test b66ed416049bbf52ca085bf25c60fc41e8208734 = b66ed416049bbf52ca085bf25c60fc41e8208734
ok 4 - second^1 = second^
expecting success: test b66ed416049bbf52ca085bf25c60fc41e8208734 = b66ed416049bbf52ca085bf25c60fc41e8208734

ok 5 - final^1^1^1
expecting success: test b66ed416049bbf52ca085bf25c60fc41e8208734 = b66ed416049bbf52ca085bf25c60fc41e8208734

ok 6 - final^1^1^1 = final^^^
expecting success: test 5c02fadde8d05f4afc0451c37ac644d6f2a91fa9 = 5c02fadde8d05f4afc0451c37ac644d6f2a91fa9

ok 7 - final^1^2
expecting success: test 5c02fadde8d05f4afc0451c37ac644d6f2a91fa9 != a856dfd7e41eaf2e6f4fce4bd7d575d2cef6e73a

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
5c02fadde8d05f4afc0451c37ac644d6f2a91fa9

ok 11 - --verify start2^0

expecting success: test "a856dfd7e41eaf2e6f4fce4bd7d575d2cef6e73a
5c02fadde8d05f4afc0451c37ac644d6f2a91fa9" = "a856dfd7e41eaf2e6f4fce4bd7d575d2cef6e73a
5c02fadde8d05f4afc0451c37ac644d6f2a91fa9"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "d6cfa751539387fee0eba00382b8aba4e64099b6
^a856dfd7e41eaf2e6f4fce4bd7d575d2cef6e73a
^5c02fadde8d05f4afc0451c37ac644d6f2a91fa9" = "d6cfa751539387fee0eba00382b8aba4e64099b6
^a856dfd7e41eaf2e6f4fce4bd7d575d2cef6e73a
^5c02fadde8d05f4afc0451c37ac644d6f2a91fa9"

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
b66ed416049bbf52ca085bf25c60fc41e8208734
b66ed416049bbf52ca085bf25c60fc41e820873
b66ed416049bbf52ca085bf25c60fc41e8208734

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
