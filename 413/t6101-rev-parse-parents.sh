Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
186461162b90fbaa408ca64ee3c809e4be8da1e1
ok 1 - start is valid
expecting success: test 186461162b90fbaa408ca64ee3c809e4be8da1e1 = 186461162b90fbaa408ca64ee3c809e4be8da1e1
ok 2 - start^0
expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test 186461162b90fbaa408ca64ee3c809e4be8da1e1 = 186461162b90fbaa408ca64ee3c809e4be8da1e1

ok 4 - second^1 = second^
expecting success: test 186461162b90fbaa408ca64ee3c809e4be8da1e1 = 186461162b90fbaa408ca64ee3c809e4be8da1e1
ok 5 - final^1^1^1
expecting success: test 186461162b90fbaa408ca64ee3c809e4be8da1e1 = 186461162b90fbaa408ca64ee3c809e4be8da1e1
ok 6 - final^1^1^1 = final^^^
expecting success: test e303b88ed34ab75842ef54f98c88f68053296a51 = e303b88ed34ab75842ef54f98c88f68053296a51

ok 7 - final^1^2
expecting success: test e303b88ed34ab75842ef54f98c88f68053296a51 != c8bd19fe7e4ac480703ee8e3f722c70bf17e9673

ok 8 - final^1^2 != final^1^1
expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1

ok 10 - --verify start2^1

expecting success: git rev-parse --verify start2^0
e303b88ed34ab75842ef54f98c88f68053296a51

ok 11 - --verify start2^0
expecting success: test "c8bd19fe7e4ac480703ee8e3f722c70bf17e9673
e303b88ed34ab75842ef54f98c88f68053296a51" = "c8bd19fe7e4ac480703ee8e3f722c70bf17e9673
e303b88ed34ab75842ef54f98c88f68053296a51"

ok 12 - final^1^@ = final^1^1 final^1^2

expecting success: test "62f38edfd1766d9ee0d1ae6c9ebe4d19418889c2
^c8bd19fe7e4ac480703ee8e3f722c70bf17e9673
^e303b88ed34ab75842ef54f98c88f68053296a51" = "62f38edfd1766d9ee0d1ae6c9ebe4d19418889c2
^c8bd19fe7e4ac480703ee8e3f722c70bf17e9673
^e303b88ed34ab75842ef54f98c88f68053296a51"

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
186461162b90fbaa408ca64ee3c809e4be8da1e1
186461162b90fbaa408ca64ee3c809e4be8da1e
186461162b90fbaa408ca64ee3c809e4be8da1e1

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
