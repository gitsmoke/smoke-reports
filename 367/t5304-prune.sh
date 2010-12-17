ok 1 - setup
ok 2 - prune stale packs
ok 3 - prune --expire
ok 4 - gc: implicit prune --expire
ok 5 - gc: refuse to start with invalid gc.pruneExpire
ok 6 - gc: start with ok gc.pruneExpire
ok 7 - prune: prune nonsense parameters
ok 8 - prune: prune unreachable heads
ok 9 - prune: do not prune heads listed as an argument
ok 10 - gc --no-prune
ok 11 - gc respects gc.pruneExpire
ok 12 - gc --prune=<date>
ok 13 - gc --prune=never
ok 14 - gc respects gc.pruneExpire=never
ok 15 - prune --expire=never
ok 16 - gc: prune old objects after local clone
# passed all 16 test(s)
1..16
