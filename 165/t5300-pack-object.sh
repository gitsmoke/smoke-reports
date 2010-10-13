ok 1 - setup
ok 2 - pack without delta
ok 3 - unpack without delta
ok 4 - check unpack without delta
ok 5 - pack with REF_DELTA
ok 6 - unpack with REF_DELTA
ok 7 - check unpack with REF_DELTA
ok 8 - pack with OFS_DELTA
ok 9 - unpack with OFS_DELTA
ok 10 - check unpack with OFS_DELTA
ok 11 - compare delta flavors
ok 12 - use packed objects
ok 13 - use packed deltified (REF_DELTA) objects
ok 14 - use packed deltified (OFS_DELTA) objects
ok 15 - survive missing objects/pack directory
ok 16 - verify pack
ok 17 - verify pack -v
ok 18 - verify-pack catches mismatched .idx and .pack files
ok 19 - verify-pack catches a corrupted pack signature
ok 20 - verify-pack catches a corrupted pack version
ok 21 - verify-pack catches a corrupted type/size of the 1st packed object data
ok 22 - verify-pack catches a corrupted sum of the index file itself
ok 23 - build pack index for an existing pack
ok 24 - unpacking with --strict
ok 25 - index-pack with --strict
ok 26 - honor pack.packSizeLimit
ok 27 - verify resulting packs
ok 28 - tolerate packsizelimit smaller than biggest object
ok 29 - verify resulting packs
ok 30 - fake a SHA1 hash collision
ok 31 - make sure index-pack detects the SHA1 collision
# passed all 31 test(s)
1..31
