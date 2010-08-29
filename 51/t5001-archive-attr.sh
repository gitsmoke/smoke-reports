ok 1 - setup
ok 2 - git archive
ok 3 -  archive/ignored does not exist
ok 4 -  archive/ignored-by-tree does not exist
ok 5 -  archive/ignored-by-worktree exists
ok 6 - git archive with worktree attributes
ok 7 -  worktree/ignored does not exist
ok 8 -  worktree/ignored-by-tree exists
ok 9 -  worktree/ignored-by-worktree does not exist
ok 10 - git archive vs. bare
ok 11 - git archive with worktree attributes, bare
ok 12 -  bare-worktree/ignored does not exist
ok 13 -  bare-worktree/ignored-by-tree exists
ok 14 -  bare-worktree/ignored-by-worktree exists
not ok - 15 export-subst
#	
#		git log "--pretty=format:A${SUBSTFORMAT}O" HEAD >substfile1.expected &&
#		test_cmp nosubstfile archive/nosubstfile &&
#		test_cmp substfile1.expected archive/substfile1 &&
#		test_cmp substfile2 archive/substfile2
#	
ok 16 - git tar-tree vs. git archive with worktree attributes
ok 17 - git tar-tree vs. git archive with worktree attrs, bare
# failed 1 among 17 test(s)
1..17
