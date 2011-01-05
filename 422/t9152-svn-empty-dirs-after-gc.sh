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
r1 = 1e8d9aa8a32fb4e44b444d83bc70b1c33a7614e5 (refs/remotes/git-svn)
r2 = 69844ea1348832a049d9de0d00600989b265e96a (refs/remotes/git-svn)
r3 = 4e501fad7421417d4f3ba68085a57c9f33af2530 (refs/remotes/git-svn)
r4 = 11fcb63051f374c8e8400af1ca565a4d5c5d2eed (refs/remotes/git-svn)
r5 = b1f898d44ff5b624dee57d59f8add9d83f4c9fcb (refs/remotes/git-svn)
r6 = 8491bdb6dec338ac150e00b3a43e1685d08c5714 (refs/remotes/git-svn)
r7 = 9b502b87a7de379096d5117ccbe5730a577f1b20 (refs/remotes/git-svn)
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
