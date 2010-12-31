Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6101-rev-parse-parents/.git/
expecting success: git rev-parse start | grep "^[0-9a-f]\{40\}$"
bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee
ok 1 - start is valid
expecting success: test bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee = bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee
ok 2 - start^0

expecting success: if git rev-parse --verify start^1; then false; else :; fi
ok 3 - start^1 not valid
expecting success: test bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee = bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee

ok 4 - second^1 = second^
expecting success: test bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee = bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee

ok 5 - final^1^1^1

expecting success: test bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee = bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee

ok 6 - final^1^1^1 = final^^^
expecting success: test b934434d7904a1c846145960e60cd97bfc4b9fb4 = b934434d7904a1c846145960e60cd97bfc4b9fb4

ok 7 - final^1^2

expecting success: test b934434d7904a1c846145960e60cd97bfc4b9fb4 != 855767066e3dfe8b0c92fda8111a05cac5749ec6

ok 8 - final^1^2 != final^1^1

expecting success: if git rev-parse --verify final^1^3; then false; else :; fi

ok 9 - final^1^3 not valid

expecting success: test_must_fail git rev-parse --verify start2^1
ok 10 - --verify start2^1
expecting success: git rev-parse --verify start2^0
b934434d7904a1c846145960e60cd97bfc4b9fb4

ok 11 - --verify start2^0
expecting success: test "855767066e3dfe8b0c92fda8111a05cac5749ec6
b934434d7904a1c846145960e60cd97bfc4b9fb4" = "855767066e3dfe8b0c92fda8111a05cac5749ec6
b934434d7904a1c846145960e60cd97bfc4b9fb4"

ok 12 - final^1^@ = final^1^1 final^1^2
expecting success: test "7fe45243119e282f1e183ce82b6ce9c5cd5cd781
^855767066e3dfe8b0c92fda8111a05cac5749ec6
^b934434d7904a1c846145960e60cd97bfc4b9fb4" = "7fe45243119e282f1e183ce82b6ce9c5cd5cd781
^855767066e3dfe8b0c92fda8111a05cac5749ec6
^b934434d7904a1c846145960e60cd97bfc4b9fb4"

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
bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee
bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4e
bbdfa1bbf09d61af8ca8eee7f104aa6e3d95f4ee

ok 15 - short SHA-1 works

# passed all 15 test(s)
1..15
