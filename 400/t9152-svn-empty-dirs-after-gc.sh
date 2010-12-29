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
r1 = cb0c3888cff376d7a435c9c41ccbe3fd81f3ff7a (refs/remotes/git-svn)
r2 = d2f040cbf9a67eff5e3679a20e8c8d6322a75780 (refs/remotes/git-svn)
r3 = 54760f19135fa7783f089c899aabf5adba5132c3 (refs/remotes/git-svn)
r4 = b8bbddc6303da4fdd8492788c81d579ecee78710 (refs/remotes/git-svn)
r5 = ed51d5f75ff6da2ff8ee65c4fc9d3bf7d057ac59 (refs/remotes/git-svn)
r6 = 1516d1bd72004099b5f8ac0091cad6d5deb87127 (refs/remotes/git-svn)
r7 = 06c34f7420379db145ac32c14c9a7fde0974fbae (refs/remotes/git-svn)
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
