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
r1 = 82e433f88eb52ff33c1b7fcd461816ead4c3e8d8 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = d8597219455e3bba84a244b2a8f663dd8fb27228 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = 39bd8d797dd101da60652f7eb13a1f196b1120cc (refs/remotes/git-svn)
39bd8d797dd101da60652f7eb13a1f196b1120cc

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
r1 = e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb (refs/remotes/git-svn)
e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 3ef61c3727b6aa90585efd85211c03a57426f953 (refs/remotes/git-svn)
3ef61c3727b6aa90585efd85211c03a57426f953

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
r1 = e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb (refs/remotes/trunk)
r2 = 4cd2a08cbdfe2ca7e30b2da2a51ff862100a748b (refs/remotes/b)
r3 = 45a2244b723331d6fd439073bdd1b44b9c9e67f7 (refs/remotes/tags/v1)
e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb
4cd2a08cbdfe2ca7e30b2da2a51ff862100a748b
45a2244b723331d6fd439073bdd1b44b9c9e67f7

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
r1 = e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb (refs/remotes/trunk)
r2 = 4cd2a08cbdfe2ca7e30b2da2a51ff862100a748b (refs/remotes/b)
r3 = 45a2244b723331d6fd439073bdd1b44b9c9e67f7 (refs/remotes/tags/v1)
e00f4bb5997a6bf24bcfd58f5b022e4ab3d572cb
4cd2a08cbdfe2ca7e30b2da2a51ff862100a748b
45a2244b723331d6fd439073bdd1b44b9c9e67f7

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
