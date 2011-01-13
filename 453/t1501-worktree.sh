ok 1 - setup
ok 2 - setup: helper for testing rev-parse
ok 3 - setup: core.worktree = relative path
ok 4 - outside
ok 5 - inside work tree
not ok 6 - empty prefix is actually written out # TODO known breakage
ok 7 - subdir of work tree
ok 8 - setup: core.worktree = absolute path
ok 9 - outside
ok 10 - inside work tree
ok 11 - subdir of work tree
ok 12 - setup: GIT_WORK_TREE=relative (override core.worktree)
ok 13 - outside
ok 14 - inside work tree
ok 15 - subdir of work tree
ok 16 - setup: GIT_WORK_TREE=absolute, below git dir
ok 17 - outside
ok 18 - in repo.git
ok 19 - inside work tree
ok 20 - subdir of work tree
ok 21 - find work tree from repo
ok 22 - find work tree from work tree
ok 23 - _gently() groks relative GIT_DIR & GIT_WORK_TREE
ok 24 - diff-index respects work tree under .git dir
ok 25 - diff-files respects work tree under .git dir
ok 26 - git diff respects work tree under .git dir
ok 27 - git grep
ok 28 - git commit
ok 29 - absolute pathspec should fail gracefully
ok 30 - make_relative_path handles double slashes in GIT_DIR
not ok - 31 relative $GIT_WORK_TREE and git subprocesses
#	
#		GIT_DIR=repo.git GIT_WORK_TREE=repo.git/work \
#		test-subprocess --setup-work-tree rev-parse --show-toplevel >actual &&
#		echo "$(pwd)/repo.git/work" >expected &&
#		test_cmp expected actual
#	
# still have 1 known breakage(s)
# failed 1 among remaining 30 test(s)
1..31
