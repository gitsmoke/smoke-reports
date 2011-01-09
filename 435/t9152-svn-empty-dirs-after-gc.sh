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
r1 = f0178f494f0bfaa8492823ccb38cf08242534a62 (refs/remotes/git-svn)
r2 = 5ec8b85eeb36fc332d3e08f4c92645dcaabba8c8 (refs/remotes/git-svn)
r3 = ae22b142bb4591598148c662316d9dd9d2bb663d (refs/remotes/git-svn)
r4 = 2c523fb09472b28f0b03a36ea011d3427d9280fc (refs/remotes/git-svn)
r5 = 68b011a1ba441370c99594873c7ab6ba7f3ce71d (refs/remotes/git-svn)
r6 = 464c6e053a070e83527a48b4548edd028ada88ec (refs/remotes/git-svn)
r7 = c6a911a1022155c24b5344c64e0740486001256f (refs/remotes/git-svn)
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
