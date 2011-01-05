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
r1 = e1654a387681176245d292a68792ae0c1c87c1c7 (refs/remotes/git-svn)
r2 = dd4e7684c26c17b31cae43782b00962861192b29 (refs/remotes/git-svn)
r3 = f37bcf005d2b44b3179d370c64ddfd4f99676d5d (refs/remotes/git-svn)
r4 = 86d00ac0f2a6388246c1ce78bf3965c8378823ab (refs/remotes/git-svn)
r5 = 3c82793801d3d9bdc5b28361fd0e6bddd8154174 (refs/remotes/git-svn)
r6 = 344b74cc0b34a473b24d38c75d4398b02e958037 (refs/remotes/git-svn)
r7 = b945b0af05c87930420c6817a3d6d7fda94c8e66 (refs/remotes/git-svn)
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
