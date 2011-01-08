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
r1 = f76a79e692a3ef45cee5df29ffb78379271c96b6 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 2a57270d6eef1f8842c023505b96679d45367532 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = 6a2a403e34a6ec4cc7d8d0459f1931b75c99c876 (refs/remotes/git-svn)
6a2a403e34a6ec4cc7d8d0459f1931b75c99c876

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
r1 = 4b74bc64ea9ab14ae2696b84e5fd8784414c5a86 (refs/remotes/git-svn)
4b74bc64ea9ab14ae2696b84e5fd8784414c5a86

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 73c345b61a537f885eb71514208a11909e3eef43 (refs/remotes/git-svn)
73c345b61a537f885eb71514208a11909e3eef43

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
r1 = 4b74bc64ea9ab14ae2696b84e5fd8784414c5a86 (refs/remotes/trunk)
r2 = 186d75d609bfa4161a62da5c7bb4cb4a7fa3cee7 (refs/remotes/b)
r3 = 4bfb38c177ca911af0c94207a7bc9c3b4f7bd17d (refs/remotes/tags/v1)
4b74bc64ea9ab14ae2696b84e5fd8784414c5a86
186d75d609bfa4161a62da5c7bb4cb4a7fa3cee7
4bfb38c177ca911af0c94207a7bc9c3b4f7bd17d

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
r1 = 4b74bc64ea9ab14ae2696b84e5fd8784414c5a86 (refs/remotes/trunk)
r2 = 186d75d609bfa4161a62da5c7bb4cb4a7fa3cee7 (refs/remotes/b)
r3 = 4bfb38c177ca911af0c94207a7bc9c3b4f7bd17d (refs/remotes/tags/v1)
4b74bc64ea9ab14ae2696b84e5fd8784414c5a86
186d75d609bfa4161a62da5c7bb4cb4a7fa3cee7
4bfb38c177ca911af0c94207a7bc9c3b4f7bd17d

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
