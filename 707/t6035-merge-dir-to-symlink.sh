ok 1 - create a commit where dir a/b changed to symlink
ok 2 - checkout does not clobber untracked symlink
ok 3 - a/b-2/c/d is kept when clobbering symlink b
ok 4 - checkout should not have deleted a/b-2/c/d
ok 5 - setup for merge test
ok 6 - Handle D/F conflict, do not lose a/b-2/c/d in merge (resolve)
ok 7 - Handle D/F conflict, do not lose a/b-2/c/d in merge (recursive)
ok 8 - Handle F/D conflict, do not lose a/b-2/c/d in merge (resolve)
ok 9 - Handle F/D conflict, do not lose a/b-2/c/d in merge (recursive)
not ok 10 - do not lose untracked in merge (resolve) # TODO known breakage
ok 11 - do not lose untracked in merge (recursive)
ok 12 - do not lose modifications in merge (resolve)
ok 13 - do not lose modifications in merge (recursive)
ok 14 - setup a merge where dir a/b-2 changed to symlink
ok 15 - merge should not have D/F conflicts (resolve)
ok 16 - merge should not have D/F conflicts (recursive)
ok 17 - merge should not have F/D conflicts (recursive)
# still have 1 known breakage(s)
# passed all remaining 16 test(s)
1..17
