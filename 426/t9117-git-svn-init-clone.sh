Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9117-git-svn-init-clone/.git/
expecting success: 
	mkdir project project/trunk project/branches project/tags &&
	echo foo > project/trunk/foo &&
	svn_cmd import -m "$test_description" project "$svnrepo"/project &&
	rm -rf project
	
Adding         project/trunk
Adding         project/trunk/foo
Adding         project/branches
Adding         project/tags

Committed revision 1.

ok 1 - setup svnrepo

expecting success: 
	test ! -d trunk &&
	git svn clone "$svnrepo"/project/trunk &&
	test -d trunk/.git/svn &&
	test -e trunk/foo &&
	rm -rf trunk
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9117-git-svn-init-clone/tmp/trunk/.git/
	A	foo
r1 = 8a2dc07a67c25b94aca2bac4c7e45484a954ee18 (refs/remotes/git-svn)

ok 2 - basic clone

expecting success: 
	test ! -d target &&
	git svn clone "$svnrepo"/project/trunk target &&
	test -d target/.git/svn &&
	test -e target/foo &&
	rm -rf target
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9117-git-svn-init-clone/tmp/target/.git/
	A	foo
r1 = 8a2dc07a67c25b94aca2bac4c7e45484a954ee18 (refs/remotes/git-svn)

ok 3 - clone to target directory

expecting success: 
	test ! -d project &&
	git svn clone -s "$svnrepo"/project &&
	test -d project/.git/svn &&
	test -e project/foo &&
	rm -rf project
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9117-git-svn-init-clone/tmp/project/.git/
	A	foo
r1 = 8a2dc07a67c25b94aca2bac4c7e45484a954ee18 (refs/remotes/trunk)

ok 4 - clone with --stdlayout

expecting success: 
	test ! -d target &&
	git svn clone -s "$svnrepo"/project target &&
	test -d target/.git/svn &&
	test -e target/foo &&
	rm -rf target
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9117-git-svn-init-clone/tmp/target/.git/
	A	foo
r1 = 8a2dc07a67c25b94aca2bac4c7e45484a954ee18 (refs/remotes/trunk)
ok 5 - clone to target directory with --stdlayout

# passed all 5 test(s)
1..5
