Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/.git/
expecting success: 
	mkdir project project/trunk project/branches project/tags &&
	echo foo > project/trunk/foo &&
	svn_cmd import -m "$test_description" project "$svnrepo/pr ject" &&
	rm -rf project &&
	svn_cmd cp -m "fun" "$svnrepo/pr ject/trunk" \
	                "$svnrepo/pr ject/branches/fun plugin" &&
	svn_cmd cp -m "more fun!" "$svnrepo/pr ject/branches/fun plugin" \
	                      "$svnrepo/pr ject/branches/more fun plugin!" &&
	svn_cmd cp -m "scary" "$svnrepo/pr ject/branches/fun plugin" \
	              "$svnrepo/pr ject/branches/$scary_uri" &&
	svn_cmd cp -m "leading dot" "$svnrepo/pr ject/trunk" \
			"$svnrepo/pr ject/branches/.leading_dot" &&
	svn_cmd cp -m "trailing dot" "$svnrepo/pr ject/trunk" \
			"$svnrepo/pr ject/branches/trailing_dot." &&
	svn_cmd cp -m "trailing .lock" "$svnrepo/pr ject/trunk" \
			"$svnrepo/pr ject/branches/trailing_dotlock.lock" &&
	svn_cmd cp -m "reflog" "$svnrepo/pr ject/trunk" \
			"$svnrepo/pr ject/branches/not-a%40{0}reflog" &&
	start_httpd
	
Adding         project/trunk
Adding         project/trunk/foo
Adding         project/branches
Adding         project/tags

Committed revision 1.

Committed revision 2.

Committed revision 3.

Committed revision 4.

Committed revision 5.

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 1 - setup svnrepo

expecting success: 
	git svn clone -s "$svnrepo/pr ject" project &&
	(
		cd project &&
		git rev-parse "refs/remotes/fun%20plugin" &&
		git rev-parse "refs/remotes/more%20fun%20plugin!" &&
		git rev-parse "refs/remotes/$scary_ref" &&
		git rev-parse "refs/remotes/%2Eleading_dot" &&
		git rev-parse "refs/remotes/trailing_dot%2E" &&
		git rev-parse "refs/remotes/trailing_dotlock%2Elock" &&
		git rev-parse "refs/remotes/not-a%40{0}reflog"
	)
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/project/.git/
	A	foo
r1 = 08a24b61f0e85e4ea555aed38c327bca3de40657 (refs/remotes/trunk)
r2 = 61b1c880c7ed065fb7fd21a7a2dbafa4216f72c2 (refs/remotes/fun plugin)
r3 = 457ddd183254ec0b6a27cbb14bfc7a6f2106d9d4 (refs/remotes/more fun plugin!)
r4 = 270dd477bf260e2c5104dd5dceec4c535adc9208 (refs/remotes/Abo-Uebernahme (Bug #994))
r5 = 1b61a488055dd76ebed315012623f639e7cfc310 (refs/remotes/.leading_dot)
r6 = 1fee72411aaa6deee9936dced725e9936cae257f (refs/remotes/trailing_dot.)
r7 = d0740075e926f2b035d3c7e13a34f66939cf64ee (refs/remotes/trailing_dotlock.lock)
r8 = 64cdb7b5cb0cbdbfe86602ca2d1a6117ea4b51c8 (refs/remotes/not-a@{0}reflog)
61b1c880c7ed065fb7fd21a7a2dbafa4216f72c2
457ddd183254ec0b6a27cbb14bfc7a6f2106d9d4
270dd477bf260e2c5104dd5dceec4c535adc9208
1b61a488055dd76ebed315012623f639e7cfc310
1fee72411aaa6deee9936dced725e9936cae257f
d0740075e926f2b035d3c7e13a34f66939cf64ee
64cdb7b5cb0cbdbfe86602ca2d1a6117ea4b51c8

ok 2 - test clone with funky branch names

expecting success: 
	(
		cd project &&
		git reset --hard 'refs/remotes/more%20fun%20plugin!' &&
		echo hello >> foo &&
		git commit -m 'hello' -- foo &&
		git svn dcommit
	)
	
HEAD is now at 457ddd1 more fun!
[master e1c72b4] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/more fun plugin! ...
	M	foo
Committed r9
	M	foo
r9 = 017b03eaa65d1f7be4db9b4bd4f212ff3db71b49 (refs/remotes/more fun plugin!)
No changes between current HEAD and refs/remotes/more%20fun%20plugin!
Resetting to the latest refs/remotes/more%20fun%20plugin!

ok 3 - test dcommit to funky branch

expecting success: 
	(
		cd project &&
		git reset --hard "refs/remotes/$scary_ref" &&
		echo urls are scary >> foo &&
		git commit -m "eep" -- foo &&
		git svn dcommit
	)
	
HEAD is now at 270dd47 scary
[master ee1dfeb] eep
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/Abo-Uebernahme (Bug #994) ...
	M	foo
Committed r10
	M	foo
r10 = ed2f501cef810937c8b747e85f1f5c4d74ec9cb5 (refs/remotes/Abo-Uebernahme (Bug #994))
No changes between current HEAD and refs/remotes/Abo-Uebernahme%20(Bug%20#994)
Resetting to the latest refs/remotes/Abo-Uebernahme%20(Bug%20#994)

ok 4 - test dcommit to scary branch

expecting success: 
	(
		cd project &&
		git reset --hard "refs/remotes/trailing_dotlock%2Elock" &&
		echo who names branches like this anyway? >> foo &&
		git commit -m "bar" -- foo &&
		git svn dcommit
	)
	
HEAD is now at d074007 trailing .lock
[master a663f48] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/trailing_dotlock.lock ...
	M	foo
Committed r11
	M	foo
r11 = 179ee14f0cc5d15c25f7447ba0a07b2954598911 (refs/remotes/trailing_dotlock.lock)
No changes between current HEAD and refs/remotes/trailing_dotlock%2Elock
Resetting to the latest refs/remotes/trailing_dotlock%2Elock

ok 5 - test dcommit to trailing_dotlock branch

# passed all 5 test(s)
1..5
