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
r1 = 3f5c22d14482007c2e0ced7b9161fcda85029309 (refs/remotes/git-svn)
r2 = aacccb6e827b955b9ca12fa054f75e205a2cc682 (refs/remotes/git-svn)
r3 = 710e997ee1c98afe133d9f12103d805ba4403072 (refs/remotes/git-svn)
r4 = 7e826a3b1c40569114b5262bede242504d508461 (refs/remotes/git-svn)
r5 = aaa91d61e8afe25f9193bc3b26df5740b9782b4e (refs/remotes/git-svn)
r6 = 5d6395b67adc52c8efda6500add91d293939fe4a (refs/remotes/git-svn)
r7 = 47eb61c1e07a94f728bf34a483702de91d47e557 (refs/remotes/git-svn)
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
