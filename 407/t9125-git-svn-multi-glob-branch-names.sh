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
r1 = 370d8a32a78b349b5fba910dce91316ee670f02f (refs/remotes/trunk)
r2 = a781155464fee337e5a1dcb2845dea2ea0d1eef8 (refs/remotes/v14.1/beta)
r3 = 26cd0e48296a5fe9288b6f8967e4b7eae7946087 (refs/remotes/v14.1/gold)
a781155464fee337e5a1dcb2845dea2ea0d1eef8
26cd0e48296a5fe9288b6f8967e4b7eae7946087

ok 2 - test clone with multi-glob in branch names

expecting success: 
	(cd project &&
	git reset --hard 'refs/remotes/v14.1/gold' &&
	echo hello >> foo &&
	git commit -m 'hello' -- foo &&
	git svn dcommit
	)
	
HEAD is now at 26cd0e4 more fun!
[master fd404f3] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/svnrepo/project/branches/v14.1/gold ...
	M	foo
Committed r4
	M	foo
r4 = 1228b03b1e5d6411686b6c5b0f8ecdcb302f85ed (refs/remotes/v14.1/gold)
No changes between current HEAD and refs/remotes/v14.1/gold
Resetting to the latest refs/remotes/v14.1/gold

ok 3 - test dcommit to multi-globbed branch

# passed all 3 test(s)
1..3
