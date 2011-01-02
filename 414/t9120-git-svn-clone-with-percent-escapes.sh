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
r1 = a980916301a6ae3fc16f49a53ae9797b9e1514cf (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 0b0b0a99396e4a435f04d4b5a564af44916dacaf (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = c39cf5bfdf18e888fb818a7f029c3db6b4cf97ac (refs/remotes/git-svn)
c39cf5bfdf18e888fb818a7f029c3db6b4cf97ac
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
r1 = 4113c471612892861726885b7c6540feeb35f30b (refs/remotes/git-svn)
4113c471612892861726885b7c6540feeb35f30b

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = d7cd0545494567c1d4640caf7bad32a8ab8efcc0 (refs/remotes/git-svn)
d7cd0545494567c1d4640caf7bad32a8ab8efcc0

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
r1 = 4113c471612892861726885b7c6540feeb35f30b (refs/remotes/trunk)
r2 = 5f77ff796cd6fdc4b001a1f0eb5716671293eb0b (refs/remotes/b)
r3 = b262490139058bbc1f2b0c6b4ebabddda4322b2b (refs/remotes/tags/v1)
4113c471612892861726885b7c6540feeb35f30b
5f77ff796cd6fdc4b001a1f0eb5716671293eb0b
b262490139058bbc1f2b0c6b4ebabddda4322b2b

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
r1 = 4113c471612892861726885b7c6540feeb35f30b (refs/remotes/trunk)
r2 = 5f77ff796cd6fdc4b001a1f0eb5716671293eb0b (refs/remotes/b)
r3 = b262490139058bbc1f2b0c6b4ebabddda4322b2b (refs/remotes/tags/v1)
4113c471612892861726885b7c6540feeb35f30b
5f77ff796cd6fdc4b001a1f0eb5716671293eb0b
b262490139058bbc1f2b0c6b4ebabddda4322b2b

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
