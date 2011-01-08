Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9146-git-svn-empty-dirs/.git/
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
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9146-git-svn-empty-dirs/cloned/.git/
r1 = ea8c8d11419ce6a172c9f6ad84030fc058b147fd (refs/remotes/git-svn)
r2 = 6e80eea3291c1f9af12e8fe81582e66b6479f109 (refs/remotes/git-svn)
r3 = d70a6404eb59c08b46e57be838a38bacd587a667 (refs/remotes/git-svn)
r4 = bfdc772019df6ad90f91de7403cb0c6d89adf298 (refs/remotes/git-svn)
r5 = 5ec13e830070024bf10f7ee291738a75e7a28cfb (refs/remotes/git-svn)
r6 = 64b356ba00ec4e0d4c77b3002af20a3a319e098f (refs/remotes/git-svn)
r7 = 2a8a0163980e0787c915bfdc09ccce8a7c10b57c (refs/remotes/git-svn)
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
		for i in a b c d d/e d/e/f "weird file name"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done
	)


ok 3 - empty directories exist

expecting success: 
	svn_cmd mkdir -m "bang bang"  "$svnrepo"/"! !"


Committed revision 8.

ok 4 - more emptiness

expecting success: 
	( cd cloned && git svn rebase ) &&
	test -d cloned/"! !"
r8 = 325ffe8d7ac9a97cdb02daf1bba0c56bb7f70da4 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: ! !

ok 5 - git svn rebase creates empty directory

expecting success: 
	(
		cd cloned &&
		rm -r * &&
		git svn mkdirs &&
		for i in a b c d d/e d/e/f "weird file name" "! !"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done
	)
creating empty directory: ! !
creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: d
creating empty directory: d/e
creating empty directory: d/e/f
creating empty directory: weird file name

ok 6 - git svn mkdirs recreates empty directories

expecting success: 
	(
		cd cloned &&
		rm -r * &&
		git svn mkdirs -r7 &&
		for i in a b c d d/e d/e/f "weird file name"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done

		if test -d "! !"
		then
			echo >&2 "$i should not exist"
			exit 1
		fi

		git svn mkdirs -r8 &&
		if ! test -d "! !"
		then
			echo >&2 "$i not exist"
			exit 1
		fi
	)
creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: d
creating empty directory: d/e
creating empty directory: d/e/f
creating empty directory: weird file name
creating empty directory: ! !

ok 7 - git svn mkdirs -r works

expecting success: 
	for i in trunk trunk/a trunk/"weird file name"
	do
		svn_cmd mkdir -m "mkdir $i" "$svnrepo"/"$i"
	done


Committed revision 9.

Committed revision 10.

Committed revision 11.

ok 8 - initialize trunk
expecting success: git svn clone -s "$svnrepo" trunk
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9146-git-svn-empty-dirs/trunk/.git/
r9 = 1be38f4e64376ddc91c42bf98541832f1754a946 (refs/remotes/trunk)
r10 = 53276bea1e825b29f4a7cc7f20dacb832a63bccd (refs/remotes/trunk)
r11 = 65a54e0e7b2f221591aca6b52a6dee50740451d8 (refs/remotes/trunk)
creating empty directory: a
creating empty directory: weird file name
ok 9 - clone trunk
expecting success: 
	(
		cd trunk &&
		for i in a "weird file name"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done
	)

ok 10 - empty directories in trunk exist

expecting success: 
	svn_cmd rm -m "remove d" "$svnrepo"/d

Committed revision 12.

ok 11 - remove a top-level directory from svn
expecting success: 
	git svn clone "$svnrepo" removed &&
	test ! -e removed/d
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9146-git-svn-empty-dirs/removed/.git/
r1 = ea8c8d11419ce6a172c9f6ad84030fc058b147fd (refs/remotes/git-svn)
r2 = 6e80eea3291c1f9af12e8fe81582e66b6479f109 (refs/remotes/git-svn)
r3 = d70a6404eb59c08b46e57be838a38bacd587a667 (refs/remotes/git-svn)
r4 = bfdc772019df6ad90f91de7403cb0c6d89adf298 (refs/remotes/git-svn)
r5 = 5ec13e830070024bf10f7ee291738a75e7a28cfb (refs/remotes/git-svn)
r6 = 64b356ba00ec4e0d4c77b3002af20a3a319e098f (refs/remotes/git-svn)
r7 = 2a8a0163980e0787c915bfdc09ccce8a7c10b57c (refs/remotes/git-svn)
r8 = 325ffe8d7ac9a97cdb02daf1bba0c56bb7f70da4 (refs/remotes/git-svn)
r9 = 36a450291332557055fe46edd5033deac779dc78 (refs/remotes/git-svn)
r10 = 56928d93f98e3e2c007eb20bf5c03f0f17807ef8 (refs/remotes/git-svn)
r11 = 731efdf91dc73196bd1a790ef521600ac8ab1df7 (refs/remotes/git-svn)
	D	d
r12 = 6c580df674b5d64d41fd27ef8ad3107452dca241 (refs/remotes/git-svn)
creating empty directory: ! !
creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: trunk
creating empty directory: trunk/a
creating empty directory: trunk/weird file name
creating empty directory: weird file name
ok 12 - removed top-level directory does not exist
expecting success: 
	(
		cd removed &&
		git svn gc &&
		: Compress::Zlib may not be available &&
		if test -f "$unhandled".gz
		then
			svn_cmd mkdir -m gz "$svnrepo"/gz &&
			git reset --hard $(git rev-list HEAD | tail -1) &&
			git svn rebase &&
			test -f "$unhandled".gz &&
			test -f "$unhandled" &&
			for i in a b c "weird file name" gz "! !"
			do
				if ! test -d "$i"
				then
					echo >&2 "$i does not exist"
					exit 1
				fi
			done
		fi
	)

Committed revision 13.
HEAD is now at ea8c8d1 mkdir a
r13 = e31fbfb0bb7f130ace6bb32d2315e14f3c5f8d89 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
