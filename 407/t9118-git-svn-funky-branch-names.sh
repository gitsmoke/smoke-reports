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
r1 = ad6dc419f32374f250510a6ea9df077a2d609131 (refs/remotes/trunk)
r2 = 345586102beb8284c84cc2b4cb866c71861209e4 (refs/remotes/fun plugin)
r3 = 3b91739071931f358b3d50297d318dbb0bce1019 (refs/remotes/more fun plugin!)
r4 = 05012ef1f861a05a78a1f3c07effae22462837bd (refs/remotes/Abo-Uebernahme (Bug #994))
r5 = 92e6d634b246b2c04822d25b9dcaad94d2aca1c4 (refs/remotes/.leading_dot)
r6 = 9fd5ce79bb203ef6d98b3af0ffaaf827c9133791 (refs/remotes/trailing_dot.)
r7 = ffdf4aec924db6ce26b9f125941547bc5db85e8d (refs/remotes/trailing_dotlock.lock)
r8 = 09664a22f2c48422de0f7881cf82e9bd85b51e89 (refs/remotes/not-a@{0}reflog)
345586102beb8284c84cc2b4cb866c71861209e4
3b91739071931f358b3d50297d318dbb0bce1019
05012ef1f861a05a78a1f3c07effae22462837bd
92e6d634b246b2c04822d25b9dcaad94d2aca1c4
9fd5ce79bb203ef6d98b3af0ffaaf827c9133791
ffdf4aec924db6ce26b9f125941547bc5db85e8d
09664a22f2c48422de0f7881cf82e9bd85b51e89
ok 2 - test clone with funky branch names
expecting success: 
	(
		cd project &&
		git reset --hard 'refs/remotes/more%20fun%20plugin!' &&
		echo hello >> foo &&
		git commit -m 'hello' -- foo &&
		git svn dcommit
	)
	
HEAD is now at 3b91739 more fun!
[master 63463b3] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/more fun plugin! ...
	M	foo
Committed r9
	M	foo
r9 = 5d6f1a15d222e0b0ac550fc199efedacf0cd6860 (refs/remotes/more fun plugin!)
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
	
HEAD is now at 05012ef scary
[master c8c38fe] eep
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/Abo-Uebernahme (Bug #994) ...
	M	foo
Committed r10
	M	foo
r10 = 08cf0776280c42efd3b36f9721a9a816091d149c (refs/remotes/Abo-Uebernahme (Bug #994))
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
	
HEAD is now at ffdf4ae trailing .lock
[master 6f24884] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/trailing_dotlock.lock ...
	M	foo
Committed r11
	M	foo
r11 = e7e362a95634358a9bc75f14a4e053995629bfaa (refs/remotes/trailing_dotlock.lock)
No changes between current HEAD and refs/remotes/trailing_dotlock%2Elock
Resetting to the latest refs/remotes/trailing_dotlock%2Elock

ok 5 - test dcommit to trailing_dotlock branch

# passed all 5 test(s)
1..5
