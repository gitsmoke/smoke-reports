Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9136-git-svn-recreated-branch-empty-file/.git/
expecting success: 
	svnadmin load "$rawsvnrepo" < "${TEST_DIRECTORY}/t9136/svn.dump"
	
<<< Started new transaction, based on original revision 1
     * adding path : branches ... done.
     * adding path : tags ... done.
     * adding path : trunk ... done.
     * adding path : trunk/file ... done.

------- Committed revision 1 >>>
<<< Started new transaction, based on original revision 2
     * adding path : tags/1.0 ...COPIED... done.

------- Committed revision 2 >>>
<<< Started new transaction, based on original revision 3
     * adding path : tags/1.0.1 ...COPIED... done.

------- Committed revision 3 >>>
<<< Started new transaction, based on original revision 4
     * deleting path : tags/1.0.1 ... done.

------- Committed revision 4 >>>
<<< Started new transaction, based on original revision 5
     * adding path : branches/1.0 ...COPIED... done.

------- Committed revision 5 >>>

<<< Started new transaction, based on original revision 6
     * adding path : tags/1.0.1 ...COPIED... done.

------- Committed revision 6 >>>


ok 1 - load svn dumpfile

expecting success: git svn clone -s "$svnrepo" x
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9136-git-svn-recreated-branch-empty-file/x/.git/
	A	file
r1 = 2b6bd477ed1a52658cb5ef35f441c2a0388b17ac (refs/remotes/trunk)
r2 = 6b283cc2cdae8755b96da9bc39418e0fcb59c672 (refs/remotes/tags/1.0)
r3 = 4bc3fcc192e857630114980ea18a13ba9128f5e0 (refs/remotes/tags/1.0.1)
r5 = 0fe3b6806d82c3eb768ed19f507cc1406211d27d (refs/remotes/1.0)
r6 = 424339c9721793dc29c681088bfec9bbb113b43f (refs/remotes/tags/1.0.1)
ok 2 - clone using git svn

# passed all 2 test(s)
1..2
