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
r1 = 2db7bd32c77a4a1e6e4526926cc24895d5a002a7 (refs/remotes/git-svn)
r2 = ecdc729100267faa1082432b5d479a350a97efce (refs/remotes/git-svn)
r3 = 7e728da045f0bb20d5a9a68b56a7d6c04ea6913c (refs/remotes/git-svn)
r4 = 076c8eebe22a0809d60dd0b4e8235453a94e49b6 (refs/remotes/git-svn)
r5 = 0db478b580f38b5f452610bd01196227ffa0d00a (refs/remotes/git-svn)
r6 = f7c22ed5863ad2a9ebec627d0be89c3a8be15bc3 (refs/remotes/git-svn)
r7 = 678019a90e33f2364bc94aaf851ec2a7300a8e42 (refs/remotes/git-svn)
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
