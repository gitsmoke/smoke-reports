Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9124-git-svn-dcommit-auto-props/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		echo foo >foo &&
		svn_cmd import -m "import for git svn" . "$svnrepo"
	) &&
	rm -rf import &&
	git svn init "$svnrepo" &&
	git svn fetch

Adding         foo

Committed revision 1.
	A	foo
r1 = b60718eae03fc14edabb4d8d3d8bfb5f4d0d344c (refs/remotes/git-svn)

ok 1 - initialize git svn

expecting success: 
	mkdir user &&
	generate_auto_props yes >user/config


ok 2 - enable auto-props config

expecting success: 
	echo "#!$SHELL_PATH" >exec1.sh &&
	chmod +x exec1.sh &&
	echo "hello" >hello.txt &&
	echo bar >bar &&
	git add exec1.sh hello.txt bar &&
	git commit -m "files for enabled auto-props" &&
	git svn dcommit --config-dir=user

[master 3d8e5dc] files for enabled auto-props
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100755 exec1.sh
 create mode 100644 hello.txt
Committing to file:///Users/trast/git-smoke/t/trash directory.t9124-git-svn-dcommit-auto-props/svnrepo ...
	A	bar
	A	exec1.sh
	A	hello.txt
Committed r2
	A	hello.txt
	A	bar
	A	exec1.sh
r2 = 23377854059fae5b09b27aa9adc36d2262337e5e (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 3 - add files matching auto-props

expecting success: 
	generate_auto_props no >user/config


ok 4 - disable auto-props config

expecting success: 
	echo "#$SHELL_PATH" >exec2.sh &&
	chmod +x exec2.sh &&
	echo "world" >world.txt &&
	echo zot >zot &&
	git add exec2.sh world.txt zot &&
	git commit -m "files for disabled auto-props" &&
	git svn dcommit --config-dir=user

[master 31a66ed] files for disabled auto-props
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100755 exec2.sh
 create mode 100644 world.txt
 create mode 100644 zot
Committing to file:///Users/trast/git-smoke/t/trash directory.t9124-git-svn-dcommit-auto-props/svnrepo ...
	A	exec2.sh
	A	world.txt
	A	zot
Committed r3
	A	exec2.sh
	A	world.txt
	A	zot
r3 = 10ccae5a5c9b41a573a219743c58c779e6f5c9d4 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 5 - add files matching disabled auto-props

expecting success: 
(
	mkdir work &&
	cd work &&
	svn_cmd co "$svnrepo" &&
	cd svnrepo &&

	# Check properties from first commit.
	test "x$(svn_cmd propget svn:executable exec1.sh)" = "x*" &&
	test "x$(svn_cmd propget svn:mime-type exec1.sh)" = \
	     "xapplication/x-shellscript" &&
	test "x$(svn_cmd propget svn:mime-type hello.txt)" = "xtext/plain" &&
	test "x$(svn_cmd propget svn:eol-style hello.txt)" = "xnative" &&
	test "x$(svn_cmd propget svn:mime-type bar)" = "x" &&

	# Check properties from second commit.
	test "x$(svn_cmd propget svn:executable exec2.sh)" = "x*" &&
	test "x$(svn_cmd propget svn:mime-type exec2.sh)" = "x" &&
	test "x$(svn_cmd propget svn:mime-type world.txt)" = "x" &&
	test "x$(svn_cmd propget svn:eol-style world.txt)" = "x" &&
	test "x$(svn_cmd propget svn:mime-type zot)" = "x"
)

A    svnrepo/exec2.sh
A    svnrepo/hello.txt
A    svnrepo/foo
A    svnrepo/bar
A    svnrepo/world.txt
A    svnrepo/zot
A    svnrepo/exec1.sh
Checked out revision 3.

ok 6 - check resulting svn repository

expecting success: 
	test -d user &&
	generate_auto_props yes > user/config &&
	git mv foo foo.sh &&
	git commit -m "foo => foo.sh" &&
	git svn dcommit --config-dir=user &&
	(
		cd work/svnrepo &&
		svn_cmd up &&
		test ! -e foo &&
		test -e foo.sh &&
		test "x$(svn_cmd propget svn:mime-type foo.sh)" = \
		     "xapplication/x-shellscript" &&
		test "x$(svn_cmd propget svn:eol-style foo.sh)" = "xLF"
	)

[master e4ed956] foo => foo.sh
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename foo => foo.sh (100%)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9124-git-svn-dcommit-auto-props/svnrepo ...
	R	foo => foo.sh
Committed r4
	D	foo
	A	foo.sh
r4 = 31ae85b260ecd97628fbc6a4142657543692f79c (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
D    foo
A    foo.sh
Updated to revision 4.

ok 7 - check renamed file

# passed all 7 test(s)
1..7
