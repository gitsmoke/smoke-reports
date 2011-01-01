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
r1 = fb2ec5d759447f48e6f6ce9885a9fef6798f4c0a (refs/remotes/git-svn)
r2 = 1995309e643958d81ab4c60dc1594836256df54b (refs/remotes/git-svn)
r3 = cda4451e3eff1034961619a944b970eafec93635 (refs/remotes/git-svn)
r4 = ba26df9c117a9ed2e20e6e5954e01a5bdaf7dc37 (refs/remotes/git-svn)
r5 = c06cac5452b2d19e4d6c0a5c03f7351fa00fbd92 (refs/remotes/git-svn)
r6 = f28eda5e408dfe0aa4dbb429b64c4289d743c6ea (refs/remotes/git-svn)
r7 = f16f24804faed728612dbf18cf82d96dcfb8236c (refs/remotes/git-svn)
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
