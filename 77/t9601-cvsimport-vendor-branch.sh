ok 1 - import a module with a vendor branch
ok 2 - check HEAD out of cvs repository
ok 3 - check master out of git repository
ok 4 - check a file that was imported once
not ok 5 - check a file that was imported twice # TODO known breakage
ok 6 - check a file that was imported then modified on HEAD
ok 7 - check a file that was imported, modified, then imported again
ok 8 - check a file that was added to HEAD then imported
ok 9 - a vendor branch whose tag has been removed
# still have 1 known breakage(s)
# passed all remaining 8 test(s)
1..9
