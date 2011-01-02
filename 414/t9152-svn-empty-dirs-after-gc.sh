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
r1 = df16493fe75ea81c48fdf63fd50d16b6bb4ddbd9 (refs/remotes/git-svn)
r2 = 6f45c43aa06661c8f3e67c55f67af51c3d81f245 (refs/remotes/git-svn)
r3 = 31f3b3a18f5a3242b07f40ffeb82e96520e41768 (refs/remotes/git-svn)
r4 = 4131ee2a1b40ebc2e185a9bf32c68550b75c0823 (refs/remotes/git-svn)
r5 = 8d3567f3201b4475a13cb4c355d52f9563b50430 (refs/remotes/git-svn)
r6 = ea1200649c017fd8155f115e63ecaf9a415d2dde (refs/remotes/git-svn)
r7 = 55f61284709d36b95e3e5f91afb0481f45bab548 (refs/remotes/git-svn)
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
