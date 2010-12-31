Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7008-grep-binary/.git/
expecting success: 
	echo 'binaryQfile' | q_to_nul >a &&
	git add a &&
	git commit -m.
[master (root-commit) 4226ca6] .
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a

ok 1 - setup

expecting success: 
	echo Binary file a matches >expect &&
	git grep ina a >actual &&
	test_cmp expect actual


ok 2 - git grep ina a

expecting success: 
	git grep -ah ina a >actual &&
	test_cmp a actual


ok 3 - git grep -ah ina a

expecting success: 
	: >expect &&
	test_must_fail git grep -I ina a >actual &&
	test_cmp expect actual

ok 4 - git grep -I ina a

expecting success: 
	echo a:1 >expect &&
	git grep -c ina a >actual &&
	test_cmp expect actual


ok 5 - git grep -c ina a

expecting success: 
	echo a >expect &&
	git grep -l ina a >actual &&
	test_cmp expect actual


ok 6 - git grep -l ina a

expecting success: 
	echo a >expect &&
	git grep -L bar a >actual &&
	test_cmp expect actual


ok 7 - git grep -L bar a

expecting success: 
	: >expect &&
	git grep -q ina a >actual &&
	test_cmp expect actual


ok 8 - git grep -q ina a

expecting success: 
	git grep -F ile a

Binary file a matches

ok 9 - git grep -F ile a

expecting success: 
	git grep -Fi iLE a

Binary file a matches

ok 10 - git grep -Fi iLE a

expecting success: 
	git grep ile a

Binary file a matches

ok 11 - git grep ile a

checking known breakage: 
	git grep .fi a

Binary file a matches

ok 12 - git grep .fi a # TODO known breakage

expecting success: 
	printf 'yQf' | q_to_nul >f &&
	git grep -f f -F a

Binary file a matches

ok 13 - git grep -F y<NUL>f a

expecting success: 
	printf 'yQx' | q_to_nul >f &&
	test_must_fail git grep -f f -F a


ok 14 - git grep -F y<NUL>x a

expecting success: 
	printf 'YQf' | q_to_nul >f &&
	git grep -f f -Fi a

Binary file a matches

ok 15 - git grep -Fi Y<NUL>f a

checking known breakage: 
	printf 'YQx' | q_to_nul >f &&
	test_must_fail git grep -f f -Fi a

Binary file a matches

not ok 16 - git grep -Fi Y<NUL>x a # TODO known breakage

expecting success: 
	printf 'yQf' | q_to_nul >f &&
	git grep -f f a

Binary file a matches

ok 17 - git grep y<NUL>f a

checking known breakage: 
	printf 'yQx' | q_to_nul >f &&
	test_must_fail git grep -f f a

Binary file a matches

not ok 18 - git grep y<NUL>x a # TODO known breakage

# fixed 1 known breakage(s)
# still have 2 known breakage(s)
# passed all remaining 16 test(s)
1..18
