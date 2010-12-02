ok 1 - create a commit where dir a/b changed to symlink
ok 2 - keep a/b-2/c/d across checkout
ok 3 - checkout should not have deleted a/b-2/c/d
ok 4 - setup for merge test
ok 5 - Handle D/F conflict, do not lose a/b-2/c/d in merge (resolve)
not ok - 6 Handle D/F conflict, do not lose a/b-2/c/d in merge (recursive)
#	
#		git reset --hard &&
#		git checkout baseline^0 &&
#		git merge -s recursive master &&
#		test -h a/b &&
#		test -f a/b-2/c/d
#	
ok 7 - Handle F/D conflict, do not lose a/b-2/c/d in merge (resolve)
not ok - 8 Handle F/D conflict, do not lose a/b-2/c/d in merge (recursive)
#	
#		git reset --hard &&
#		git checkout master^0 &&
#		git merge -s recursive baseline^0 &&
#		test -h a/b &&
#		test -f a/b-2/c/d
#	
not ok 9 - do not lose untracked in merge (resolve) # TODO known breakage
ok 10 - do not lose untracked in merge (recursive)
ok 11 - do not lose modifications in merge (resolve)
ok 12 - do not lose modifications in merge (recursive)
ok 13 - setup a merge where dir a/b-2 changed to symlink
ok 14 - merge should not have D/F conflicts (resolve)
not ok - 15 merge should not have D/F conflicts (recursive)
#	
#		git reset --hard &&
#		git checkout baseline^0 &&
#		git merge -s recursive test2 &&
#		test -h a/b-2 &&
#		test -f a/b/c/d
#	
not ok - 16 merge should not have F/D conflicts (recursive)
#	
#		git reset --hard &&
#		git checkout -b foo test2 &&
#		git merge -s recursive baseline^0 &&
#		test -h a/b-2 &&
#		test -f a/b/c/d
#	
# still have 1 known breakage(s)
# failed 4 among remaining 15 test(s)
1..16
