Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9123-git-svn-rebuild-with-rewriteroot/.git/
expecting success: 
	git svn init --rewrite-root=http://invalid.invalid/ "$svnrepo" &&
	git svn fetch &&
	git checkout -b mybranch ${remotes_git_svn}
	
	A	foo
r1 = bfd26e523179286caecc807196aeaf1b1964ae90 (refs/remotes/git-svn)

ok 1 - init, fetch and checkout repository

expecting success: 
	rm "$GIT_SVN_DIR"/.rev_map.*
	

ok 2 - remove rev_map

expecting success: 
	git svn rebase >/dev/null
	

ok 3 - rebuild rev_map

# passed all 3 test(s)
1..3
