Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
expecting success: create_test_files &&
     create_new_pack &&
     git prune-packed &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 1 - initial setup validation

expecting success: do_corrupt_object $blob_1 0 < zero &&
     test_must_fail git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null

ok 2 - create corruption in header of first object

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_1 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
06686a2094b7518d92cd6e26efaab209b398ebd3

ok 3 - ... but having a loose copy allows for full recovery

expecting success: git prune-packed &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     test_must_fail git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807
ok 4 - ... and loose copy of first delta allows for partial recovery

expecting success: create_new_pack &&
     git prune-packed &&
     chmod +w ${pack}.pack &&
     perl -i.bak -pe "s/ base /abcdef/" ${pack}.pack &&
     test_must_fail git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 5 - create corruption in data of first object

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_1 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
06686a2094b7518d92cd6e26efaab209b398ebd3

ok 6 - ... but having a loose copy allows for full recovery

expecting success: git prune-packed &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     test_must_fail git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807
ok 7 - ... and loose copy of second object allows for partial recovery
expecting success: create_new_pack &&
     git prune-packed &&
     do_corrupt_object $blob_2 0 < zero &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 8 - create corruption in header of first delta

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807

ok 9 - ... but having a loose copy allows for full recovery

expecting success: do_repack &&
     git prune-packed &&
     git verify-pack ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
ok 10 - ... and then a repack "clears" the corruption

expecting success: create_new_pack &&
     git prune-packed &&
     chmod +w ${pack}.pack &&
     perl -i.bak -pe "s/ delta1 /abcdefgh/" ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 11 - create corruption in data of first delta

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807

ok 12 - ... but having a loose copy allows for full recovery

expecting success: do_repack &&
     git prune-packed &&
     git verify-pack ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null

ok 13 - ... and then a repack "clears" the corruption

expecting success: create_new_pack &&
     git prune-packed &&
     do_corrupt_object $blob_2 2 < zero &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok
ok 14 - corruption in delta base reference of first delta (OBJ_REF_DELTA)

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807
ok 15 - ... but having a loose copy allows for full recovery
expecting success: do_repack &&
     git prune-packed &&
     git verify-pack ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null

ok 16 - ... and then a repack "clears" the corruption

expecting success: create_new_pack --delta-base-offset &&
     git prune-packed &&
     do_corrupt_object $blob_2 2 < zero &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 183 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 132 2215 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 17 - corruption #0 in delta base reference of first delta (OBJ_OFS_DELTA)

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807

ok 18 - ... but having a loose copy allows for full recovery

expecting success: do_repack --delta-base-offset &&
     git prune-packed &&
     git verify-pack ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null

ok 19 - ... and then a repack "clears" the corruption

expecting success: create_new_pack --delta-base-offset &&
     git prune-packed &&
     printf "" | do_corrupt_object $blob_2 2 &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 183 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 132 2215 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok

ok 20 - corruption #1 in delta base reference of first delta (OBJ_OFS_DELTA)

expecting success: mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_2 &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
30fd6590c6df999b5a77622491bee8cb1b96d807
ok 21 - ... but having a loose copy allows for full recovery
expecting success: do_repack --delta-base-offset &&
     git prune-packed &&
     git verify-pack ${pack}.pack &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
ok 22 - ... and then a repack "clears" the corruption

expecting success: do_corrupt_object $blob_2 2 < zero &&
     git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null &&
     mv ${pack}.idx tmp &&
     git hash-object -t blob -w file_1 &&
     git hash-object -t blob -w file_2 &&
     printf "$blob_1
$blob_2
" | git pack-objects .git/objects/pack/pack &&
     git prune-packed &&
     mv tmp ${pack}.idx &&
     git cat-file blob $blob_1 > /dev/null &&
     git cat-file blob $blob_2 > /dev/null &&
     git cat-file blob $blob_3 > /dev/null
06686a2094b7518d92cd6e26efaab209b398ebd3
30fd6590c6df999b5a77622491bee8cb1b96d807
0834005eacb4260088f6e5f162d8ffacea1be970

ok 23 - ... and a redundant pack allows for full recovery too

expecting success: create_new_pack &&
     git prune-packed &&
     printf "\262" | do_corrupt_object $blob_1 0 &&
     test_must_fail git cat-file blob $blob_1 > /dev/null &&
     test_must_fail git cat-file blob $blob_2 > /dev/null &&
     test_must_fail git cat-file blob $blob_3 > /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5303-pack-corruption-resilience/.git/
06686a2094b7518d92cd6e26efaab209b398ebd3 blob   2007 2020 12
30fd6590c6df999b5a77622491bee8cb1b96d807 blob   168 201 2032 1 06686a2094b7518d92cd6e26efaab209b398ebd3
44cc0b565eca87cf836116abe0f9e2ff4fd0b0a4 blob   117 150 2233 2 30fd6590c6df999b5a77622491bee8cb1b96d807
non delta: 1 object
chain length = 1: 1 object
chain length = 2: 1 object
.git/objects/pack/pack-b8d1e04fc992cfbdb3ab72cf7abbf08cce8b1900.pack: ok
ok 24 - corrupting header to have too small output buffer fails unpack

# passed all 24 test(s)
1..24
