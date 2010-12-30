Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9139-git-svn-non-utf8-commitencoding/.git/
expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 1.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9139-git-svn-non-utf8-commitencoding/ISO8859-1/.git/
r1 = b7c29002639be1778d13239890990147dc8d9e4a (refs/remotes/git-svn)

ok 1 - ISO8859-1 setup

expecting success: 
		mkdir $H &&
		svn_cmd import -m "$H test" $H "$svnrepo"/$H &&
		git svn clone "$svnrepo"/$H $H
	

Committed revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9139-git-svn-non-utf8-commitencoding/eucJP/.git/
r2 = a32f58c6dd9c43b43a3eff1d9b7f14d9466d4ade (refs/remotes/git-svn)
ok 2 - eucJP setup
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
	)
	
[t 94d1674] ÄËÑÏÖ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F

ok 3 - ISO8859-1 commit on git side
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
	)
	
[t 33eac6b] ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F

ok 4 - eucJP commit on git side
expecting success: 
	(
		cd $H &&
		git config --unset i18n.commitencoding &&
		test_must_fail git svn dcommit
	)
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9139-git-svn-non-utf8-commitencoding/svnrepo/ISO8859-1 ...

ok 5 - ISO8859-1 dcommit to svn

expecting success: 
	(
		cd $H &&
		git config --unset i18n.commitencoding &&
		test_must_fail git svn dcommit
	)
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9139-git-svn-non-utf8-commitencoding/svnrepo/eucJP ...

ok 6 - eucJP dcommit to svn

# passed all 6 test(s)
1..6
