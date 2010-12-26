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
r1 = ed696eae5a73a4df4e14766d9d791bc127c24042 (refs/remotes/trunk)
r2 = a4993cd5ec2394af1d610b298761ad8e433edcb0 (refs/remotes/v14.1/beta)
r3 = b3d6b217d553f7d841d57b640bd446f3a9d09e6a (refs/remotes/v14.1/gold)
a4993cd5ec2394af1d610b298761ad8e433edcb0
b3d6b217d553f7d841d57b640bd446f3a9d09e6a

ok 2 - test clone with multi-glob in branch names

expecting success: 
	(cd project &&
	git reset --hard 'refs/remotes/v14.1/gold' &&
	echo hello >> foo &&
	git commit -m 'hello' -- foo &&
	git svn dcommit
	)
	
HEAD is now at b3d6b21 more fun!
[master 629a462] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/svnrepo/project/branches/v14.1/gold ...
	M	foo
Committed r4
	M	foo
r4 = eceea16126556b3ed9f412f2d5a399412c8e9fd5 (refs/remotes/v14.1/gold)
No changes between current HEAD and refs/remotes/v14.1/gold
Resetting to the latest refs/remotes/v14.1/gold

ok 3 - test dcommit to multi-globbed branch

# passed all 3 test(s)
1..3
