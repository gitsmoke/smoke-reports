ok 1 - ref name 'heads/foo' is valid
ok 2 - ref name 'foo' is not valid
ok 3 - ref name 'foo/bar/baz' is valid
ok 4 - ref name 'refs///heads/foo' is valid
ok 5 - ref name 'heads/foo/' is not valid
ok 6 - ref name './foo' is not valid
ok 7 - ref name '.refs/foo' is not valid
ok 8 - ref name 'heads/foo..bar' is not valid
ok 9 - ref name 'heads/foo?bar' is not valid
ok 10 - ref name 'foo./bar' is valid
ok 11 - ref name 'heads/foo.lock' is not valid
ok 12 - ref name 'heads/foo@bar' is valid
ok 13 - ref name 'heads/v@{ation' is not valid
ok 14 - ref name 'heads/foo\bar' is not valid
ok 15 - check-ref-format --branch @{-1}
not ok - 16 check-ref-format --branch from subdir
#	
#		mkdir subdir &&
#	
#		T=$(git write-tree) &&
#		sha1=$(echo A | git commit-tree $T) &&
#		git update-ref refs/heads/master $sha1 &&
#		git update-ref refs/remotes/origin/master $sha1
#		git checkout master &&
#		git checkout origin/master &&
#		git checkout master &&
#		refname=$(
#			cd subdir &&
#			git check-ref-format --branch @{-1}
#		) &&
#		test "$refname" = "$sha1"
#	
ok 17 - ref name 'heads/foo' simplifies to 'heads/foo'
ok 18 - ref name 'refs///heads/foo' simplifies to 'refs/heads/foo'
ok 19 - check-ref-format --print rejects 'foo'
ok 20 - check-ref-format --print rejects 'heads/foo/../bar'
ok 21 - check-ref-format --print rejects 'heads/./foo'
ok 22 - check-ref-format --print rejects 'heads\foo'
# failed 1 among 22 test(s)
1..22
