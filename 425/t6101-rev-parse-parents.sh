Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
6a51a412fadafa4969695e14dd3ec35313eb4bc0
ok 1 - start is valid
expecting success: test 6a51a412fadafa4969695e14dd3ec35313eb4bc0 = 6a51a412fadafa4969695e14dd3ec35313eb4bc0

ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test 6a51a412fadafa4969695e14dd3ec35313eb4bc0 = 6a51a412fadafa4969695e14dd3ec35313eb4bc0

ok 4 - second^1 = second^
expecting success: test 6a51a412fadafa4969695e14dd3ec35313eb4bc0 = 6a51a412fadafa4969695e14dd3ec35313eb4bc0
ok 5 - final^1^1^1
expecting success: test 6a51a412fadafa4969695e14dd3ec35313eb4bc0 = 6a51a412fadafa4969695e14dd3ec35313eb4bc0
ok 6 - final^1^1^1 = final^^^
expecting success: test 0d70aa65a5996223c546f7c37b71b3da973a005e = 0d70aa65a5996223c546f7c37b71b3da973a005e

ok 7 - final^1^2
expecting success: test 0d70aa65a5996223c546f7c37b71b3da973a005e != 91c17f4a9416c1cadd1dd48a35b4b376d66d7382
ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi
ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
0d70aa65a5996223c546f7c37b71b3da973a005e

ok 11 - --verify start2^0

expecting success: test "91c17f4a9416c1cadd1dd48a35b4b376d66d7382
0d70aa65a5996223c546f7c37b71b3da973a005e" = "91c17f4a9416c1cadd1dd48a35b4b376d66d7382
0d70aa65a5996223c546f7c37b71b3da973a005e"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "f2d767aa1b4f291cfd0d8a55c671c494c79e1e7b
^91c17f4a9416c1cadd1dd48a35b4b376d66d7382
^0d70aa65a5996223c546f7c37b71b3da973a005e" = "f2d767aa1b4f291cfd0d8a55c671c494c79e1e7b
^91c17f4a9416c1cadd1dd48a35b4b376d66d7382
^0d70aa65a5996223c546f7c37b71b3da973a005e"

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
6a51a412fadafa4969695e14dd3ec35313eb4bc0
6a51a412fadafa4969695e14dd3ec35313eb4bc
6a51a412fadafa4969695e14dd3ec35313eb4bc0
ok 15 - short SHA-1 works
# passed all 15 test(s)
1..15
