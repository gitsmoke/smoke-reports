ok 1 - initial setup validation
ok 2 - create corruption in header of first object
ok 3 - ... but having a loose copy allows for full recovery
ok 4 - ... and loose copy of first delta allows for partial recovery
ok 5 - create corruption in data of first object
ok 6 - ... but having a loose copy allows for full recovery
ok 7 - ... and loose copy of second object allows for partial recovery
ok 8 - create corruption in header of first delta
ok 9 - ... but having a loose copy allows for full recovery
ok 10 - ... and then a repack "clears" the corruption
ok 11 - create corruption in data of first delta
ok 12 - ... but having a loose copy allows for full recovery
ok 13 - ... and then a repack "clears" the corruption
ok 14 - corruption in delta base reference of first delta (OBJ_REF_DELTA)
ok 15 - ... but having a loose copy allows for full recovery
ok 16 - ... and then a repack "clears" the corruption
ok 17 - corruption #0 in delta base reference of first delta (OBJ_OFS_DELTA)
ok 18 - ... but having a loose copy allows for full recovery
ok 19 - ... and then a repack "clears" the corruption
ok 20 - corruption #1 in delta base reference of first delta (OBJ_OFS_DELTA)
ok 21 - ... but having a loose copy allows for full recovery
ok 22 - ... and then a repack "clears" the corruption
ok 23 - ... and a redundant pack allows for full recovery too
ok 24 - corrupting header to have too small output buffer fails unpack
# passed all 24 test(s)
1..24
