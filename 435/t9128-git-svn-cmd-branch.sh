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
r1 = 8bab00bc6f1021ab0152904b7e1508c0ce3d43c0 (refs/remotes/trunk)
	M	foo
r2 = c8ee8740551d9d85e9ab923ff9649974b08f3628 (refs/remotes/trunk)

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
r3 = c7646d692cd21fce9b3a1fb3a9b764229e66a87e (refs/remotes/a)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/b...
r4 = 0ca7360618f99c6a067b7ad77d0a57b9dd926988 (refs/remotes/b)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/branches/c...
remotes/c
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag1...
r5 = 3db6dfdfc3382d6766621c27c0ce6bc7bda21f50 (refs/remotes/tags/tag1)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag2...
r6 = 0ce0e3a887c2a528792faf7ad92e737705e2fd3e (refs/remotes/tags/tag2)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag3...
r7 = 630426770434ed9090257b6e7db1ef9736c8497b (refs/remotes/tags/tag3)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/trunk at r2 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/tags/tag4...
r8 = d161deaf02f5b5da1de4e89f81877a5070f3f480 (refs/remotes/tags/tag4)
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
r9 = fdcf875de64f862b9b657baa1f4a92afa9deb894 (refs/remotes/mirror/tags/tag3)
r9 = 3713dcdc16eb849f992478b073bceaadc7c171df (refs/remotes/mirror/a)
r9 = e4fbeb96f1bf041f876b184e22b3365e63237cfe (refs/remotes/mirror/tags/tag2)
r9 = fb2cfa28762ed106d0217d426ac943071a5e55e0 (refs/remotes/mirror/b)
r9 = d0239bf58ac3abb0da5b4e3874c6e6e6b0aebd5c (refs/remotes/mirror/tags/tag1)
r9 = d3b69dd34c9b88fe7d8650f56b0d123287819525 (refs/remotes/mirror/tags/tag4)
r9 = 7cab43f72d925098f0c8fc0300ffc5831424d041 (refs/remotes/mirror/trunk)
Copying file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/trunk at r9 to file:///Users/trast/git-smoke/t/trash directory.t9128-git-svn-cmd-branch/svnrepo/mirror/branches/d...
r10 = f224a065287dbdf3e7d640001c8b3928b23b9732 (refs/remotes/mirror/d)
remotes/d
ok 4 - branch uses correct svn-remote

# passed all 4 test(s)
1..4
