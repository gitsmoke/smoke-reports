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
r1 = 8d4fae31eb60d0d9adf0a6174316d63bb8dcc69e (refs/remotes/git-svn)
r2 = 41c3a2b62e5de78e629c6f3c6100967dcdc94166 (refs/remotes/git-svn)
r3 = 42ab1c040c998a26e1daa0b5bd8fba3a5db84c9b (refs/remotes/git-svn)
r4 = e7ddac41bdeefb9400ac49bcf5260661a588051c (refs/remotes/git-svn)
r5 = a812dc609452deda0d07673d163e49cd7c2439ca (refs/remotes/git-svn)
r6 = 1bdb5b614910280bf5a0adc90a6aa08473f2eb06 (refs/remotes/git-svn)
r7 = 50db7b54c4016fd3d5f0f89f545d0feb99b438fd (refs/remotes/git-svn)
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
