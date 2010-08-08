ok 1 - setup
ok 2 - nothing recorded without rerere
ok 3 - conflicting merge
ok 4 - recorded preimage
ok 5 - rerere.enabled works, too
ok 6 - no postimage or thisimage yet
ok 7 - preimage has right number of lines
ok 8 - rerere diff
ok 9 - rerere status
ok 10 - commit succeeds
ok 11 - recorded postimage
ok 12 - another conflicting merge
ok 13 - rerere kicked in
ok 14 - rerere prefers first change
ok 15 - rerere updates postimage timestamp
ok 16 - rerere clear
ok 17 - clear removed the directory
ok 18 - garbage collection (part1)
ok 19 - young or recently used records still live
ok 20 - garbage collection (part2)
ok 21 - old records rest in peace
ok 22 - file2 added differently in two branches
ok 23 - resolution was recorded properly
ok 24 - rerere.autoupdate
ok 25 - merge --rerere-autoupdate
ok 26 - merge --no-rerere-autoupdate
# passed all 26 test(s)
1..26
