Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9153-git-svn-rewrite-uuid/.git/
expecting success: 
	svnadmin load -q '/Users/trast/git-smoke/t/trash directory.t9153-git-svn-rewrite-uuid/svnrepo' < '/Users/trast/git-smoke/t/t9153/svn.dump' &&
	git svn init --minimize-url --rewrite-uuid='6cc8ada4-5932-4b4a-8242-3534ed8a3232' 'file:///Users/trast/git-smoke/t/trash directory.t9153-git-svn-rewrite-uuid/svnrepo' &&
	git svn fetch
	
	A	foo
r1 = dc9dc6d104a3a05403f8ec885e6e3cf51d19c5bb (refs/remotes/git-svn)
	M	foo
r2 = 4b4c7de2f744e57f0f5d7d678ae2ce253fd4a452 (refs/remotes/git-svn)
ok 1 - load svn repo
expecting success: 
	git cat-file commit refs/remotes/git-svn~0 | 	   grep '^git-svn-id: .*@2 6cc8ada4-5932-4b4a-8242-3534ed8a3232$' &&
	git cat-file commit refs/remotes/git-svn~1 | 	   grep '^git-svn-id: .*@1 6cc8ada4-5932-4b4a-8242-3534ed8a3232$'
	
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9153-git-svn-rewrite-uuid/svnrepo@2 6cc8ada4-5932-4b4a-8242-3534ed8a3232
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9153-git-svn-rewrite-uuid/svnrepo@1 6cc8ada4-5932-4b4a-8242-3534ed8a3232
ok 2 - verify uuid

# passed all 2 test(s)
1..2
