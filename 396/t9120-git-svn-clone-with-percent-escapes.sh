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
r1 = 0fe39eb20fc84dffc118726597f968d0cfe9b057 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = aed65330c2bb13b3d35840a364f2dee34ff749c5 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = 9251c9a5d9c22567274c094244e376884e027eda (refs/remotes/git-svn)
9251c9a5d9c22567274c094244e376884e027eda
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
r1 = 6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae (refs/remotes/git-svn)
6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 635af543544c61f22bedab2ab7faebb89f6882ca (refs/remotes/git-svn)
635af543544c61f22bedab2ab7faebb89f6882ca

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
r1 = 6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae (refs/remotes/trunk)
r2 = 305c2619fae140f6c7852a5cb09512e6d1c9d2e8 (refs/remotes/b)
r3 = e873938ed111c8130fee268989919bbac1d00ab2 (refs/remotes/tags/v1)
6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae
305c2619fae140f6c7852a5cb09512e6d1c9d2e8
e873938ed111c8130fee268989919bbac1d00ab2

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
r1 = 6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae (refs/remotes/trunk)
r2 = 305c2619fae140f6c7852a5cb09512e6d1c9d2e8 (refs/remotes/b)
r3 = e873938ed111c8130fee268989919bbac1d00ab2 (refs/remotes/tags/v1)
6a1a18b0dd521eeff96d5cf0d5cc6ca31e209fae
305c2619fae140f6c7852a5cb09512e6d1c9d2e8
e873938ed111c8130fee268989919bbac1d00ab2

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
