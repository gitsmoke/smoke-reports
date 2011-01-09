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
r1 = 9d02b8412d3e8768120d420380cf43fc5f90b10b (refs/remotes/git-svn)
r2 = 8b26cccb4e9b74174236bb00329154f55ab80f03 (refs/remotes/git-svn)
r3 = 1baa526e680150cd3cfed6153ba8888f73764138 (refs/remotes/git-svn)
r4 = 111ba6972111511bfabe4b48cfff26415b133215 (refs/remotes/git-svn)
r5 = 9c4225be005db24e16466e82d8c63fba5ad4b4c7 (refs/remotes/git-svn)
r6 = 0e4ac838a37f9b25c6b9e2744853e79e46092302 (refs/remotes/git-svn)
r7 = ebbc94070adf7c942b36a78ad7a0191677a0b825 (refs/remotes/git-svn)
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
