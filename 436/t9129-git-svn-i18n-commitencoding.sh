Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO8859-1/.git/
r1 = 4837ff4003356f2d89e40df2aab00416d7ff77fe (refs/remotes/git-svn)

ok 1 - ISO8859-1 setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/eucJP/.git/
r2 = 6fd30a62f47f6b9714b8dd43b63c10c23bd85115 (refs/remotes/git-svn)

ok 2 - eucJP setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 3.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO-2022-JP/.git/
r3 = f0902231328ef660f0adb437d1c9cb617c77819f (refs/remotes/git-svn)

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
	
[t a41ee8c] ÄËÑÏÖ
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
	
[t 167b458] ¤Ï¤ì¤Ò¤Û¤Õ
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
	
[t d6bc074] $B$O$l$R$[$U(B
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
r4 = bbe9f6f54fd5199ec97c52ee2a31047d21a65345 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1@4 2906b676-ccbb-4d89-a1e3-1f72ff0b478b

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
r5 = 4c7376ba2b7a812faf765689b1e0b6c2a2d9ebe6 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP@5 2906b676-ccbb-4d89-a1e3-1f72ff0b478b

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
r6 = 769b2f60f8209e3968c2c015f6a635ba90ccfc58 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP@6 2906b676-ccbb-4d89-a1e3-1f72ff0b478b

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
