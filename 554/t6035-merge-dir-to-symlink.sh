ok 1 - create a commit where dir a/b changed to symlink
not ok - 2 keep a/b-2/c/d across checkout
#	
#		git checkout HEAD^0 &&
#		git reset --hard master &&
#		git rm --cached a/b &&
#		git commit -m "untracked symlink remains" &&
#		 git checkout start^0 &&
#		 test -f a/b-2/c/d
#	
ok 3 - checkout should not have deleted a/b-2/c/d
ok 4 - setup for merge test
ok 5 - Handle D/F conflict, do not lose a/b-2/c/d in merge (resolve)
ok 6 - Handle D/F conflict, do not lose a/b-2/c/d in merge (recursive)
ok 7 - Handle F/D conflict, do not lose a/b-2/c/d in merge (resolve)
ok 8 - Handle F/D conflict, do not lose a/b-2/c/d in merge (recursive)
not ok 9 - do not lose untracked in merge (resolve) # TODO known breakage
ok 10 - do not lose untracked in merge (recursive)
ok 11 - do not lose modifications in merge (resolve)
ok 12 - do not lose modifications in merge (recursive)
ok 13 - setup a merge where dir a/b-2 changed to symlink
ok 14 - merge should not have D/F conflicts (resolve)
ok 15 - merge should not have D/F conflicts (recursive)
ok 16 - merge should not have F/D conflicts (recursive)
# still have 1 known breakage(s)
# failed 1 among remaining 15 test(s)
1..16
