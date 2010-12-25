Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9112-git-svn-md5less-file/.git/
expecting success: svnadmin load "$rawsvnrepo" < dumpfile.svn
<<< Started new transaction, based on original revision 1
     * adding path : md5less-file ... done.

------- Committed revision 1 >>>

ok 1 - load svn dumpfile

expecting success: git svn init "$svnrepo"

ok 2 - initialize git svn
expecting success: git svn fetch
	A	md5less-file
r1 = 605dee320e1b8c949f3b377c9ecf892ee7457ee3 (refs/remotes/git-svn)

ok 3 - fetch revisions from svn

# passed all 3 test(s)
1..3
