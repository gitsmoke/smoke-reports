ok 1 - adding test file NN and Z/NN
ok 2 - adding test file ND and Z/ND
ok 3 - adding test file NM and Z/NM
ok 4 - adding test file DN and Z/DN
ok 5 - adding test file DD and Z/DD
ok 6 - adding test file DM and Z/DM
ok 7 - adding test file MN and Z/MN
ok 8 - adding test file MD and Z/MD
ok 9 - adding test file MM and Z/MM
ok 10 - adding test file SS
ok 11 - adding test file TT
ok 12 - prepare initial tree
ok 13 - change in branch A (removal)
ok 14 - change in branch A (modification)
ok 15 - change in branch A (modification)
ok 16 - change in branch A (modification)
ok 17 - change in branch A (modification)
ok 18 - change in branch A (modification)
ok 19 - change in branch A (modification)
ok 20 - change in branch A (addition)
ok 21 - change in branch A (addition)
ok 22 - change in branch A (addition)
ok 23 - change in branch A (addition)
ok 24 - change in branch A (addition)
ok 25 - change in branch A (edit)
ok 26 - change in branch A (change file to directory)
ok 27 - recording branch A tree
ok 28 - reading original tree and checking out
ok 29 - change in branch B (removal)
ok 30 - change in branch B (modification)
ok 31 - change in branch B (modification)
ok 32 - change in branch B (modification)
ok 33 - change in branch B (modification)
ok 34 - change in branch B (modification)
ok 35 - change in branch B (modification)
ok 36 - change in branch B (addition)
ok 37 - change in branch B (addition)
ok 38 - change in branch B (addition)
ok 39 - change in branch B (addition)
ok 40 - change in branch B (addition and modification)
ok 41 - change in branch B (modification)
ok 42 - change in branch B (addition of a file to conflict with directory)
ok 43 - recording branch B tree
ok 44 - keep contents of 3 trees for easy access
ok 45 - 3-way merge with git read-tree -m, empty cache
ok 46 - 3-way merge with git read-tree -m, match H
ok 47 - 1 - must not have an entry not in A.
ok 48 - 2 - must match B in !O && !A && B case.
ok 49 - 2 - matching B alone is OK in !O && !A && B case.
ok 50 - 3 - must match A in !O && A && !B case.
ok 51 - 3 - matching A alone is OK in !O && A && !B case.
ok 52 - 3 (fail) - must match A in !O && A && !B case.
ok 53 - 4 - must match and be up-to-date in !O && A && B && A!=B case.
ok 54 - 4 (fail) - must match and be up-to-date in !O && A && B && A!=B case.
ok 55 - 4 (fail) - must match and be up-to-date in !O && A && B && A!=B case.
ok 56 - 5 - must match in !O && A && B && A==B case.
ok 57 - 5 - must match in !O && A && B && A==B case.
ok 58 - 5 (fail) - must match A in !O && A && B && A==B case.
ok 59 - 6 - must not exist in O && !A && !B case
ok 60 - 7 - must not exist in O && !A && B && O!=B case
ok 61 - 8 - must not exist in O && !A && B && O==B case
ok 62 - 9 - must match and be up-to-date in O && A && !B && O!=A case
ok 63 - 9 (fail) - must match and be up-to-date in O && A && !B && O!=A case
ok 64 - 9 (fail) - must match and be up-to-date in O && A && !B && O!=A case
ok 65 - 10 - must match and be up-to-date in O && A && !B && O==A case
ok 66 - 10 (fail) - must match and be up-to-date in O && A && !B && O==A case
ok 67 - 10 (fail) - must match and be up-to-date in O && A && !B && O==A case
ok 68 - 11 - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case
ok 69 - 11 (fail) - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case
ok 70 - 11 (fail) - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case
ok 71 - 12 - must match A in O && A && B && O!=A && A==B case
ok 72 - 12 - must match A in O && A && B && O!=A && A==B case
ok 73 - 12 (fail) - must match A in O && A && B && O!=A && A==B case
ok 74 - 13 - must match A in O && A && B && O!=A && O==B case
ok 75 - 13 - must match A in O && A && B && O!=A && O==B case
ok 76 - 14 - must match and be up-to-date in O && A && B && O==A && O!=B case
ok 77 - 14 - may match B in O && A && B && O==A && O!=B case
ok 78 - 14 (fail) - must match and be up-to-date in O && A && B && O==A && O!=B case
ok 79 - 14 (fail) - must match and be up-to-date in O && A && B && O==A && O!=B case
ok 80 - 15 - must match A in O && A && B && O==A && O==B case
ok 81 - 15 - must match A in O && A && B && O==A && O==B case
ok 82 - 15 (fail) - must match A in O && A && B && O==A && O==B case
ok 83 - 16 - A matches in one and B matches in another.
# passed all 83 test(s)
1..83
