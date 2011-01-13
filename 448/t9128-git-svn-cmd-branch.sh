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
r1 = d389fecc64a6e3ef70efb4f7305df3e7bc19db8a (refs/remotes/trunk)
	M	foo
r2 = 15e66a5602ec960c28e2158009178f2e59bf962d (refs/remotes/trunk)

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
r3 = f4265db1bfcb678bbf5d28f05358dcf1efd37155 (refs/remotes/a)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/b...
r4 = c0ce261d30585dc5550a124179f89ef4736b98ab (refs/remotes/b)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/c...
remotes/c
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag1...
r5 = 01e4fb4346141b38e182ca1148c69acdfa78cf8d (refs/remotes/tags/tag1)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag2...
r6 = 167e85e04c75d8dc3af4eb5ffa4f5cc19077a2ae (refs/remotes/tags/tag2)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag3...
r7 = 082113712009113166f61b88ae5c7d8ab3cc1d52 (refs/remotes/tags/tag3)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag4...
r8 = 143a87ef1124cb05f1b0db7d9dc22583ea3c2b73 (refs/remotes/tags/tag4)
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
r9 = d5e2f3b63f0ba03bdf91db2e9145ce81d51618aa (refs/remotes/mirror/tags/tag3)
r9 = ed54af17e5f506c91b60128d4f3ca92ef1d6f94f (refs/remotes/mirror/a)
r9 = 4ee8a5db4987fcefeb5c546afa683dec50c02eee (refs/remotes/mirror/tags/tag2)
r9 = 2d330abb5cd25a533a027cfc4ae74404c5c7ba33 (refs/remotes/mirror/b)
r9 = cd88f73dcf3c1a183ef836a1d43217384ee979b4 (refs/remotes/mirror/tags/tag1)
r9 = 3398d8e9a4f98e8997584dff2d6987ea375e28c1 (refs/remotes/mirror/tags/tag4)
r9 = 27fd62aaa68b27250cdc8f3e2078bb7d80215ea1 (refs/remotes/mirror/trunk)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/trunk at r9 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/branches/d...
r10 = cb9e8314beb677df8bbc380be15096f33ed6e185 (refs/remotes/mirror/d)
remotes/d
ok 4 - branch uses correct svn-remote

# passed all 4 test(s)
1..4
