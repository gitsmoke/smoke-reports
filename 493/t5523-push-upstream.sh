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
ok 12 # skip progress messages go to tty (missing TTY)
ok 13 - progress messages do not go to non-tty
ok 14 - progress messages go to non-tty (forced)
ok 15 # skip push -q suppresses progress (missing TTY)
ok 16 # skip push --no-progress suppresses progress (missing TTY)
# passed all 16 test(s)
1..16
