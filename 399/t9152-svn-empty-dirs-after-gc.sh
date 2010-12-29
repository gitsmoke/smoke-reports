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
r1 = 60894225c325d10042007f8e319732b1e99fbb9b (refs/remotes/git-svn)
r2 = 0860bc80fd63759cf6b5e28e78ca4c3184c7e286 (refs/remotes/git-svn)
r3 = b3ad2c3539b3a92c77e5197d3c4bc47493aefb17 (refs/remotes/git-svn)
r4 = f65b065e4d6faa162929143c4f63c67863643843 (refs/remotes/git-svn)
r5 = 2d96f05a1df0c3b089f8267e7e71cd4750f0f9f6 (refs/remotes/git-svn)
r6 = a27c49ce26a79961a3fb386295bc6e6c7bc83f9f (refs/remotes/git-svn)
r7 = 5f3b59a90b6836ff3cbfc32cb6b7a742c27147e8 (refs/remotes/git-svn)
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
