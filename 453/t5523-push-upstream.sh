ok 1 - set up terminal for tests
ok 2 - setup bare parent
ok 3 - setup local commit
ok 4 - push -u master:master
ok 5 - push -u master:other
ok 6 - push -u --dry-run master:otherX
ok 7 - push -u master2:master2
ok 8 - push -u master2:other2
ok 9 - push -u :master2
ok 10 - push -u --all
ok 11 - push -u HEAD
ok 12 - progress messages go to tty
ok 13 - progress messages do not go to non-tty
not ok - 14 progress messages go to non-tty (forced)
#	
#		ensure_fresh_upstream &&
#	
#		# force progress messages to stderr, even though it is non-tty
#		git push -u --progress upstream master >out 2>err &&
#		grep "Writing objects" err
#	
ok 15 - push -q suppresses progress
not ok 16 - push --no-progress suppresses progress # TODO known breakage
# still have 1 known breakage(s)
# failed 1 among remaining 15 test(s)
1..16
