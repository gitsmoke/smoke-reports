Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1402-check-ref-format/.git/
expecting success: git check-ref-format 'heads/foo'
ok 1 - ref name 'heads/foo' is valid
expecting success: test_must_fail git check-ref-format 'foo'
ok 2 - ref name 'foo' is not valid
expecting success: git check-ref-format 'foo/bar/baz'
ok 3 - ref name 'foo/bar/baz' is valid
expecting success: git check-ref-format 'refs///heads/foo'
ok 4 - ref name 'refs///heads/foo' is valid
expecting success: test_must_fail git check-ref-format 'heads/foo/'
ok 5 - ref name 'heads/foo/' is not valid
expecting success: test_must_fail git check-ref-format './foo'
ok 6 - ref name './foo' is not valid
expecting success: test_must_fail git check-ref-format '.refs/foo'
ok 7 - ref name '.refs/foo' is not valid
expecting success: test_must_fail git check-ref-format 'heads/foo..bar'
ok 8 - ref name 'heads/foo..bar' is not valid
expecting success: test_must_fail git check-ref-format 'heads/foo?bar'
ok 9 - ref name 'heads/foo?bar' is not valid
expecting success: git check-ref-format 'foo./bar'
ok 10 - ref name 'foo./bar' is valid
expecting success: test_must_fail git check-ref-format 'heads/foo.lock'
ok 11 - ref name 'heads/foo.lock' is not valid
expecting success: git check-ref-format 'heads/foo@bar'
ok 12 - ref name 'heads/foo@bar' is valid
expecting success: test_must_fail git check-ref-format 'heads/v@{ation'

ok 13 - ref name 'heads/v@{ation' is not valid
expecting success: test_must_fail git check-ref-format 'heads/fooar'

ok 14 - ref name 'heads/fooar' is not valid

expecting success: 
	T=$(git write-tree) &&
	sha1=$(echo A | git commit-tree $T) &&
	git update-ref refs/heads/master $sha1 &&
	git update-ref refs/remotes/origin/master $sha1 &&
	git checkout master &&
	git checkout origin/master &&
	git checkout master &&
	refname=$(git check-ref-format --branch @{-1}) &&
	test "$refname" = "$sha1" &&
	refname2=$(git check-ref-format --branch @{-2}) &&
	test "$refname2" = master
ok 15 - check-ref-format --branch @{-1}

expecting success: 
	mkdir subdir &&

	T=$(git write-tree) &&
	sha1=$(echo A | git commit-tree $T) &&
	git update-ref refs/heads/master $sha1 &&
	git update-ref refs/remotes/origin/master $sha1 &&
	git checkout master &&
	git checkout origin/master &&
	git checkout master &&
	refname=$(
		cd subdir &&
		git check-ref-format --branch @{-1}
	) &&
	test "$refname" = "$sha1"
ok 16 - check-ref-format --branch from subdir

expecting success: 
		refname=$(git check-ref-format --print 'heads/foo') &&
		test "$refname" = 'heads/foo'

ok 17 - ref name 'heads/foo' simplifies to 'heads/foo'

expecting success: 
		refname=$(git check-ref-format --print 'refs///heads/foo') &&
		test "$refname" = 'refs/heads/foo'

ok 18 - ref name 'refs///heads/foo' simplifies to 'refs/heads/foo'

expecting success: 
		test_must_fail git check-ref-format --print 'foo'

ok 19 - check-ref-format --print rejects 'foo'

expecting success: 
		test_must_fail git check-ref-format --print 'heads/foo/../bar'

ok 20 - check-ref-format --print rejects 'heads/foo/../bar'
expecting success: 
		test_must_fail git check-ref-format --print 'heads/./foo'

ok 21 - check-ref-format --print rejects 'heads/./foo'
expecting success: 
		test_must_fail git check-ref-format --print 'headsoo'

ok 22 - check-ref-format --print rejects 'headsoo'
# passed all 22 test(s)
1..22
