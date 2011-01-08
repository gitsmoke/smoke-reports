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
r1 = 95b4ad8f9ffecd5eee2ec6bfa7ad4d201faba76e (refs/remotes/git-svn)
r2 = 4257ebca99d7ea05d730edcc4521b9afb4bcbc7a (refs/remotes/git-svn)
r3 = 351132fce01bd1c8389e45e37736cce7fd24f083 (refs/remotes/git-svn)
r4 = 3fdc8977acf05c24d324d7f42e5230aa092d011d (refs/remotes/git-svn)
r5 = 1ac00c483137b83f1d3d01755e4398d135eab026 (refs/remotes/git-svn)
r6 = 71d091475edfcba54a7cdcee46788519d180f41c (refs/remotes/git-svn)
r7 = 7d09332bf387cf4ad9287c6b469d38e2af547464 (refs/remotes/git-svn)
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
