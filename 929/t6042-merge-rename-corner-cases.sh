ok 1 - setup rename/delete + untracked file
ok 2 - Does git preserve Gollum's precious artifact?
ok 3 - setup rename/modify/add-source conflict
not ok 4 - rename/modify/add-source conflict resolvable # TODO known breakage
ok 5 - setup resolvable conflict missed if rename missed
not ok 6 - conflict caused if rename not detected # TODO known breakage
ok 7 - setup conflict resolved wrong if rename missed
not ok 8 - missed conflict if rename not detected # TODO known breakage
ok 9 - setup undetected rename/add-source causes data loss
not ok 10 - detect rename/add-source and preserve all data # TODO known breakage
not ok 11 - detect rename/add-source and preserve all data, merge other way # TODO known breakage
ok 12 - setup content merge + rename/directory conflict
ok 13 - rename/directory conflict + clean content merge
ok 14 - rename/directory conflict + content merge conflict
ok 15 - setup content merge + rename/directory conflict w/ disappearing dir
ok 16 - disappearing dir in rename/directory conflict handled
ok 17 - setup rename/rename(1to2)/add-source conflict
not ok 18 - detect conflict with rename/rename(1to2)/add-source merge # TODO known breakage
ok 19 - setup rename/rename(1to2)/add-source resolvable conflict
not ok 20 - rename/rename/add-source still tracks new a file # TODO known breakage
ok 21 - setup rename/rename(1to2)/add-dest conflict
ok 22 - rename/rename/add-dest merge still knows about conflicting file versions
ok 23 - setup simple rename/rename (1to2) conflict
ok 24 - merge has correct working tree contents
ok 25 - setup rename/rename (2to1) + modify/modify
ok 26 - handle rename/rename (2to1) conflict correctly
# still have 7 known breakage(s)
# passed all remaining 19 test(s)
1..26
