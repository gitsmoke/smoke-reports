Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9135-git-svn-moved-branch-empty-file/.git/
expecting success: 
	svnadmin load "$rawsvnrepo" < "${TEST_DIRECTORY}/t9135/svn.dump"
	
<<< Started new transaction, based on original revision 1
     * adding path : branches ... done.
     * adding path : trunk ... done.

------- Committed revision 1 >>>

<<< Started new transaction, based on original revision 2
     * adding path : branches/branch-b ...COPIED... done.

------- Committed revision 2 >>>

<<< Started new transaction, based on original revision 3
     * adding path : branches/branch-b/b1 ... done.

------- Committed revision 3 >>>

<<< Started new transaction, based on original revision 4
     * adding path : branches/branch-c ...COPIED... done.

------- Committed revision 4 >>>

<<< Started new transaction, based on original revision 5
     * deleting path : branches/branch-c ... done.

------- Committed revision 5 >>>
<<< Started new transaction, based on original revision 6
     * adding path : branches/branch-c ...COPIED... done.

------- Committed revision 6 >>>

ok 1 - load svn dumpfile
expecting success: git svn clone -s "$svnrepo" x
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9135-git-svn-moved-branch-empty-file/x/.git/
r1 = 6a026ff94d3ac3d50e3076a07b439328e11af179 (refs/remotes/trunk)
r2 = 47c954c136403698ac727ba99e42505a23322091 (refs/remotes/branch-b)
	A	b1
r3 = 4ba68bea77cb9ad0aa70c656524de6efc5f6a609 (refs/remotes/branch-b)
r4 = 16f4df8b2e04e61ec5566804176546e88c3ea26d (refs/remotes/branch-c)
r6 = a9256c2b32e3d527760deb30e1f82bef62cee0c8 (refs/remotes/branch-c)

ok 2 - clone using git svn

expecting success: 
	(
		cd x &&
		git reset --hard branch-c &&
		test -f b1 &&
		! test -s b1
	)
	
HEAD is now at a9256c2 branch-c off of branch-b
ok 3 - test that b1 exists and is empty
# passed all 3 test(s)
1..3
