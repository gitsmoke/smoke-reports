Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO8859-1/.git/
r1 = 98cd2be514b3ad620f668d0b29901dc9d0d310ee (refs/remotes/git-svn)
ok 1 - ISO8859-1 setup
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/eucJP/.git/
r2 = 74b53d19f2ecff5f14bbc4ce208b433843e933d1 (refs/remotes/git-svn)

ok 2 - eucJP setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 3.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO-2022-JP/.git/
r3 = bf3c963a7ce78e948bc57b6f4897de9f32ca8822 (refs/remotes/git-svn)

ok 3 - ISO-2022-JP setup

expecting success: 
	(
		cd $H &&
		git config i18n.commitencoding $H &&
		git checkout -b t refs/remotes/git-svn &&
		echo $H >F &&
		git add F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H"
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
[t 4dc4556] ÄËÑÏÖ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F

ok 4 - ISO8859-1 commit on git side

expecting success: 
	(
		cd $H &&
		git config i18n.commitencoding $H &&
		git checkout -b t refs/remotes/git-svn &&
		echo $H >F &&
		git add F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H"
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
[t a675837] ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F

ok 5 - eucJP commit on git side

expecting success: 
	(
		cd $H &&
		git config i18n.commitencoding $H &&
		git checkout -b t refs/remotes/git-svn &&
		echo $H >F &&
		git add F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H"
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
[t 20f313a] $B$O$l$R$[$U(B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F

ok 6 - ISO-2022-JP commit on git side

expecting success: 
	(
		cd $H &&
		git svn dcommit &&
		git cat-file commit HEAD | grep git-svn-id: &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H" &&
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1 ...
	A	F
Committed r4
	A	F
r4 = 23819e70782da11cb5be8a6e927828228c97a499 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1@4 c1b659e0-6ff6-4734-88cb-7362e94ac262

ok 7 - ISO8859-1 dcommit to svn

expecting success: 
	(
		cd $H &&
		git svn dcommit &&
		git cat-file commit HEAD | grep git-svn-id: &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H" &&
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP ...
	A	F
Committed r5
	A	F
r5 = fc2bb9579e0b299a85d3f0da8a8092fc1e1f73cd (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP@5 c1b659e0-6ff6-4734-88cb-7362e94ac262

ok 8 - eucJP dcommit to svn

expecting success: 
	(
		cd $H &&
		git svn dcommit &&
		git cat-file commit HEAD | grep git-svn-id: &&
		E=$(git cat-file commit HEAD | sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H" &&
		compare_git_head_with "$TEST_DIRECTORY"/t3900/$H.txt
	)
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP ...
	A	F
Committed r6
	A	F
r6 = 0bd78ea4a9c0d16e59837ba7681d4db2b7752e46 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP@6 c1b659e0-6ff6-4734-88cb-7362e94ac262

ok 9 - ISO-2022-JP dcommit to svn

expecting success: 
	(
		cd ISO8859-1 &&
		compare_svn_head_with "$TEST_DIRECTORY"/t3900/1-UTF-8.txt
	)

ok 10 - ISO-8859-1 should match UTF-8 in svn

expecting success: 
		(
			cd $H &&
			compare_svn_head_with "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
		)
	
ok 11 - eucJP should match UTF-8 in svn

expecting success: 
		(
			cd $H &&
			compare_svn_head_with "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
		)
	

ok 12 - ISO-2022-JP should match UTF-8 in svn

# passed all 12 test(s)
1..12
