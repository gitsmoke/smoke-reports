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
r1 = 9f71b2c20120f104f28761da820ac8a9fdf82d21 (refs/remotes/trunk)
r2 = 1786daac5e114e9d3e33b4afc547487389c8a319 (refs/remotes/fun plugin)
r3 = 75331b7864a124ad766cafcff65a82d7268b43b9 (refs/remotes/more fun plugin!)
r4 = ab749b1b681515af0620c02de1a2f9f60807c17c (refs/remotes/Abo-Uebernahme (Bug #994))
r5 = 8fbeb93e681428bd026c7749de73b54b274fe0fa (refs/remotes/.leading_dot)
r6 = b9167c349677ea54728988d99926d92d929d2c94 (refs/remotes/trailing_dot.)
r7 = 7d877a204970801ee703de8f15f74478952347eb (refs/remotes/trailing_dotlock.lock)
r8 = 50e23e4298edceef447981e966d91db312543a74 (refs/remotes/not-a@{0}reflog)
1786daac5e114e9d3e33b4afc547487389c8a319
75331b7864a124ad766cafcff65a82d7268b43b9
ab749b1b681515af0620c02de1a2f9f60807c17c
8fbeb93e681428bd026c7749de73b54b274fe0fa
b9167c349677ea54728988d99926d92d929d2c94
7d877a204970801ee703de8f15f74478952347eb
50e23e4298edceef447981e966d91db312543a74
ok 2 - test clone with funky branch names
expecting success: 
	(
		cd project &&
		git reset --hard 'refs/remotes/more%20fun%20plugin!' &&
		echo hello >> foo &&
		git commit -m 'hello' -- foo &&
		git svn dcommit
	)
	
HEAD is now at 75331b7 more fun!
[master 1b2f4e1] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/more fun plugin! ...
	M	foo
Committed r9
	M	foo
r9 = b45118f9a4b06a205ddbbe2dc34a5d37534674bd (refs/remotes/more fun plugin!)
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
	
HEAD is now at ab749b1 scary
[master a8b81b3] eep
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/Abo-Uebernahme (Bug #994) ...
	M	foo
Committed r10
	M	foo
r10 = a7d5e2a926714d184b4d8098dc5cfd0f7230de7c (refs/remotes/Abo-Uebernahme (Bug #994))
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
	
HEAD is now at 7d877a2 trailing .lock
[master 6afa229] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/trailing_dotlock.lock ...
	M	foo
Committed r11
	M	foo
r11 = 3fd1c78879e7d5aa916f60e36d25f52716074864 (refs/remotes/trailing_dotlock.lock)
No changes between current HEAD and refs/remotes/trailing_dotlock%2Elock
Resetting to the latest refs/remotes/trailing_dotlock%2Elock

ok 5 - test dcommit to trailing_dotlock branch

# passed all 5 test(s)
1..5
