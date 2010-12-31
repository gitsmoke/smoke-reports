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
r1 = 4a46efd8d0d2bdd9f701031ceb975a4000511926 (refs/remotes/git-svn)
r2 = 6d534e1187c8aba4217632196cbf93c20fcaab53 (refs/remotes/git-svn)
r3 = 7310c3b4e3bcbfd5cfe674bc4b897a736d86a8b0 (refs/remotes/git-svn)
r4 = 2659104339d41a5fec0a906d6aae5a9b2915df2b (refs/remotes/git-svn)
r5 = 9c054e36faabe1165f30e0da4863f0cf174732f2 (refs/remotes/git-svn)
r6 = f790c3af8b94d56f3baec7b2e56289dd315ab922 (refs/remotes/git-svn)
r7 = 0a595932c35944b5e7284826d66cb9b04091a896 (refs/remotes/git-svn)
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
