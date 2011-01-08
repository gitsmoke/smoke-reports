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
r1 = 0e87d1fb20cacf02646f8365171d5c775c989870 (refs/remotes/trunk)
	M	foo
r2 = b9aae4f8e4a40578d694e0960604d105fa8c2a84 (refs/remotes/trunk)

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
r3 = 92c5510afc30ec8187f09e02f9ec69ffb327059a (refs/remotes/a)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/b...
r4 = 52cf649f0dd9143af678abc2fa7fdbe5772b87ea (refs/remotes/b)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/c...
remotes/c
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag1...
r5 = 8f4910e80ab166c3609036e583630e95c5170ae4 (refs/remotes/tags/tag1)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag2...
r6 = bcf1643161cfbedbf4ef608d38583b7269ac05dc (refs/remotes/tags/tag2)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag3...
r7 = 845b7071f80e94f902d262d098b29162d1609a02 (refs/remotes/tags/tag3)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag4...
r8 = b8591399a1c215536e1c96088ea63a2c67bce1aa (refs/remotes/tags/tag4)
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
r9 = 1d3af876f82a8be97a50996e2b8b72dc9bed5d39 (refs/remotes/mirror/tags/tag3)
r9 = 00b89ffe7a65ba91a3b103f1f0a72093de6e0b96 (refs/remotes/mirror/a)
r9 = 7ff727d85598a008ac7366ee1188568e9d0a9a42 (refs/remotes/mirror/tags/tag2)
r9 = 0d6804c4da3a1a7717add9e3eb9f2c8408827d31 (refs/remotes/mirror/b)
r9 = cde037ab10b32cc86acf72178a082890f6ed781f (refs/remotes/mirror/tags/tag1)
r9 = 12ad5c4efd1c689c410b1f7a3ee392cd3fde34ce (refs/remotes/mirror/tags/tag4)
r9 = c6aaa5402f30ba10248cc0e30a33180ba7174893 (refs/remotes/mirror/trunk)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/trunk at r9 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/branches/d...
r10 = 195d1cf3f495cf6d612fd6c8703c17a8544ecaf3 (refs/remotes/mirror/d)
remotes/d
ok 4 - branch uses correct svn-remote

# passed all 4 test(s)
1..4
