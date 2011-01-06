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
r1 = c51ebe45b73be5c199aa0e489aca8199188808d0 (refs/remotes/git-svn)
r2 = 6e1e8e70a48fce6ba845fe9e7eea60747f221f3c (refs/remotes/git-svn)
r3 = c2d5fcde62db5fb7932057fe3d878e2c7cf722bf (refs/remotes/git-svn)
r4 = 664d1ea5b5aeb1a3838d215580c915d56aa726cf (refs/remotes/git-svn)
r5 = a3dc10f45e03c18662084838c229c60e350de020 (refs/remotes/git-svn)
r6 = f9135fe27922972a30599e46c2dea6b7f96445a5 (refs/remotes/git-svn)
r7 = 78fc4af0b272997ca0c523765a9bc7430f374bf4 (refs/remotes/git-svn)
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
