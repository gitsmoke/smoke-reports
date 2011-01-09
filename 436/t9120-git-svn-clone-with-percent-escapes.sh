Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/.git/
expecting success: 
	mkdir project project/trunk project/branches project/tags &&
	echo foo > project/trunk/foo &&
	svn_cmd import -m "$test_description" project "$svnrepo/pr ject" &&
	svn_cmd cp -m "branch" "$svnrepo/pr ject/trunk" \
	  "$svnrepo/pr ject/branches/b" &&
	svn_cmd cp -m "tag" "$svnrepo/pr ject/trunk" \
	  "$svnrepo/pr ject/tags/v1" &&
	rm -rf project &&
	start_httpd

Adding         project/trunk
Adding         project/trunk/foo
Adding         project/branches
Adding         project/tags

Committed revision 1.

Committed revision 2.

Committed revision 3.

ok 1 - setup svnrepo

expecting success: 
	git svn clone "$svnrepo/pr%20ject" clone &&
	(
		cd clone &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/clone/.git/
	A	trunk/foo
r1 = c33b3d27bc943d587eb5528892a4884e7c9ddeb0 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 15806dc187c6c9cd93d862d04a4e3f9ce8125fb0 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = 57e8c47f4cd55b88fdedc42515cb20dbf32e65a0 (refs/remotes/git-svn)
57e8c47f4cd55b88fdedc42515cb20dbf32e65a0

ok 2 - test clone with percent escapes

expecting success: 
	svn_cmd checkout "$svnrepo/pr%20ject" svn.percent &&
	svn_cmd checkout "$svnrepo/pr%20ject/trunk" svn.percent.trunk

A    svn.percent/trunk
A    svn.percent/trunk/foo
A    svn.percent/branches
A    svn.percent/branches/b
A    svn.percent/branches/b/foo
A    svn.percent/tags
A    svn.percent/tags/v1
A    svn.percent/tags/v1/foo
Checked out revision 3.
A    svn.percent.trunk/foo
Checked out revision 3.

ok 3 - svn checkout with percent escapes

expecting success: 
	svn_cmd checkout "$svnrepo/pr ject" svn.space &&
	svn_cmd checkout "$svnrepo/pr ject/trunk" svn.space.trunk

A    svn.space/trunk
A    svn.space/trunk/foo
A    svn.space/branches
A    svn.space/branches/b
A    svn.space/branches/b/foo
A    svn.space/tags
A    svn.space/tags/v1
A    svn.space/tags/v1/foo
Checked out revision 3.
A    svn.space.trunk/foo
Checked out revision 3.

ok 4 - svn checkout with space

expecting success: 
	git svn clone --minimize-url "$svnrepo/pr%20ject/trunk" minimize &&
	(
		cd minimize &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/minimize/.git/
	A	foo
r1 = e126d09851c0f537c8287cded5c7c2f0dfbfa722 (refs/remotes/git-svn)
e126d09851c0f537c8287cded5c7c2f0dfbfa722

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 69ea6d0546796e3013df6858997e8bf29cf6b9d0 (refs/remotes/git-svn)
69ea6d0546796e3013df6858997e8bf29cf6b9d0

ok 6 - test clone trunk with percent escapes

expecting success: 
	git svn clone --stdlayout "$svnrepo/pr%20ject" percent &&
	(
		cd percent &&
		git rev-parse refs/remotes/trunk^0 &&
		git rev-parse refs/remotes/b^0 &&
		git rev-parse refs/remotes/tags/v1^0
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/percent/.git/
	A	foo
r1 = e126d09851c0f537c8287cded5c7c2f0dfbfa722 (refs/remotes/trunk)
r2 = c1331fafbebe12a01c4c527f2670f595cc115e29 (refs/remotes/b)
r3 = 3ba496367327afe0f010e2e3a2a59ae43de05ae6 (refs/remotes/tags/v1)
e126d09851c0f537c8287cded5c7c2f0dfbfa722
c1331fafbebe12a01c4c527f2670f595cc115e29
3ba496367327afe0f010e2e3a2a59ae43de05ae6
ok 7 - test clone --stdlayout with percent escapes
expecting success: 
	git svn clone -s "$svnrepo/pr ject" space &&
	(
		cd space &&
		git rev-parse refs/remotes/trunk^0 &&
		git rev-parse refs/remotes/b^0 &&
		git rev-parse refs/remotes/tags/v1^0
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/space/.git/
	A	foo
r1 = e126d09851c0f537c8287cded5c7c2f0dfbfa722 (refs/remotes/trunk)
r2 = c1331fafbebe12a01c4c527f2670f595cc115e29 (refs/remotes/b)
r3 = 3ba496367327afe0f010e2e3a2a59ae43de05ae6 (refs/remotes/tags/v1)
e126d09851c0f537c8287cded5c7c2f0dfbfa722
c1331fafbebe12a01c4c527f2670f595cc115e29
3ba496367327afe0f010e2e3a2a59ae43de05ae6

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
