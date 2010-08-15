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
ok 15 - rerere clear
ok 16 - clear removed the directory
ok 17 - garbage collection (part1)
ok 18 - young records still live
ok 19 - garbage collection (part2)
ok 20 - old records rest in peace
ok 21 - file2 added differently in two branches
ok 22 - resolution was recorded properly
ok 23 - rerere.autoupdate
ok 24 - merge --rerere-autoupdate
ok 25 - merge --no-rerere-autoupdate
# passed all 25 test(s)
1..25
