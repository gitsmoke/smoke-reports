define NO_SVN_TESTS to skip git svn tests
# UTF-8 locale not set, some tests skipped ()
ok 1 - initialize git svn
ok 2 - import an SVN revision into git
ok 3 - checkout from svn
ok 4 - try a deep --rmdir with a commit
ok 5 - detect node change from file to directory #1
ok 6 - detect node change from directory to file #1
ok 7 - detect node change from file to directory #2
ok 8 - detect node change from directory to file #2
ok 9 - remove executable bit from a file
ok 10 - add executable bit back file
ok 11 - executable file becomes a symlink to bar/zzz (file)
ok 12 - new symlink is added to a file that was also just made executable
ok 13 - modify a symlink to become a file
ok 14 # skip commit with UTF-8 message: locale:  (missing UTF8)
ok 15 - test fetch functionality (svn => git) with alternate GIT_SVN_ID
ok 16 - check imported tree checksums expected tree checksums
ok 17 - exit if remote refs are ambigious
not ok - 18 exit if init-ing a would clobber a URL
#	
#	        svnadmin create "${PWD}/svnrepo2" &&
#	        svn mkdir -m "mkdir bar" "${svnrepo}2/bar" &&
#	        git config --unset svn-remote.svn.fetch \
#	                                "^bar:refs/${remotes_git_svn}$" &&
#		test_must_fail git svn init "${svnrepo}2/bar"
#	        
not ok - 19 init allows us to connect to another directory in the same repo
#	
#	        git svn init --minimize-url -i bar "$svnrepo/bar" &&
#	        git config --get svn-remote.svn.fetch \
#	                              "^bar:refs/remotes/bar$" &&
#	        git config --get svn-remote.svn.fetch \
#	                              "^:refs/${remotes_git_svn}$"
#	        
not ok - 20 dcommit $rev does not clobber current branch
#	
#		git svn fetch -i bar &&
#		git checkout -b my-bar refs/remotes/bar &&
#		echo 1 > foo &&
#		git add foo &&
#		git commit -m "change 1" &&
#		echo 2 > foo &&
#		git add foo &&
#		git commit -m "change 2" &&
#		old_head=$(git rev-parse HEAD) &&
#		git svn dcommit -i bar HEAD^ &&
#		test $old_head = $(git rev-parse HEAD) &&
#		test refs/heads/my-bar = $(git symbolic-ref HEAD) &&
#		git log refs/remotes/bar | grep "change 1" &&
#		! git log refs/remotes/bar | grep "change 2" &&
#		git checkout master &&
#		git branch -D my-bar
#		
not ok - 21 able to dcommit to a subdirectory
#	
#		git svn fetch -i bar &&
#		git checkout -b my-bar refs/remotes/bar &&
#		echo abc > d &&
#		git update-index --add d &&
#		git commit -m '/bar/d should be in the log' &&
#		git svn dcommit -i bar &&
#		test -z "`git diff refs/heads/my-bar refs/remotes/bar`" &&
#		mkdir newdir &&
#		echo new > newdir/dir &&
#		git update-index --add newdir/dir &&
#		git commit -m 'add a new directory' &&
#		git svn dcommit -i bar &&
#		test -z "`git diff refs/heads/my-bar refs/remotes/bar`" &&
#		echo foo >> newdir/dir &&
#		git update-index newdir/dir &&
#		git commit -m 'modify a file in new directory' &&
#		git svn dcommit -i bar &&
#		test -z "`git diff refs/heads/my-bar refs/remotes/bar`"
#		
not ok - 22 dcommit should not fail with a touched file
#	
#		test_commit "commit-new-file-foo2" foo2 &&
#		test-chmtime =-60 foo &&
#		git svn dcommit
#	
not ok - 23 rebase should not fail with a touched file
#	
#		test-chmtime =-60 foo &&
#		git svn rebase
#	
not ok - 24 able to set-tree to a subdirectory
#	
#		echo cba > d &&
#		git update-index d &&
#		git commit -m 'update /bar/d' &&
#		git svn set-tree -i bar HEAD &&
#		test -z "`git diff refs/heads/my-bar refs/remotes/bar`"
#		
ok 25 - git-svn works in a bare repository
# failed 7 among 25 test(s)
1..25
