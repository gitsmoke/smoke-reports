Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9152-svn-empty-dirs-after-gc/.git/
expecting success: 
	for i in a b c d d/e d/e/f "weird file name"
	do
		svn_cmd mkdir -m "mkdir $i" "$svnrepo"/"$i"
	done

Committed revision 1.

Committed revision 2.

Committed revision 3.

Committed revision 4.

Committed revision 5.

Committed revision 6.

Committed revision 7.

ok 1 - initialize repo

expecting success: git svn clone "$svnrepo" cloned
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9152-svn-empty-dirs-after-gc/cloned/.git/
r1 = f9cdb01520ee42685e5750e3fada221fad0966aa (refs/remotes/git-svn)
r2 = 00d609afdc743332e2f3d5ac9755ca1bac98731d (refs/remotes/git-svn)
r3 = 6ff536ed7e3bd389d7d4b0d8602f912c29421189 (refs/remotes/git-svn)
r4 = a2127b75a1ec60d1e73cde40086ea623de1e3dff (refs/remotes/git-svn)
r5 = 900ae1c8cc19a213c908ffe460af9e7f7ccb86ac (refs/remotes/git-svn)
r6 = 69538f9b1d5c148dc57250c16086bb29d3602118 (refs/remotes/git-svn)
r7 = 8af1f3dbaf35d048856e066e01aeb4b493c5837a (refs/remotes/git-svn)
creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: d
creating empty directory: d/e
creating empty directory: d/e/f
creating empty directory: weird file name

ok 2 - clone

expecting success: 
	(
		cd cloned &&
		git svn gc
	)
ok 3 - git svn gc runs
expecting success: 
	(
		cd cloned &&
		rm -r * &&
		git svn mkdirs &&
		for i in a b c d d/e d/e/f "weird file name"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done
	)
creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: d
creating empty directory: d/e
creating empty directory: d/e/f
creating empty directory: weird file name

ok 4 - git svn mkdirs recreates empty directories after git svn gc

# passed all 4 test(s)
1..4
