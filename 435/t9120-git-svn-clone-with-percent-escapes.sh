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
r1 = 232a2c98f01d91e22454d843b7c7d484310f9c7b (refs/remotes/git-svn)
	A	branches/b/foo
r2 = efbea1aa9b7720102f66a947812fc34ef548e155 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = aa2379809ad29bf1d7457d06255b75ed737a4c08 (refs/remotes/git-svn)
aa2379809ad29bf1d7457d06255b75ed737a4c08
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
r1 = bfebb20f74c80195a0728b2d616ac47430b09040 (refs/remotes/git-svn)
bfebb20f74c80195a0728b2d616ac47430b09040

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 14bb997112d3274640b07fa44b8d88c82fa09d27 (refs/remotes/git-svn)
14bb997112d3274640b07fa44b8d88c82fa09d27

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
r1 = bfebb20f74c80195a0728b2d616ac47430b09040 (refs/remotes/trunk)
r2 = ec4129b4ed6529619254d16d704dbb3f8d0f8981 (refs/remotes/b)
r3 = 5b187f3fb1fd7fc225e7e4414a742422546d4684 (refs/remotes/tags/v1)
bfebb20f74c80195a0728b2d616ac47430b09040
ec4129b4ed6529619254d16d704dbb3f8d0f8981
5b187f3fb1fd7fc225e7e4414a742422546d4684

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
r1 = bfebb20f74c80195a0728b2d616ac47430b09040 (refs/remotes/trunk)
r2 = ec4129b4ed6529619254d16d704dbb3f8d0f8981 (refs/remotes/b)
r3 = 5b187f3fb1fd7fc225e7e4414a742422546d4684 (refs/remotes/tags/v1)
bfebb20f74c80195a0728b2d616ac47430b09040
ec4129b4ed6529619254d16d704dbb3f8d0f8981
5b187f3fb1fd7fc225e7e4414a742422546d4684

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
