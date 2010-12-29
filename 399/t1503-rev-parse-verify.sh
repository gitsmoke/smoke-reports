Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1503-rev-parse-verify/.git/
expecting success: 
	add_line_into_file "1: Hello World" hello &&
	HASH1=$(git rev-parse --verify HEAD) &&
	add_line_into_file "2: A new day for git" hello &&
	HASH2=$(git rev-parse --verify HEAD) &&
	add_line_into_file "3: Another new day for git" hello &&
	HASH3=$(git rev-parse --verify HEAD) &&
	add_line_into_file "4: Ciao for now" hello &&
	HASH4=$(git rev-parse --verify HEAD)

ok 1 - set up basic repo with 1 file (hello) and 4 commits

expecting success: 
	rev_hash1=$(git rev-parse --verify $HASH1) &&
	test "$rev_hash1" = "$HASH1" &&
	rev_hash2=$(git rev-parse --verify $HASH2) &&
	test "$rev_hash2" = "$HASH2" &&
	rev_hash3=$(git rev-parse --verify $HASH3) &&
	test "$rev_hash3" = "$HASH3" &&
	rev_hash4=$(git rev-parse --verify $HASH4) &&
	test "$rev_hash4" = "$HASH4" &&
	rev_master=$(git rev-parse --verify master) &&
	test "$rev_master" = "$HASH4" &&
	rev_head=$(git rev-parse --verify HEAD) &&
	test "$rev_head" = "$HASH4"

ok 2 - works with one good rev

expecting success: 
	test_must_fail git rev-parse --verify 2>error &&
	grep "single revision" error &&
	test_must_fail git rev-parse --verify foo 2>error &&
	grep "single revision" error &&
	test_must_fail git rev-parse --verify HEAD bar 2>error &&
	grep "single revision" error &&
	test_must_fail git rev-parse --verify baz HEAD 2>error &&
	grep "single revision" error &&
	test_must_fail git rev-parse --verify $HASH2 HEAD 2>error &&
	grep "single revision" error
fatal: Needed a single revision
fatal: Needed a single revision
fatal: Needed a single revision
fatal: Needed a single revision
fatal: Needed a single revision
ok 3 - fails with any bad rev or many good revs
expecting success: 
	test_must_fail git rev-parse --verify --quiet 2>error &&
	test -z "$(cat error)" &&
	test_must_fail git rev-parse -q --verify foo 2>error &&
	test -z "$(cat error)" &&
	test_must_fail git rev-parse --verify -q HEAD bar 2>error &&
	test -z "$(cat error)" &&
	test_must_fail git rev-parse --quiet --verify baz HEAD 2>error &&
	test -z "$(cat error)" &&
	test_must_fail git rev-parse -q --verify $HASH2 HEAD 2>error &&
	test -z "$(cat error)"

ok 4 - fails silently when using -q

expecting success: 
	test -z "$(git rev-parse --verify)" &&
	test -z "$(git rev-parse --verify foo)" &&
	test -z "$(git rev-parse --verify baz HEAD)" &&
	test -z "$(git rev-parse --verify HEAD bar)" &&
	test -z "$(git rev-parse --verify $HASH2 HEAD)"
ok 5 - no stdout output on error

expecting success: 
	git rev-parse --verify --default master &&
	git rev-parse --verify --default master HEAD &&
	git rev-parse --default master --verify &&
	git rev-parse --default master --verify HEAD &&
	git rev-parse --verify HEAD --default master &&
	test_must_fail git rev-parse --verify foo --default master &&
	test_must_fail git rev-parse --default HEAD --verify bar &&
	test_must_fail git rev-parse --verify --default HEAD baz &&
	test_must_fail git rev-parse --default foo --verify &&
	test_must_fail git rev-parse --verify --default bar
32a594a3fdac2d57cf6d02987e30eec68511498c
32a594a3fdac2d57cf6d02987e30eec68511498c
32a594a3fdac2d57cf6d02987e30eec68511498c
32a594a3fdac2d57cf6d02987e30eec68511498c
32a594a3fdac2d57cf6d02987e30eec68511498c
ok 6 - use --default

expecting success: 
	N=$(git reflog | wc -l) &&
	Nm1=$(($N-1)) &&
	Np1=$(($N+1)) &&
	git rev-parse --verify master@{0} &&
	git rev-parse --verify master@{1} &&
	git rev-parse --verify master@{$Nm1} &&
	test_must_fail git rev-parse --verify master@{$N} &&
	test_must_fail git rev-parse --verify master@{$Np1}
32a594a3fdac2d57cf6d02987e30eec68511498c
3de952f2416b6084f557ec417709eac740c6818c
88bcdc1839f0ad191ffdd65cae2a2a862d682151
ok 7 - master@{n} for various n
# passed all 7 test(s)
1..7
