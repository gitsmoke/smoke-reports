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
r1 = ff896e1c9a80d4231f0c69efcf3a95f879aab561 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 55e98b34b22566abf410c525e48a27e97d9c0e82 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = cefd78601f4b452ccb27c3f7cea542ce8349f81c (refs/remotes/git-svn)
cefd78601f4b452ccb27c3f7cea542ce8349f81c

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
r1 = 20f73c9f4236c03d8e6be8d93d71ead30dcbb097 (refs/remotes/git-svn)
20f73c9f4236c03d8e6be8d93d71ead30dcbb097

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 4598b4a99d6a0324bca9b823952c3e133fe3d064 (refs/remotes/git-svn)
4598b4a99d6a0324bca9b823952c3e133fe3d064

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
r1 = 20f73c9f4236c03d8e6be8d93d71ead30dcbb097 (refs/remotes/trunk)
r2 = ae13e6d830092fb8627830257159816ceb9c97b8 (refs/remotes/b)
r3 = a28b4c7e37233423fb8344e1015eb27910625b9d (refs/remotes/tags/v1)
20f73c9f4236c03d8e6be8d93d71ead30dcbb097
ae13e6d830092fb8627830257159816ceb9c97b8
a28b4c7e37233423fb8344e1015eb27910625b9d

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
r1 = 20f73c9f4236c03d8e6be8d93d71ead30dcbb097 (refs/remotes/trunk)
r2 = ae13e6d830092fb8627830257159816ceb9c97b8 (refs/remotes/b)
r3 = a28b4c7e37233423fb8344e1015eb27910625b9d (refs/remotes/tags/v1)
20f73c9f4236c03d8e6be8d93d71ead30dcbb097
ae13e6d830092fb8627830257159816ceb9c97b8
a28b4c7e37233423fb8344e1015eb27910625b9d

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
