Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/.git/
expecting success: 
	if
		test_have_prereq PERL &&
		"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl \
			sh -c "test -t 1 && test -t 2"
	then
		test_set_prereq TTY &&
		test_terminal () {
			if ! test_declared_prereq TTY
			then
				echo >&4 "test_terminal: need to declare TTY prerequisite"
				return 127
			fi
			"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl "$@"
		}
	fi


ok 1 - set up terminal for tests

expecting success: 
	ensure_fresh_upstream &&
	git remote add upstream parent

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/

ok 2 - setup bare parent

expecting success: 
	echo content >file &&
	git add file &&
	git commit -m one
[master (root-commit) ee5800a] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 3 - setup local commit

expecting success: 
	git push -u upstream master:master &&
	check_config master upstream refs/heads/master

Branch master set up to track remote branch master from upstream.

ok 4 - push -u master:master

expecting success: 
	git push -u upstream master:other &&
	check_config master upstream refs/heads/other

Branch master set up to track remote branch other from upstream.

ok 5 - push -u master:other

expecting success: 
	git push -u --dry-run upstream master:otherX &&
	check_config master upstream refs/heads/other

Would set upstream of 'master' to 'otherX' of 'upstream'

ok 6 - push -u --dry-run master:otherX

expecting success: 
	git branch master2 &&
	git push -u upstream master2:master2 &&
	check_config master2 upstream refs/heads/master2
Branch master2 set up to track remote branch master2 from upstream.
ok 7 - push -u master2:master2

expecting success: 
	git push -u upstream master2:other2 &&
	check_config master2 upstream refs/heads/other2
Branch master2 set up to track remote branch other2 from upstream.

ok 8 - push -u master2:other2

expecting success: 
	git push -u upstream :master2 &&
	check_config master2 upstream refs/heads/other2


ok 9 - push -u :master2

expecting success: 
	git branch all1 &&
	git branch all2 &&
	git push -u --all &&
	check_config all1 upstream refs/heads/all1 &&
	check_config all2 upstream refs/heads/all2

Branch master set up to track remote branch master from upstream.
Branch all1 set up to track remote branch all1 from upstream.
Branch all2 set up to track remote branch all2 from upstream.
Branch master2 set up to track remote branch master2 from upstream.

ok 10 - push -u --all

expecting success: 
	git checkout -b headbranch &&
	git push -u upstream HEAD &&
	check_config headbranch upstream refs/heads/headbranch
Branch headbranch set up to track remote branch headbranch from upstream.

ok 11 - push -u HEAD

expecting success: 
	ensure_fresh_upstream &&

	test_terminal git push -u upstream master >out 2>err &&
	grep "Writing objects" err

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/
Writing objects:  33% (1/3)   Writing objects:  66% (2/3)   Writing objects: 100% (3/3)   Writing objects: 100% (3/3), 219 bytes, done.

ok 12 - progress messages go to tty

expecting success: 
	ensure_fresh_upstream &&

	# skip progress messages, since stderr is non-tty
	git push -u upstream master >out 2>err &&
	! grep "Writing objects" err
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/

ok 13 - progress messages do not go to non-tty

expecting success: 
	ensure_fresh_upstream &&

	# force progress messages to stderr, even though it is non-tty
	git push -u --progress upstream master >out 2>err &&
	grep "Writing objects" err

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/
Writing objects:  33% (1/3)   Writing objects:  66% (2/3)   Writing objects: 100% (3/3)   Writing objects: 100% (3/3), 219 bytes, done.

ok 14 - progress messages go to non-tty (forced)

expecting success: 
	ensure_fresh_upstream &&

	test_terminal git push -u -q upstream master >out 2>err &&
	! grep "Writing objects" err

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/
ok 15 - push -q suppresses progress
checking known breakage: 
	ensure_fresh_upstream &&

	test_terminal git push -u --no-progress upstream master >out 2>err &&
	! grep "Writing objects" err
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5523-push-upstream/parent/
Writing objects:  33% (1/3)   Writing objects:  66% (2/3)   Writing objects: 100% (3/3)   Writing objects: 100% (3/3), 219 bytes, done.

not ok 16 - push --no-progress suppresses progress # TODO known breakage

# still have 1 known breakage(s)
# passed all remaining 15 test(s)
1..16
