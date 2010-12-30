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
r1 = d25a742354d1da8fd1557cf427a48e226154e08d (refs/remotes/trunk)
r2 = 910ca1707b762220a5e5d5edce827046a8f6fc45 (refs/remotes/v14.1/beta)
r3 = 6593371067298e4509858c00dd241479d6c4ff01 (refs/remotes/v14.1/gold)
910ca1707b762220a5e5d5edce827046a8f6fc45
6593371067298e4509858c00dd241479d6c4ff01

ok 2 - test clone with multi-glob in branch names

expecting success: 
	(cd project &&
	git reset --hard 'refs/remotes/v14.1/gold' &&
	echo hello >> foo &&
	git commit -m 'hello' -- foo &&
	git svn dcommit
	)
	
HEAD is now at 6593371 more fun!
[master 9e420cf] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9125-git-svn-multi-glob-branch-names/svnrepo/project/branches/v14.1/gold ...
	M	foo
Committed r4
	M	foo
r4 = bb3f1839b274dc92f2401ce9916e921f434481f1 (refs/remotes/v14.1/gold)
No changes between current HEAD and refs/remotes/v14.1/gold
Resetting to the latest refs/remotes/v14.1/gold

ok 3 - test dcommit to multi-globbed branch

# passed all 3 test(s)
1..3
