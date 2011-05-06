ok 1 - setup
ok 2 - checkout from non-existing branch
ok 3 - checkout with dirty tree without -m
ok 4 - checkout with unrelated dirty tree without -m
ok 5 - checkout -m with dirty tree
ok 6 - checkout -m with dirty tree, renamed
ok 7 - checkout -m with merge conflict
ok 8 - format of merge conflict from checkout -m
ok 9 - checkout --merge --conflict=diff3 <branch>
ok 10 - checkout to detach HEAD (with advice declined)
ok 11 - checkout to detach HEAD
ok 12 - checkout to detach HEAD with branchname^
ok 13 - checkout to detach HEAD with :/message
ok 14 - checkout to detach HEAD with HEAD^0
ok 15 - checkout with ambiguous tag/branch names
ok 16 - checkout with ambiguous tag/branch names
ok 17 - switch branches while in subdirectory
ok 18 - checkout specific path while in subdirectory
ok 19 - checkout w/--track sets up tracking
ok 20 - checkout w/autosetupmerge=always sets up tracking
ok 21 - checkout w/--track from non-branch HEAD fails
ok 22 - checkout w/--track from tag fails
ok 23 - detach a symbolic link HEAD
ok 24 - checkout with --track fakes a sensible -b <name>
ok 25 - checkout with --track, but without -b, fails with too short tracked name
ok 26 - checkout an unmerged path should fail
ok 27 - checkout with an unmerged path can be ignored
ok 28 - checkout unmerged stage
ok 29 - checkout with --merge
ok 30 - checkout with --merge, in diff3 -m style
ok 31 - checkout --conflict=merge, overriding config
ok 32 - checkout --conflict=diff3
ok 33 - failing checkout -b should not break working tree
ok 34 - switch out of non-branch
ok 35 - custom merge driver with checkout -m
# passed all 35 test(s)
1..35
