Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO8859-1/.git/
r1 = 0918f287777b64c300ffb43afd936b1872fc428b (refs/remotes/git-svn)

ok 1 - ISO8859-1 setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/eucJP/.git/
r2 = 83dcd00a55a380a89c5e0853267223a8669a225f (refs/remotes/git-svn)

ok 2 - eucJP setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 3.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/ISO-2022-JP/.git/
r3 = d3dd9946b23a54b83d8365437a8522af26ee5046 (refs/remotes/git-svn)

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
	
[t bc1edae] �����
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
	
[t 4761080] �Ϥ�Ҥۤ�
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
	
[t e51a771] $B$O$l$R$[$U(B
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
r4 = 337bb12b246b5d17a47ad46d5d0f8fc3e267ca5b (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO8859-1@4 d3edef54-c76a-4a36-9719-2448bfe712fb

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
r5 = 4d715fb8707b4fff758d9b2aa57d19a38604d26d (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/eucJP@5 d3edef54-c76a-4a36-9719-2448bfe712fb

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
r6 = 8b71788e64ee993cd45b4992bbb5a839db5a2ec2 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9129-git-svn-i18n-commitencoding/svnrepo/ISO-2022-JP@6 d3edef54-c76a-4a36-9719-2448bfe712fb

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
