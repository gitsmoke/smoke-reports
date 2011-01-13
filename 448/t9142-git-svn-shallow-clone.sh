Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9142-git-svn-shallow-clone/.git/
expecting success: 
	svn_cmd mkdir -m "create standard layout" \
	  "$svnrepo"/trunk "$svnrepo"/branches "$svnrepo"/tags &&
	svn_cmd cp -m "branch off trunk" \
	  "$svnrepo"/trunk "$svnrepo"/branches/a &&
	svn_cmd co "$svnrepo"/branches/a &&
	(
		cd a &&
		> foo &&
		svn_cmd add foo &&
		svn_cmd commit -m "add foo"
	) &&
	start_httpd

Committed revision 1.

Committed revision 2.
Checked out revision 2.
A         foo
Adding         foo
Transmitting file data .
Committed revision 3.

ok 1 - setup test repository

expecting success: 
	git svn clone -r HEAD "$svnrepo/trunk" g &&
	( cd g && git rev-parse --symbolic --verify HEAD )
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9142-git-svn-shallow-clone/g/.git/
r1 = 518f7f0cdb4d6ccc9cf2f5f61144888c20a4d0b8 (refs/remotes/git-svn)
HEAD

ok 2 - clone trunk with "-r HEAD"

# passed all 2 test(s)
1..2
