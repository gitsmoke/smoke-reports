ok 1 - setup
ok 2 - pack-objects with index version 1
ok 3 - pack-objects with index version 2
ok 4 - both packs should be identical
ok 5 - index v1 and index v2 should be different
ok 6 - index-pack with index version 1
ok 7 - index-pack with index version 2
ok 8 - index-pack results should match pack-objects ones
ok 9 - index v2: force some 64-bit offsets with pack-objects
ok 10 - index v2: verify a pack with some 64-bit offsets
ok 11 - 64-bit offsets: should be different from previous index v2 results
ok 12 - index v2: force some 64-bit offsets with index-pack
ok 13 - 64-bit offsets: index-pack result should match pack-objects one
ok 14 - [index v1] 1) stream pack to repository
ok 15 - [index v1] 2) create a stealth corruption in a delta base reference
ok 16 - [index v1] 3) corrupted delta happily returned wrong data
ok 17 - [index v1] 4) confirm that the pack is actually corrupted
ok 18 - [index v1] 5) pack-objects happily reuses corrupted data
ok 19 - [index v1] 6) newly created pack is BAD !
ok 20 - [index v2] 1) stream pack to repository
ok 21 - [index v2] 2) create a stealth corruption in a delta base reference
ok 22 - [index v2] 3) corrupted delta happily returned wrong data
ok 23 - [index v2] 4) confirm that the pack is actually corrupted
ok 24 - [index v2] 5) pack-objects refuses to reuse corrupted data
ok 25 - [index v2] 6) verify-pack detects CRC mismatch
ok 26 - running index-pack in the object store
# passed all 26 test(s)
1..26
