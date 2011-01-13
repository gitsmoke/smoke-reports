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
r1 = bd4eb63165ed3eec4be54d7df6453e43f004e0d3 (refs/remotes/git-svn)
r2 = 1edd3a84c107facd00a4f8162ddebea73ab1b2ef (refs/remotes/git-svn)
r3 = 1acc1a46837862254cd748f85e26e13627cac25d (refs/remotes/git-svn)
r4 = ced4500980605a6aa2b7c38dd8e2a732536d5c44 (refs/remotes/git-svn)
r5 = 45db0c190dadb445dd9d571efc8207ef9560ddb7 (refs/remotes/git-svn)
r6 = 021fe006e5f950061f764638bd6bb0d7f9c432e7 (refs/remotes/git-svn)
r7 = 91b4023eebd553f08e057b4281746cab4f7357a9 (refs/remotes/git-svn)
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
