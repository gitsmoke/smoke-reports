Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/.git/
expecting success: 
	mkdir import &&
	(
		(cd import &&
		mkdir trunk branches tags &&
		(cd trunk &&
		echo foo > foo
		) &&
		svn_cmd import -m "import for git-svn" . "$svnrepo" >/dev/null
		) &&
		rm -rf import &&
		svn_cmd co "$svnrepo"/trunk trunk &&
		(cd trunk &&
		echo bar >> foo &&
		svn_cmd ci -m "updated trunk"
		) &&
		rm -rf trunk
	)
A    trunk/foo
Checked out revision 1.
Sending        foo
Transmitting file data .
Committed revision 2.

ok 1 - initialize svnrepo

expecting success: 
	git svn init --stdlayout "$svnrepo" &&
	git svn fetch &&
	git checkout remotes/trunk

	A	foo
r1 = cc48b6f783ddb2f2e27baec1de083a7523ff9e92 (refs/remotes/trunk)
	M	foo
r2 = 2ecf609df1888edef099497621be1973b411c70a (refs/remotes/trunk)

ok 2 - import into git

expecting success: 
	git svn branch a &&
	base=$(git rev-parse HEAD:) &&
	test $base = $(git rev-parse remotes/a:) &&
	git svn branch -m "created branch b blah" b &&
	test $base = $(git rev-parse remotes/b:) &&
	test_must_fail git branch -m "no branchname" &&
	git svn branch -n c &&
	test_must_fail git rev-parse remotes/c &&
	test_must_fail git svn branch a &&
	git svn branch -t tag1 &&
	test $base = $(git rev-parse remotes/tags/tag1:) &&
	git svn branch --tag tag2 &&
	test $base = $(git rev-parse remotes/tags/tag2:) &&
	git svn tag tag3 &&
	test $base = $(git rev-parse remotes/tags/tag3:) &&
	git svn tag -m "created tag4 foo" tag4 &&
	test $base = $(git rev-parse remotes/tags/tag4:) &&
	test_must_fail git svn tag -m "no tagname" &&
	git svn tag -n tag5 &&
	test_must_fail git rev-parse remotes/tags/tag5 &&
	test_must_fail git svn tag tag1

Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/a...
r3 = d9fff4e1b7a27b6137a1980f0bf3fb3d93758234 (refs/remotes/a)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/b...
r4 = f0afda2dd7c760eba042564189a557391e5c7e9b (refs/remotes/b)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/c...
remotes/c
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag1...
r5 = 0590791a33b8d225a38a8a07b73015806f90e217 (refs/remotes/tags/tag1)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag2...
r6 = 1b7021e72570f41e45b52867c15720f499513fa1 (refs/remotes/tags/tag2)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag3...
r7 = 805c3670ed4357af5602f8c52ec5cc78c61af0ed (refs/remotes/tags/tag3)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag4...
r8 = 79e800299c3b10f29563af823700bab469f7e319 (refs/remotes/tags/tag4)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag5...
remotes/tags/tag5
ok 3 - git svn branch tests
expecting success: 
	(svn_cmd co "$svnrepo" svn &&
	cd svn &&
	mkdir mirror &&
	svn_cmd add mirror &&
	svn_cmd copy trunk mirror/ &&
	svn_cmd copy tags mirror/ &&
	svn_cmd copy branches mirror/ &&
	svn_cmd ci -m "made mirror" ) &&
	rm -rf svn &&
	git svn init -s -R mirror --prefix=mirror/ "$svnrepo"/mirror &&
	git svn fetch -R mirror &&
	git checkout mirror/trunk &&
	base=$(git rev-parse HEAD:) &&
	git svn branch -m "branch in mirror" d &&
	test $base = $(git rev-parse remotes/mirror/d:) &&
	test_must_fail git rev-parse remotes/d
A    svn/trunk
A    svn/trunk/foo
A    svn/branches
A    svn/branches/a
A    svn/branches/a/foo
A    svn/branches/b
A    svn/branches/b/foo
A    svn/tags
A    svn/tags/tag4
A    svn/tags/tag4/foo
A    svn/tags/tag1
A    svn/tags/tag1/foo
A    svn/tags/tag2
A    svn/tags/tag2/foo
A    svn/tags/tag3
A    svn/tags/tag3/foo
Checked out revision 8.
A         mirror
A         mirror/trunk
A         mirror/tags
A         mirror/branches
Adding         mirror
Adding         mirror/branches
Adding         mirror/tags
Adding         mirror/trunk

Committed revision 9.
r9 = 1884d7b7129608f372477c645d27cf9a655657c2 (refs/remotes/mirror/tags/tag3)
r9 = 511db6cc5528b93c3c7f4add8a5abe4cb17bb902 (refs/remotes/mirror/a)
r9 = 36b7a805485b6fd6d4789000b8d89a7a112a6568 (refs/remotes/mirror/tags/tag2)
r9 = e3dff3a2b40c69662b9f22fa4a692408cd0ecd94 (refs/remotes/mirror/b)
r9 = c645a79d5dd05585341526cced53bbf4335636ee (refs/remotes/mirror/tags/tag1)
r9 = 964c3b7ff04afa92e6fd0a80a9be1998c2062e58 (refs/remotes/mirror/tags/tag4)
r9 = 6a72a31776757a532f1990736ad58829de34f0e1 (refs/remotes/mirror/trunk)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/trunk at r9 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/branches/d...
r10 = 53c814bf24db607b7a9e68d232f42b56abee9685 (refs/remotes/mirror/d)
remotes/d

ok 4 - branch uses correct svn-remote

# passed all 4 test(s)
1..4
