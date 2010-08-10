ok 1 - setup
ok 2 - nothing recorded without rerere
ok 3 - activate rerere, old style (conflicting merge)
ok 4 - rerere.enabled works, too
ok 5 - set up rr-cache
ok 6 - rr-cache looks sane
ok 7 - rerere diff
ok 8 - rerere status
ok 9 - first postimage wins
ok 10 - rerere updates postimage timestamp
ok 11 - rerere clear
ok 12 - set up for garbage collection tests
ok 13 - garbage collection preserves young records
ok 14 - old records rest in peace
ok 15 - setup: file2 added differently in two branches
ok 16 - resolution was recorded properly
ok 17 - rerere.autoupdate
ok 18 - merge --rerere-autoupdate
ok 19 - merge --no-rerere-autoupdate
ok 20 - set up an unresolved merge
ok 21 - explicit rerere
ok 22 - explicit rerere with autoupdate
ok 23 - explicit rerere --rerere-autoupdate overrides
ok 24 - rerere --no-no-rerere-autoupdate
ok 25 - rerere -h
# passed all 25 test(s)
1..25
