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
r1 = f35172498634bf180b9dfb115193a53d94163131 (refs/remotes/git-svn)
	A	branches/b/foo
r2 = 205a62efb49f56cc372c69b27ab65e1b046fc4f4 (refs/remotes/git-svn)
	A	tags/v1/foo
r3 = 0742bff5a3dc5738623d1c015c76803e57bd7173 (refs/remotes/git-svn)
0742bff5a3dc5738623d1c015c76803e57bd7173

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
r1 = 79acb6ccd78da5a29a3c8c22e38510d1f2248967 (refs/remotes/git-svn)
79acb6ccd78da5a29a3c8c22e38510d1f2248967

ok 5 - test clone trunk with percent escapes and minimize-url

expecting success: 
	git svn clone "$svnrepo/pr%20ject/trunk" trunk &&
	(
		cd trunk &&
		git rev-parse refs/${remotes_git_svn}
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9120-git-svn-clone-with-percent-escapes/trunk/.git/
	A	foo
r1 = 8e31e1beb898fb238ac163365c18a660fb6d0838 (refs/remotes/git-svn)
8e31e1beb898fb238ac163365c18a660fb6d0838

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
r1 = 79acb6ccd78da5a29a3c8c22e38510d1f2248967 (refs/remotes/trunk)
r2 = aedcbf8817d7ef1897acd3406b6b2419d5f9cd29 (refs/remotes/b)
r3 = ccebbb985b387eb3b3ed6fee98a9e3246c7a8b54 (refs/remotes/tags/v1)
79acb6ccd78da5a29a3c8c22e38510d1f2248967
aedcbf8817d7ef1897acd3406b6b2419d5f9cd29
ccebbb985b387eb3b3ed6fee98a9e3246c7a8b54
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
r1 = 79acb6ccd78da5a29a3c8c22e38510d1f2248967 (refs/remotes/trunk)
r2 = aedcbf8817d7ef1897acd3406b6b2419d5f9cd29 (refs/remotes/b)
r3 = ccebbb985b387eb3b3ed6fee98a9e3246c7a8b54 (refs/remotes/tags/v1)
79acb6ccd78da5a29a3c8c22e38510d1f2248967
aedcbf8817d7ef1897acd3406b6b2419d5f9cd29
ccebbb985b387eb3b3ed6fee98a9e3246c7a8b54

ok 8 - test clone -s with unescaped space

# passed all 8 test(s)
1..8
