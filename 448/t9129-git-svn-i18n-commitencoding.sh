Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO8859-1/.git/
r1 = a176c14775bb3c7fa8bb0dfbcdf4739ea638a602 (refs/remotes/git-svn)

ok 1 - ISO8859-1 setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/eucJP/.git/
r2 = 987eb7366aef05f7db07bfa2aff12a2dcd0fe225 (refs/remotes/git-svn)

ok 2 - eucJP setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 3.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO-2022-JP/.git/
r3 = 55c1a93c1037103acbfd5541e75a9a2af3dcf360 (refs/remotes/git-svn)

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
	
[t a463df1] �����
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
	
[t 3214d09] �Ϥ�Ҥۤ�
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
	
[t fb67291] $B$O$l$R$[$U(B
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
r4 = d6132338845f91ddf7ed800085275e2b85ad326b (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1@4 a0929473-d792-4849-a55e-59a5513d2339

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
r5 = 391c948c3ff8f24bd95b0e3c63a0e0144bd45123 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP@5 a0929473-d792-4849-a55e-59a5513d2339

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
r6 = cddf1aaf6b40994102239a393934b0c1fcaba398 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP@6 a0929473-d792-4849-a55e-59a5513d2339

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
