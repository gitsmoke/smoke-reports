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
r1 = d59822ace48cfffda034eb40175c8203118b12d4 (refs/remotes/trunk)
r2 = ff6d2dc642af6d92eb33b5ce924ce5f81bea3b16 (refs/remotes/fun plugin)
r3 = 3c6cffa2206810c5856e9bca668b23bde2dfb93b (refs/remotes/more fun plugin!)
r4 = 48aa796d4c1ec877f677bffe2ad4e76b09371bb6 (refs/remotes/Abo-Uebernahme (Bug #994))
r5 = 46592afdf6088e94b2899296e1eb707f40acfad2 (refs/remotes/.leading_dot)
r6 = 10ee02b0a70f2522f227200d876fc36f134243b7 (refs/remotes/trailing_dot.)
r7 = 7454c207bb1f10c7541c703aaa3b85692bf1a874 (refs/remotes/trailing_dotlock.lock)
r8 = 61d3343bb515f474f9911d1bc68947ee294e919e (refs/remotes/not-a@{0}reflog)
ff6d2dc642af6d92eb33b5ce924ce5f81bea3b16
3c6cffa2206810c5856e9bca668b23bde2dfb93b
48aa796d4c1ec877f677bffe2ad4e76b09371bb6
46592afdf6088e94b2899296e1eb707f40acfad2
10ee02b0a70f2522f227200d876fc36f134243b7
7454c207bb1f10c7541c703aaa3b85692bf1a874
61d3343bb515f474f9911d1bc68947ee294e919e
ok 2 - test clone with funky branch names
expecting success: 
	(
		cd project &&
		git reset --hard 'refs/remotes/more%20fun%20plugin!' &&
		echo hello >> foo &&
		git commit -m 'hello' -- foo &&
		git svn dcommit
	)
	
HEAD is now at 3c6cffa more fun!
[master d247e8d] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/more fun plugin! ...
	M	foo
Committed r9
	M	foo
r9 = bf28297949c2052dc7078164e4bd74367fcc6a5d (refs/remotes/more fun plugin!)
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
	
HEAD is now at 48aa796 scary
[master 581e0f0] eep
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/Abo-Uebernahme (Bug #994) ...
	M	foo
Committed r10
	M	foo
r10 = 33b7079d4eadf325facb3f778de24d8e2edae8d8 (refs/remotes/Abo-Uebernahme (Bug #994))
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
	
HEAD is now at 7454c20 trailing .lock
[master 744cb3e] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9118-git-svn-funky-branch-names/svnrepo/pr ject/branches/trailing_dotlock.lock ...
	M	foo
Committed r11
	M	foo
r11 = e30d0252742b516c9ab45e8869a79f8febaf516c (refs/remotes/trailing_dotlock.lock)
No changes between current HEAD and refs/remotes/trailing_dotlock%2Elock
Resetting to the latest refs/remotes/trailing_dotlock%2Elock

ok 5 - test dcommit to trailing_dotlock branch
# passed all 5 test(s)
1..5
