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
r1 = aeca023b518b30ea556f4da7bc13c90b3ecf1490 (refs/remotes/trunk)
	M	foo
r2 = 7532b30133922cf6a592c8d5574769c3757d4fe5 (refs/remotes/trunk)

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
r3 = a3d802d526df57d39ebff1785e0e2512953d784d (refs/remotes/a)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/b...
r4 = eb36a4d998b2fb150a78864cd74a4959ac383e51 (refs/remotes/b)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/c...
remotes/c
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag1...
r5 = e97c24877e325d45da82771f2e12b8b7c1c69405 (refs/remotes/tags/tag1)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag2...
r6 = 6890ebc5e5d334aa5e8302497444a4748e041729 (refs/remotes/tags/tag2)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag3...
r7 = 720d2608f977f3b8d1f1f113ef5cd95af2a265a9 (refs/remotes/tags/tag3)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag4...
r8 = e01cac67c376b10009b84c8b15f874568b39170e (refs/remotes/tags/tag4)
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
r9 = 373eebea287acb670e84b0fcc3cf3c990513d71a (refs/remotes/mirror/tags/tag3)
r9 = 3c484320bec7b582dad004f37e7670fa59b50580 (refs/remotes/mirror/a)
r9 = 4233b1d3b6cafbec3cda80cb4dc40007709093ab (refs/remotes/mirror/tags/tag2)
r9 = bdc887285dc4ee54ff6d1743c3befeda261d5826 (refs/remotes/mirror/b)
r9 = 9deac26bdcaa2163ee97653a9b18e83f7931dcf9 (refs/remotes/mirror/tags/tag1)
r9 = 1e803a879b5b0df5be8af083f6cf1e5b15f28fbe (refs/remotes/mirror/tags/tag4)
r9 = 97f8cf40aa8af030f1fbe5776ac5005ba0cd32b0 (refs/remotes/mirror/trunk)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/trunk at r9 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/branches/d...
r10 = 5136e414c27ed64cd20e1057cbc5bed4e96f1091 (refs/remotes/mirror/d)
remotes/d

ok 4 - branch uses correct svn-remote

# passed all 4 test(s)
1..4
