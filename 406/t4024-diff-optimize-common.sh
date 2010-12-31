Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4024-diff-optimize-common/.git/
expecting success: 

	for n in $sample
	do
		( zs $n ; echo a ) >file-a$n &&
		( echo b; zs $n; echo ) >file-b$n &&
		( printf c; zs $n ) >file-c$n &&
		( echo d; zs $n ) >file-d$n &&

		git add file-a$n file-b$n file-c$n file-d$n &&

		( zs $n ; echo A ) >file-a$n &&
		( echo B; zs $n; echo ) >file-b$n &&
		( printf C; zs $n ) >file-c$n &&
		( echo D; zs $n ) >file-d$n &&

		expect_pattern $n || break

	done >expect

ok 1 - setup

expecting success: 

	for n in $sample
	do
		git diff -U0 file-?$n
	done | zc >actual &&
	test_cmp expect actual

ok 2 - diff -U0

# passed all 2 test(s)
1..2
