ok 1 - setup
ok 2 - reset --merge is ok with changes in file it does not touch
ok 3 - reset --merge is ok when switching back
ok 4 - reset --keep is ok with changes in file it does not touch
ok 5 - reset --keep is ok when switching back
ok 6 - reset --merge discards changes added to index (1)
ok 7 - reset --merge is ok again when switching back (1)
ok 8 - reset --keep fails with changes in index in files it touches
ok 9 - reset --merge discards changes added to index (2)
ok 10 - reset --merge is ok again when switching back (2)
ok 11 - reset --keep keeps changes it does not touch
ok 12 - reset --keep keeps changes when switching back
ok 13 - reset --merge fails with changes in file it touches
ok 14 - reset --keep fails with changes in file it touches
ok 15 - setup 3 different branches
ok 16 - "reset --merge HEAD^" is ok with pending merge
ok 17 - "reset --keep HEAD^" fails with pending merge
ok 18 - "reset --merge HEAD" is ok with pending merge
ok 19 - "reset --keep HEAD" fails with pending merge
ok 20 - --merge is ok with added/deleted merge
ok 21 - --keep fails with added/deleted merge
# passed all 21 test(s)
1..21
