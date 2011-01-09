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
r1 = 20005db7df11a46fb6817338ae4d88ef0c735504 (refs/remotes/trunk)
r2 = d4a5626c36c5fabc2001ec82a59e38626222db86 (refs/remotes/fun plugin)
r3 = d409789272eee1bbe95599224ca67d21a994367b (refs/remotes/more fun plugin!)
r4 = 06c2103d7f01a54e6e738422d9187acb7a76dc7e (refs/remotes/Abo-Uebernahme (Bug #994))
r5 = d3520860387cc39e948dcf1bd915adc78bd4beea (refs/remotes/.leading_dot)
r6 = 514d181cd591e3172bbdec668d9a1a664415f11b (refs/remotes/trailing_dot.)
r7 = af5c39d4cda99a9e6104e39f1507acf27adff50b (refs/remotes/trailing_dotlock.lock)
r8 = c97d8ccf76050b97a4225f2878fec24c14da02b0 (refs/remotes/not-a@{0}reflog)
d4a5626c36c5fabc2001ec82a59e38626222db86
d409789272eee1bbe95599224ca67d21a994367b
06c2103d7f01a54e6e738422d9187acb7a76dc7e
d3520860387cc39e948dcf1bd915adc78bd4beea
514d181cd591e3172bbdec668d9a1a664415f11b
af5c39d4cda99a9e6104e39f1507acf27adff50b
c97d8ccf76050b97a4225f2878fec24c14da02b0
ok 2 - test clone with funky branch names
expecting success: 
	(
		cd project &&
		git reset --hard 'refs/remotes/more%20fun%20plugin!' &&
		echo hello >> foo &&
		git commit -m 'hello' -- foo &&
		git svn dcommit
	)
	
HEAD is now at d409789 more fun!
[master aab2404] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/more fun plugin! ...
	M	foo
Committed r9
	M	foo
r9 = bcb6887a65ababc07a04e0edbcfbc8be2347e096 (refs/remotes/more fun plugin!)
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
	
HEAD is now at 06c2103 scary
[master 5c6bd31] eep
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/Abo-Uebernahme (Bug #994) ...
	M	foo
Committed r10
	M	foo
r10 = bc702e738195bb180c2406622cc6508ba22e0271 (refs/remotes/Abo-Uebernahme (Bug #994))
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
	
HEAD is now at af5c39d trailing .lock
[master 8c62a80] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/trailing_dotlock.lock ...
	M	foo
Committed r11
	M	foo
r11 = 1359c7fca9f2d6263a4edeb5d556d5e97418dddc (refs/remotes/trailing_dotlock.lock)
No changes between current HEAD and refs/remotes/trailing_dotlock%2Elock
Resetting to the latest refs/remotes/trailing_dotlock%2Elock

ok 5 - test dcommit to trailing_dotlock branch

# passed all 5 test(s)
1..5
