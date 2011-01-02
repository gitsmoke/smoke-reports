Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
expecting success: 
		svnadmin create "$label-svn" &&
		svnadmin load "$label-svn" < "$TEST_DIRECTORY/$dump" &&
		svn_cmd export "file://$PWD/$label-svn" "$label-svnco" &&
		git init "$label-git" &&
		test-svn-fe "$TEST_DIRECTORY/$dump" >"$label.fe" &&
		(
			cd "$label-git" &&
			git fast-import < ../"$label.fe"
		) &&
		(
			cd "$label-svnco" &&
			git init &&
			git add . &&
			git fetch "../$label-git" master &&
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
ok 1 - t9135/svn.dump

# passed all 1 test(s)
1..1
