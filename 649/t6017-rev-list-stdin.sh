ok 1 - setup
ok 2 - check rev-list master
ok 3 - check log --stat master
ok 4 - check rev-list side-1 ^side-4
ok 5 - check log --stat side-1 ^side-4
ok 6 - check rev-list side-1 ^side-7 --
ok 7 - check log --stat side-1 ^side-7 --
ok 8 - check rev-list side-1 ^side-7 -- file-1
ok 9 - check log --stat side-1 ^side-7 -- file-1
ok 10 - check rev-list side-1 ^side-7 -- file-2
ok 11 - check log --stat side-1 ^side-7 -- file-2
ok 12 - check rev-list side-3 ^side-4 -- file-3
ok 13 - check log --stat side-3 ^side-4 -- file-3
ok 14 - check rev-list side-3 ^side-2
ok 15 - check log --stat side-3 ^side-2
ok 16 - check rev-list side-3 ^side-2 -- file-1
ok 17 - check log --stat side-3 ^side-2 -- file-1
# passed all 17 test(s)
1..17
