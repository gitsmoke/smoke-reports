Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9119-git-svn-info/.git/
expecting success: 
	mkdir info &&
	(
		cd info &&
		echo FIRST >A &&
		echo one >file &&
		ln -s file symlink-file &&
		mkdir directory &&
		touch directory/.placeholder &&
		ln -s directory symlink-directory &&
		svn_cmd import -m "initial" . "$svnrepo"
	) &&
	svn_cmd co "$svnrepo" svnwc &&
	(
		cd svnwc &&
		echo foo >foo &&
		svn_cmd add foo &&
		svn_cmd commit -m "change outside directory" &&
		svn_cmd update
	) &&
	mkdir gitwc &&
	(
		cd gitwc &&
		git svn init "$svnrepo" &&
		git svn fetch
	)
	
Adding         file
Adding         A
Adding         symlink-file
Adding         directory
Adding         directory/.placeholder
Adding         symlink-directory

Committed revision 1.
A    svnwc/file
A    svnwc/A
A    svnwc/symlink-file
A    svnwc/directory
A    svnwc/directory/.placeholder
A    svnwc/symlink-directory
Checked out revision 1.
A         foo
Adding         foo
Transmitting file data .
Committed revision 2.
At revision 2.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9119-git-svn-info/gitwc/.git/
	A	file
	A	A
	A	symlink-file
	A	directory/.placeholder
	A	symlink-directory
r1 = f833d21b42996a1595a62020205cd5bd3e4c4eeb (refs/remotes/git-svn)
	A	foo
r2 = 5517798e4330555162da324adae4650551c3b989 (refs/remotes/git-svn)

ok 1 - setup repository and import

expecting success: 
	(cd svnwc; svn info) > expected.info &&
	(cd gitwc; git svn info) > actual.info &&
	test_cmp_info expected.info actual.info
	
ok 2 - info

expecting success: 
	test "$(cd gitwc; git svn info --url)" = "$quoted_svnrepo"
	

ok 3 - info --url

expecting success: 
	(cd svnwc; svn info .) > expected.info-dot &&
	(cd gitwc; git svn info .) > actual.info-dot &&
	test_cmp_info expected.info-dot actual.info-dot
	

ok 4 - info .

expecting success: 
	test "$(cd gitwc; git svn info --url .)" = "$quoted_svnrepo"
	

ok 5 - info --url .

expecting success: 
	(cd svnwc; svn info file) > expected.info-file &&
	(cd gitwc; git svn info file) > actual.info-file &&
	test_cmp_info expected.info-file actual.info-file
	

ok 6 - info file

expecting success: 
	test "$(cd gitwc; git svn info --url file)" = "$quoted_svnrepo/file"
	

ok 7 - info --url file

expecting success: 
	(cd svnwc; svn info directory) > expected.info-directory &&
	(cd gitwc; git svn info directory) > actual.info-directory &&
	test_cmp_info expected.info-directory actual.info-directory
	

ok 8 - info directory

expecting success: 
	(cd svnwc/directory; svn info) > expected.info-inside-directory &&
	(cd gitwc/directory; git svn info) > actual.info-inside-directory &&
	test_cmp_info expected.info-inside-directory actual.info-inside-directory
	

ok 9 - info inside directory

expecting success: 
	test "$(cd gitwc; git svn info --url directory)" = "$quoted_svnrepo/directory"
	

ok 10 - info --url directory

expecting success: 
	(cd svnwc; svn info symlink-file) > expected.info-symlink-file &&
	(cd gitwc; git svn info symlink-file) > actual.info-symlink-file &&
	test_cmp_info expected.info-symlink-file actual.info-symlink-file
	

ok 11 - info symlink-file

expecting success: 
	test "$(cd gitwc; git svn info --url symlink-file)" \
	     = "$quoted_svnrepo/symlink-file"
	

ok 12 - info --url symlink-file

expecting success: 
	(cd svnwc; svn info symlink-directory) 		> expected.info-symlink-directory &&
	(cd gitwc; git svn info symlink-directory) 		> actual.info-symlink-directory &&
	test_cmp_info expected.info-symlink-directory actual.info-symlink-directory
	

ok 13 - info symlink-directory

expecting success: 
	test "$(cd gitwc; git svn info --url symlink-directory)" \
	     = "$quoted_svnrepo/symlink-directory"
	

ok 14 - info --url symlink-directory

expecting success: 
	echo two > gitwc/added-file &&
	(
		cd gitwc &&
		git add added-file
	) &&
	cp gitwc/added-file svnwc/added-file &&
	(
		cd svnwc &&
		svn_cmd add added-file > /dev/null
	) &&
	(cd svnwc; svn info added-file) > expected.info-added-file &&
	(cd gitwc; git svn info added-file) > actual.info-added-file &&
	test_cmp_info expected.info-added-file actual.info-added-file
	

ok 15 - info added-file

expecting success: 
	test "$(cd gitwc; git svn info --url added-file)" \
	     = "$quoted_svnrepo/added-file"
	

ok 16 - info --url added-file

expecting success: 
	mkdir gitwc/added-directory svnwc/added-directory &&
	touch gitwc/added-directory/.placeholder &&
	(
		cd svnwc &&
		svn_cmd add added-directory > /dev/null
	) &&
	(
		cd gitwc &&
		git add added-directory
	) &&
	(cd svnwc; svn info added-directory) 		> expected.info-added-directory &&
	(cd gitwc; git svn info added-directory) 		> actual.info-added-directory &&
	test_cmp_info expected.info-added-directory actual.info-added-directory
	

ok 17 - info added-directory

expecting success: 
	test "$(cd gitwc; git svn info --url added-directory)" \
	     = "$quoted_svnrepo/added-directory"
	

ok 18 - info --url added-directory

expecting success: 
	(
		cd gitwc &&
		ln -s added-file added-symlink-file &&
		git add added-symlink-file
	) &&
	(
		cd svnwc &&
		ln -s added-file added-symlink-file &&
		svn_cmd add added-symlink-file > /dev/null
	) &&
	(cd svnwc; svn info added-symlink-file) 		> expected.info-added-symlink-file &&
	(cd gitwc; git svn info added-symlink-file) 		> actual.info-added-symlink-file &&
	test_cmp_info expected.info-added-symlink-file 		actual.info-added-symlink-file
	

ok 19 - info added-symlink-file

expecting success: 
	test "$(cd gitwc; git svn info --url added-symlink-file)" \
	     = "$quoted_svnrepo/added-symlink-file"
	

ok 20 - info --url added-symlink-file

expecting success: 
	(
		cd gitwc &&
		ln -s added-directory added-symlink-directory &&
		git add added-symlink-directory
	) &&
	(
		cd svnwc &&
		ln -s added-directory added-symlink-directory &&
		svn_cmd add added-symlink-directory > /dev/null
	) &&
	(cd svnwc; svn info added-symlink-directory) 		> expected.info-added-symlink-directory &&
	(cd gitwc; git svn info added-symlink-directory) 		> actual.info-added-symlink-directory &&
	test_cmp_info expected.info-added-symlink-directory 		actual.info-added-symlink-directory
	

ok 21 - info added-symlink-directory

expecting success: 
	test "$(cd gitwc; git svn info --url added-symlink-directory)" \
	     = "$quoted_svnrepo/added-symlink-directory"
	

ok 22 - info --url added-symlink-directory

expecting success: 
	(
		cd gitwc &&
		git rm -f file > /dev/null
	) &&
	(
		cd svnwc &&
		svn_cmd rm --force file > /dev/null
	) &&
	(cd svnwc; svn info file) >expected.info-deleted-file &&
	(cd gitwc; git svn info file) >actual.info-deleted-file &&
	test_cmp_info expected.info-deleted-file actual.info-deleted-file
	

ok 23 - info deleted-file

expecting success: 
	test "$(cd gitwc; git svn info --url file)" \
	     = "$quoted_svnrepo/file"
	

ok 24 - info --url file (deleted)

expecting success: 
	(
		cd gitwc &&
		git rm -r -f directory > /dev/null
	) &&
	(
		cd svnwc &&
		svn_cmd rm --force directory > /dev/null
	) &&
	(cd svnwc; svn info directory) >expected.info-deleted-directory &&
	(cd gitwc; git svn info directory) >actual.info-deleted-directory &&
	test_cmp_info expected.info-deleted-directory actual.info-deleted-directory
	

ok 25 - info deleted-directory

expecting success: 
	test "$(cd gitwc; git svn info --url directory)" \
	     = "$quoted_svnrepo/directory"
	

ok 26 - info --url directory (deleted)

expecting success: 
	(
		cd gitwc &&
		git rm -f symlink-file > /dev/null
	) &&
	(
		cd svnwc &&
		svn_cmd rm --force symlink-file > /dev/null
	) &&
	(cd svnwc; svn info symlink-file) >expected.info-deleted-symlink-file &&
	(cd gitwc; git svn info symlink-file) >actual.info-deleted-symlink-file &&
	test_cmp_info expected.info-deleted-symlink-file actual.info-deleted-symlink-file
	

ok 27 - info deleted-symlink-file

expecting success: 
	test "$(cd gitwc; git svn info --url symlink-file)" \
	     = "$quoted_svnrepo/symlink-file"
	

ok 28 - info --url symlink-file (deleted)

expecting success: 
	(
		cd gitwc &&
		git rm -f symlink-directory > /dev/null
	) &&
	(
		cd svnwc &&
		svn_cmd rm --force symlink-directory > /dev/null
	) &&
	(cd svnwc; svn info symlink-directory) >expected.info-deleted-symlink-directory &&
	(cd gitwc; git svn info symlink-directory) >actual.info-deleted-symlink-directory &&
	test_cmp_info expected.info-deleted-symlink-directory actual.info-deleted-symlink-directory
	

ok 29 - info deleted-symlink-directory

expecting success: 
	test "$(cd gitwc; git svn info --url symlink-directory)" \
	     = "$quoted_svnrepo/symlink-directory"
	

ok 30 - info --url symlink-directory (deleted)

expecting success: 
	echo two > gitwc/unknown-file &&
	(cd gitwc; test_must_fail git svn info unknown-file) 		 2> actual.info-unknown-file &&
	grep unknown-file actual.info-unknown-file
	
svn: 'unknown-file' is not under version control

ok 31 - info unknown-file

expecting success: 
	echo two > gitwc/unknown-file &&
	(cd gitwc; test_must_fail git svn info --url unknown-file) \
		 2> actual.info-url-unknown-file &&
	grep unknown-file actual.info-url-unknown-file
	
svn: 'unknown-file' is not under version control

ok 32 - info --url unknown-file

expecting success: 
	mkdir gitwc/unknown-directory svnwc/unknown-directory &&
	(cd gitwc; test_must_fail git svn info unknown-directory) 		 2> actual.info-unknown-directory &&
	grep unknown-directory actual.info-unknown-directory
	
svn: 'unknown-directory' is not under version control

ok 33 - info unknown-directory

expecting success: 
	(cd gitwc; test_must_fail git svn info --url unknown-directory) \
		 2> actual.info-url-unknown-directory &&
	grep unknown-directory actual.info-url-unknown-directory
	
svn: 'unknown-directory' is not under version control

ok 34 - info --url unknown-directory

expecting success: 
	(
		cd gitwc &&
		ln -s unknown-file unknown-symlink-file
	) &&
	(cd gitwc; test_must_fail git svn info unknown-symlink-file) 		 2> actual.info-unknown-symlink-file &&
	grep unknown-symlink-file actual.info-unknown-symlink-file
	
svn: 'unknown-symlink-file' is not under version control

ok 35 - info unknown-symlink-file

expecting success: 
	(cd gitwc; test_must_fail git svn info --url unknown-symlink-file) \
		 2> actual.info-url-unknown-symlink-file &&
	grep unknown-symlink-file actual.info-url-unknown-symlink-file
	
svn: 'unknown-symlink-file' is not under version control

ok 36 - info --url unknown-symlink-file

expecting success: 
	(
		cd gitwc &&
		ln -s unknown-directory unknown-symlink-directory
	) &&
	(cd gitwc; test_must_fail git svn info unknown-symlink-directory) 		 2> actual.info-unknown-symlink-directory &&
	grep unknown-symlink-directory actual.info-unknown-symlink-directory
	
svn: 'unknown-symlink-directory' is not under version control

ok 37 - info unknown-symlink-directory

expecting success: 
	(cd gitwc; test_must_fail git svn info --url unknown-symlink-directory) \
		 2> actual.info-url-unknown-symlink-directory &&
	grep unknown-symlink-directory actual.info-url-unknown-symlink-directory
	
svn: 'unknown-symlink-directory' is not under version control

ok 38 - info --url unknown-symlink-directory

# passed all 38 test(s)
1..38
