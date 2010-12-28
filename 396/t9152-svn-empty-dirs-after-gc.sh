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
r1 = 7b0855765d6a98f804d8337fd99c726370bde661 (refs/remotes/git-svn)
r2 = 09e6b2e2d258a6f77593a91aff03a5d5cdfda838 (refs/remotes/git-svn)
r3 = a0378c102438607e72a7a3f8f1610fa6d0fe20da (refs/remotes/git-svn)
r4 = 605865da0c1eb2e317ff05a2ce1d9f938eb69938 (refs/remotes/git-svn)
r5 = 23995805296b8938d77d87d987d97b320190583d (refs/remotes/git-svn)
r6 = 1688da9a3c9a7aa6060771654d618877cb81e8aa (refs/remotes/git-svn)
r7 = 91e005da2ea95bbc2a012a6172d2aadcb1704870 (refs/remotes/git-svn)
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
