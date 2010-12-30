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
r1 = 3e7829bf23c4e60653ebe16b361584ac966795d7 (refs/remotes/git-svn)
r2 = 57569a9c041769ef6d6fffdfeea79690149a696a (refs/remotes/git-svn)
r3 = 410226456c3dbf34c40f84956916d44fdea5fb3f (refs/remotes/git-svn)
r4 = 8cab5754faea753302d50234c80da21837459f44 (refs/remotes/git-svn)
r5 = f91a8846c123c6d644bdf0e6ba3d19ef6b35d5ec (refs/remotes/git-svn)
r6 = 58417396bbfcc70a6a9b706cf763f065b96716a6 (refs/remotes/git-svn)
r7 = 82b97bb27665a03180ec58f6af29e6a7f513eb43 (refs/remotes/git-svn)
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
