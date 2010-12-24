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
r1 = aa6b01c0bd81ed4bed1b21b21f588e039b33841e (refs/remotes/git-svn)
r2 = 10f5a007554e85617eeac56a6e6a045935a7d20f (refs/remotes/git-svn)
r3 = 7d704381af169954f0f307d1b42cbb024130c097 (refs/remotes/git-svn)
r4 = 0b61119c46a3df78f81d2fc36ae2fbf2549c2dfb (refs/remotes/git-svn)
r5 = aa0d4171e2ce7542acf8e3ccf68421d093f20c43 (refs/remotes/git-svn)
r6 = a4a9feb2ee9999595a49be46d20d6f4c3919bb6d (refs/remotes/git-svn)
r7 = a7d342c56d662f919a3f1a50c8a738eb1a2816e2 (refs/remotes/git-svn)
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
