define NO_SVN_TESTS to skip git svn tests
# UTF-8 locale not set, some tests skipped (C)
ok 1 - initialize git svn
ok 2 - import an SVN revision into git
ok 3 - checkout from svn
ok 4 - try a deep --rmdir with a commit
ok 5 - detect node change from file to directory #1
ok 6 - detect node change from directory to file #1
ok 7 - detect node change from file to directory #2
ok 8 - detect node change from directory to file #2
not ok - 9 remove executable bit from a file
#	
#		rm -f "$GIT_DIR"/index &&
#		git checkout -f -b mybranch5 ${remotes_git_svn} &&
#		chmod -x exec.sh &&
#		git update-index exec.sh &&
#		git commit -m "$name" &&
#		git svn set-tree --find-copies-harder --rmdir \
#			${remotes_git_svn}..mybranch5 &&
#		svn_cmd up "$SVN_TREE" &&
#		test ! -x "$SVN_TREE"/exec.sh
not ok - 10 add executable bit back file
#	
#		chmod +x exec.sh &&
#		git update-index exec.sh &&
#		git commit -m "$name" &&
#		git svn set-tree --find-copies-harder --rmdir \
#			${remotes_git_svn}..mybranch5 &&
#		svn_cmd up "$SVN_TREE" &&
#		test -x "$SVN_TREE"/exec.sh
ok 11 - executable file becomes a symlink to bar/zzz (file)
ok 12 - new symlink is added to a file that was also just made executable
ok 13 - modify a symlink to become a file
ok 14 # skip commit with UTF-8 message: locale: C
ok 15 - test fetch functionality (svn => git) with alternate GIT_SVN_ID
not ok - 16 check imported tree checksums expected tree checksums
#	test_cmp a expected
ok 17 - exit if remote refs are ambigious
ok 18 - exit if init-ing a would clobber a URL
ok 19 - init allows us to connect to another directory in the same repo
ok 20 - dcommit $rev does not clobber current branch
ok 21 - able to dcommit to a subdirectory
ok 22 - dcommit should not fail with a touched file
ok 23 - rebase should not fail with a touched file
ok 24 - able to set-tree to a subdirectory
ok 25 - git-svn works in a bare repository
# failed 3 among 25 test(s)
1..25
