ok 1 - output summary format
not ok - 2 output summary format for commit with an empty diff
#	
#	
#		check_summary_oneline "" "empty" "--allow-empty"
#	
not ok - 3 output summary format for merges
#	
#	
#		git checkout -b recursive-base &&
#		test_commit base file1 &&
#	
#		git checkout -b recursive-a recursive-base &&
#		test_commit commit-a file1 &&
#	
#		git checkout -b recursive-b recursive-base &&
#		test_commit commit-b file1 &&
#	
#		# conflict
#		git checkout recursive-a &&
#		test_must_fail git merge recursive-b &&
#		# resolve the conflict
#		echo commit-a > file1 &&
#		git add file1 &&
#		check_summary_oneline "" "Merge"
#	
ok 4 - the basics
ok 5 - partial
ok 6 - partial modification in a subdirectory
ok 7 - partial removal
ok 8 - sign off
ok 9 - multiple -m
ok 10 - verbose
ok 11 - verbose respects diff config
ok 12 - cleanup commit messages (verbatim,-t)
ok 13 - cleanup commit messages (verbatim,-F)
ok 14 - cleanup commit messages (verbatim,-m)
ok 15 - cleanup commit messages (whitespace,-F)
ok 16 - cleanup commit messages (strip,-F)
ok 17 - cleanup commit messages (strip,-F,-e)
ok 18 - author different from committer
ok 19 - committer is automatic
ok 20 - do not fire editor in the presence of conflicts
ok 21 # skip a SIGTERM should break locks (missing EXECKEEPSPID of EXECKEEPSPID)
ok 22 - Hand committing of a redundant merge removes dups
ok 23 - A single-liner subject with a token plus colon is not a footer
ok 24 - commit
ok 25 - commit
ok 26 - commit --status
ok 27 - commit --no-status
ok 28 - commit with commit.status = yes
ok 29 - commit with commit.status = no
ok 30 - commit --status with commit.status = yes
ok 31 - commit --no-status with commit.status = yes
ok 32 - commit --status with commit.status = no
ok 33 - commit --no-status with commit.status = no
ok 34 - commit
ok 35 - commit
ok 36 - commit --status
ok 37 - commit --no-status
ok 38 - commit with commit.status = yes
ok 39 - commit with commit.status = no
ok 40 - commit --status with commit.status = yes
ok 41 - commit --no-status with commit.status = yes
ok 42 - commit --status with commit.status = no
ok 43 - commit --no-status with commit.status = no
# failed 2 among 43 test(s)
1..43
