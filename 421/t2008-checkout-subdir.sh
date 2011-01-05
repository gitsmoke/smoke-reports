Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2008-checkout-subdir/.git/
expecting success: 

	echo "base" > file0 &&
	git add file0 &&
	mkdir dir1 &&
	echo "hello" > dir1/file1 &&
	git add dir1/file1 &&
	mkdir dir2 &&
	echo "bonjour" > dir2/file2 &&
	git add dir2/file2 &&
	test_tick &&
	git commit -m "populate tree"
[master (root-commit) 15793b3] populate tree
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 dir1/file1
 create mode 100644 dir2/file2
 create mode 100644 file0

ok 1 - setup

expecting success: 

	(
		cd dir1 &&
		rm ../file0 &&
		git checkout HEAD -- ../file0 &&
		test "base" = "$(cat ../file0)" &&
		rm ../dir2/file2 &&
		git checkout HEAD -- ../dir2/file2 &&
		test "bonjour" = "$(cat ../dir2/file2)" &&
		rm ../file0 ./file1 &&
		git checkout HEAD -- .. &&
		test "base" = "$(cat ../file0)" &&
		test "hello" = "$(cat file1)"
	)
ok 2 - remove and restore with relative path

expecting success: 

	rm file0 &&
	git checkout HEAD -- file0 &&
	test "base" = "$(cat file0)"

ok 3 - checkout with empty prefix

expecting success: 

	rm dir1/file1 &&
	git checkout HEAD -- dir1 &&
	test "hello" = "$(cat dir1/file1)" &&
	rm dir1/file1 &&
	git checkout HEAD -- dir1/file1 &&
	test "hello" = "$(cat dir1/file1)"



ok 4 - checkout with simple prefix

expecting success: test_must_fail git checkout HEAD -- ../../Makefile

ok 5 - relative path outside tree should fail

expecting success: test_must_fail git checkout HEAD -- ../file0

ok 6 - incorrect relative path to file should fail (1)

expecting success: ( cd dir1 && test_must_fail git checkout HEAD -- ./file0 )

ok 7 - incorrect relative path should fail (2)

expecting success: ( cd dir1 && test_must_fail git checkout HEAD -- ../../file0 )

ok 8 - incorrect relative path should fail (3)

# passed all 8 test(s)
1..8
