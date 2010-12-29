Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0055-beyond-symlinks/.git/
expecting success: 
	>a &&
	mkdir b &&
	ln -s b c &&
	>c/d &&
	git update-index --add a b/d


ok 1 - setup

expecting success: 
	test_must_fail git update-index --add c/d &&
	! ( git ls-files | grep c/d )


ok 2 - update-index --add beyond symlinks

expecting success: 
	test_must_fail git add c/d &&
	! ( git ls-files | grep c/d )

ok 3 - add beyond symlinks

# passed all 3 test(s)
1..3
