Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9121-git-svn-fetch-renamed-dir/.git/
expecting success: 
	svnadmin load -q "$rawsvnrepo" < "$TEST_DIRECTORY"/t9121/renamed-dir.dump
	

ok 1 - load repository with renamed directory
expecting success: 
	git svn init "$svnrepo/newname" &&
	git svn fetch
	
	A	a.txt
r2 = 4128bdb9e7e2b32be85a00b41941ca90e4a1abdc (refs/remotes/git-svn)

ok 2 - init and fetch repository

# passed all 2 test(s)
1..2
