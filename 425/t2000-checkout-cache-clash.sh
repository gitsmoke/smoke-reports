Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2000-checkout-cache-clash/.git/
expecting success: git update-index --add path0 path1/file1

ok 1 - git update-index --add various paths.

expecting success: test_must_fail git checkout-index -a

ok 2 - git checkout-index without -f should fail on conflicting work tree.

expecting success: git checkout-index -f -a
ok 3 - git checkout-index with -f should succeed.

expecting success: test -f path0 && test -d path1 && test -f path1/file1

ok 4 - git checkout-index conflicting paths.
expecting success: 
	mkdir -p tar/get &&
	ln -s tar/get there &&
	echo first &&
	git checkout-index -a -f --prefix=there/ &&
	echo second &&
	git checkout-index -a -f --prefix=there/
first
second

ok 5 - checkout-index -f twice with --prefix

# passed all 5 test(s)
1..5
