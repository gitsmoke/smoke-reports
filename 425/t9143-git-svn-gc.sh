Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9143-git-svn-gc/.git/
expecting success: 
	mkdir import &&
	mkdir tmp &&
	echo "Sample text for Subversion repository." > import/test.txt &&
	svn_cmd import -m "import for git svn" import "$svnrepo" > /dev/null
	

ok 1 - setup directories and test repo

expecting success: svn_cmd co "$svnrepo" test_wc
A    test_wc/test.txt
Checked out revision 1.

ok 2 - checkout working copy from svn

expecting success: 
	(
		cd test_wc &&
		svn_cmd propset foo bar test.txt &&
		svn_cmd commit -m "property set"
	)
property 'foo' set on 'test.txt'
Sending        test.txt

Committed revision 2.

ok 3 - set some properties to create an unhandled.log file
expecting success: git svn init "$svnrepo"

ok 4 - Setup repo

expecting success: git svn fetch
	A	test.txt
r1 = 5388400ac090516e786ef458cde0b37803158e52 (refs/remotes/git-svn)
	M	test.txt
r2 = 554204ab73abdbb6eb45a7cbae27b3cc5fc1198f (refs/remotes/git-svn)

ok 5 - Fetch repo

expecting success: 
	 cp .git/svn/refs/remotes/git-svn/unhandled.log tmp
	

ok 6 - make backup copy of unhandled.log

expecting success: > .git/svn/refs/remotes/git-svn/index

ok 7 - create leftover index

expecting success: git svn gc
ok 8 - git svn gc runs
expecting success: ! test -f .git/svn/refs/remotes/git-svn/index

ok 9 - git svn index removed

expecting success: 
		 gunzip .git/svn/refs/remotes/git-svn/unhandled.log.gz
		

ok 10 - git svn gc produces a valid gzip file

expecting success: 
	 test_cmp .git/svn/refs/remotes/git-svn/unhandled.log tmp/unhandled.log
	

ok 11 - git svn gc does not change unhandled.log files

# passed all 11 test(s)
1..11
