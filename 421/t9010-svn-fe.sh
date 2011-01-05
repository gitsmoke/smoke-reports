Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
expecting success: 
	reinit_git &&
	echo "SVN-fs-dump-format-version: 2" >input &&
	test-svn-fe input >stream &&
	git fast-import <stream
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
ok 1 - empty dump
expecting success: 
	reinit_git &&
	echo "SVN-fs-dump-format-version: 3" >input &&
	test_must_fail test-svn-fe input >stream &&
	test_cmp empty stream
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
ok 2 - v3 dumps not supported
expecting success: 
	svnadmin create simple-svn &&
	svnadmin load simple-svn <"$TEST_DIRECTORY/t9135/svn.dump" &&
	svn_cmd export "file://$PWD/simple-svn" simple-svnco &&
	git init simple-git &&
	test-svn-fe "$TEST_DIRECTORY/t9135/svn.dump" >simple.fe &&
	(
		cd simple-git &&
		git fast-import <../simple.fe
	) &&
	(
		cd simple-svnco &&
		git init &&
		git add . &&
		git fetch ../simple-git master &&
		git diff --exit-code FETCH_HEAD
	)
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
A    simple-svnco
A    simple-svnco/trunk
A    simple-svnco/branches
A    simple-svnco/branches/branch-b
A    simple-svnco/branches/branch-b/b1
A    simple-svnco/branches/branch-c
A    simple-svnco/branches/branch-c/b1
Exported revision 6.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/simple-git/.git/
progress Imported commit 1.
progress Imported commit 2.
progress Imported commit 3.
progress Imported commit 4.
progress Imported commit 5.
progress Imported commit 6.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/simple-svnco/.git/
ok 3 - t9135/svn.dump

# passed all 3 test(s)
1..3
