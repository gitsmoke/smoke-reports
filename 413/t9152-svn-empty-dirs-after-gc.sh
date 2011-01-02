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
r1 = 050ab713fa577ea7278f282fb1a6416e676d6ab4 (refs/remotes/git-svn)
r2 = aaf19b6d62b9728d269e9ea544af53d3e50ebcd1 (refs/remotes/git-svn)
r3 = 823a7986a4716207514b3ac83b5d850a4d9e7f83 (refs/remotes/git-svn)
r4 = e771a36cf433c0f9c9848867fb414fb2bd43c5b2 (refs/remotes/git-svn)
r5 = cb104b6b5ac6990bfb8fe34c6ff8ec7734b4c6ef (refs/remotes/git-svn)
r6 = 15705829c84b21b9dca28dd22896445bf7470b91 (refs/remotes/git-svn)
r7 = 3b2996a5894abc27f8a6e32df342d92a895bc626 (refs/remotes/git-svn)
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
