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
r1 = 1d6868a5ea750f55049ebd7aa92b536df55e71af (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 3c6a430cba2d94421305028cb5689503dd595641 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = e747e15652447892ac5655623eae45c1e679bc14 (refs/remotes/git-svn)
e747e15652447892ac5655623eae45c1e679bc14
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
r1 = fba166d0cea3e2f9e829e2a9318eff5490e4103f (refs/remotes/git-svn)
fba166d0cea3e2f9e829e2a9318eff5490e4103f

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = c11ec5484ac5bc3dab7974d5ffab4b9ae5d57acf (refs/remotes/git-svn)
c11ec5484ac5bc3dab7974d5ffab4b9ae5d57acf

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
r1 = fba166d0cea3e2f9e829e2a9318eff5490e4103f (refs/remotes/trunk)
r2 = 79d7bbea28ec71435ee8672d3ce633db4e4447bb (refs/remotes/b)
r3 = 8ce70570bf5087e3c2ac19c351020f616fe5cec9 (refs/remotes/tags/v1)
fba166d0cea3e2f9e829e2a9318eff5490e4103f
79d7bbea28ec71435ee8672d3ce633db4e4447bb
8ce70570bf5087e3c2ac19c351020f616fe5cec9

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
r1 = fba166d0cea3e2f9e829e2a9318eff5490e4103f (refs/remotes/trunk)
r2 = 79d7bbea28ec71435ee8672d3ce633db4e4447bb (refs/remotes/b)
r3 = 8ce70570bf5087e3c2ac19c351020f616fe5cec9 (refs/remotes/tags/v1)
fba166d0cea3e2f9e829e2a9318eff5490e4103f
79d7bbea28ec71435ee8672d3ce633db4e4447bb
8ce70570bf5087e3c2ac19c351020f616fe5cec9

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
