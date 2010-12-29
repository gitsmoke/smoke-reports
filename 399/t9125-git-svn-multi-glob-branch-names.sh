Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/.git/
expecting success: 
	mkdir project project/trunk project/branches \
			project/branches/v14.1 project/tags &&
	echo foo > project/trunk/foo &&
	svn_cmd import -m "$test_description" project "$svnrepo/project" &&
	rm -rf project &&
	svn_cmd cp -m "fun" "$svnrepo/project/trunk" \
	                "$svnrepo/project/branches/v14.1/beta" &&
	svn_cmd cp -m "more fun!" "$svnrepo/project/branches/v14.1/beta" \
	                      "$svnrepo/project/branches/v14.1/gold"
	
Adding         project/trunk
Adding         project/trunk/foo
Adding         project/branches
Adding         project/branches/v14.1
Adding         project/tags

Committed revision 1.

Committed revision 2.

Committed revision 3.

ok 1 - setup svnrepo

expecting success: 
	git svn clone -T trunk -b branches/*/* -t tags \
	              "$svnrepo/project" project &&
	(cd project &&
		git rev-parse "refs/remotes/v14.1/beta" &&
		git rev-parse "refs/remotes/v14.1/gold"
	)
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/project/.git/
	A	foo
r1 = 1a7d42563031f8ac694190fdfc36f804918cfe45 (refs/remotes/trunk)
r2 = 2a44c1a0cf92c9bef4285a14939ce1a0f50e692b (refs/remotes/v14.1/beta)
r3 = 98d9af99d10aa97d749c9392ff528a5535981b8b (refs/remotes/v14.1/gold)
2a44c1a0cf92c9bef4285a14939ce1a0f50e692b
98d9af99d10aa97d749c9392ff528a5535981b8b

ok 2 - test clone with multi-glob in branch names

expecting success: 
	(cd project &&
	git reset --hard 'refs/remotes/v14.1/gold' &&
	echo hello >> foo &&
	git commit -m 'hello' -- foo &&
	git svn dcommit
	)
	
HEAD is now at 98d9af9 more fun!
[master 32d1919] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/svnrepo/project/branches/v14.1/gold ...
	M	foo
Committed r4
	M	foo
r4 = 47e67804e9bd85c391c44c41a4423a9cff099fd8 (refs/remotes/v14.1/gold)
No changes between current HEAD and refs/remotes/v14.1/gold
Resetting to the latest refs/remotes/v14.1/gold

ok 3 - test dcommit to multi-globbed branch

# passed all 3 test(s)
1..3
