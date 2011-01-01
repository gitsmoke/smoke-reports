Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO8859-1/.git/
r1 = cd35d4f54e964f320d7547ddbbc4b19c9f99b300 (refs/remotes/git-svn)

ok 1 - ISO8859-1 setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/eucJP/.git/
r2 = 79d1b47b980ac528a748533187fae2c314fa3784 (refs/remotes/git-svn)

ok 2 - eucJP setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 3.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO-2022-JP/.git/
r3 = 640e477b824d98bd6947f6b0b8e83439d5285349 (refs/remotes/git-svn)
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
	
[t 96c5f16] ÄËÑÏÖ
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
	
[t 630d65f] ¤Ï¤ì¤Ò¤Û¤Õ
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
	
[t 41b6047] $B$O$l$R$[$U(B
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
r4 = 8805e2dc7d741c068d69a07e7953a22bd56d1120 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1@4 089e3ada-7b7f-4d27-b09e-9e93067d9c5b

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
r5 = 22da241dfd6969edd2f64720ecdcf2139e0f5584 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP@5 089e3ada-7b7f-4d27-b09e-9e93067d9c5b

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
r6 = 0c95738fe619c2fe92b75dba546855aa357651d8 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP@6 089e3ada-7b7f-4d27-b09e-9e93067d9c5b

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
