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
r1 = aeeb0e543edcb60fcabb63355086079bd735e59c (refs/remotes/git-svn)
	A	branches/b/foo
r2 = cc5784c76bb0c5c7e4697686f3eb873dcff5ca4c (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = d5fe6534a331a2f8a8e2adb083a74d633d6d80ca (refs/remotes/git-svn)
d5fe6534a331a2f8a8e2adb083a74d633d6d80ca

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
r1 = 3e96797f189b8a549afe4779f4392f7230175468 (refs/remotes/git-svn)
3e96797f189b8a549afe4779f4392f7230175468
ok 5 - test clone trunk with percent escapes and minimize-url
expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = ecad4ba8c1fad2a7b4f5235dd32de1aa7629495d (refs/remotes/git-svn)
ecad4ba8c1fad2a7b4f5235dd32de1aa7629495d
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
r1 = 3e96797f189b8a549afe4779f4392f7230175468 (refs/remotes/trunk)
r2 = 4b14e38417b04ed2fd00aaadf0e07dbbc9d0f9a1 (refs/remotes/b)
r3 = c21b5b7434b1dfd5902b3dbc429094118c6615d0 (refs/remotes/tags/v1)
3e96797f189b8a549afe4779f4392f7230175468
4b14e38417b04ed2fd00aaadf0e07dbbc9d0f9a1
c21b5b7434b1dfd5902b3dbc429094118c6615d0

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
r1 = 3e96797f189b8a549afe4779f4392f7230175468 (refs/remotes/trunk)
r2 = 4b14e38417b04ed2fd00aaadf0e07dbbc9d0f9a1 (refs/remotes/b)
r3 = c21b5b7434b1dfd5902b3dbc429094118c6615d0 (refs/remotes/tags/v1)
3e96797f189b8a549afe4779f4392f7230175468
4b14e38417b04ed2fd00aaadf0e07dbbc9d0f9a1
c21b5b7434b1dfd5902b3dbc429094118c6615d0

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
