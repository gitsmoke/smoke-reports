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
r1 = 8fce276a523fa19fdfc4a6cc0d30d11f4dd0f2f4 (refs/remotes/git-svn)
r2 = c03e5eaa2786c84cc0a6a1aee77d87d58f9e8583 (refs/remotes/git-svn)
r3 = a51112c08fcee5eab32510dbf1c7bc102f88d8e3 (refs/remotes/git-svn)
r4 = ee955bc1527dff1f63bf6fd7937816da2b0c532a (refs/remotes/git-svn)
r5 = f406a0bda9206ff01e599b453f4caa00d96af090 (refs/remotes/git-svn)
r6 = ef04c10d55ef87a9b727517254bdb3f57b7d28ed (refs/remotes/git-svn)
r7 = 59b76b5e735429b0045a7598cb0ef845abad8fe9 (refs/remotes/git-svn)
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
r8 = 2ede207dba1c44691f220815016e3e273ee7e6fe (refs/remotes/git-svn)
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
r9 = 3f21590f11ab4ed66741e9b23d0de9af3e51c079 (refs/remotes/trunk)
r10 = a4c5923d6bd9179f8d0ab7245ed9b51694731ad3 (refs/remotes/trunk)
r11 = aea16b07b999d753d03578597e2270d8a877165f (refs/remotes/trunk)
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
r1 = 8fce276a523fa19fdfc4a6cc0d30d11f4dd0f2f4 (refs/remotes/git-svn)
r2 = c03e5eaa2786c84cc0a6a1aee77d87d58f9e8583 (refs/remotes/git-svn)
r3 = a51112c08fcee5eab32510dbf1c7bc102f88d8e3 (refs/remotes/git-svn)
r4 = ee955bc1527dff1f63bf6fd7937816da2b0c532a (refs/remotes/git-svn)
r5 = f406a0bda9206ff01e599b453f4caa00d96af090 (refs/remotes/git-svn)
r6 = ef04c10d55ef87a9b727517254bdb3f57b7d28ed (refs/remotes/git-svn)
r7 = 59b76b5e735429b0045a7598cb0ef845abad8fe9 (refs/remotes/git-svn)
r8 = 2ede207dba1c44691f220815016e3e273ee7e6fe (refs/remotes/git-svn)
r9 = ab6c596d1b0b7e234550ea08c1800fa6be7adf96 (refs/remotes/git-svn)
r10 = 53e1ff1d42216e2786df6a43eef57c0bc6df16b0 (refs/remotes/git-svn)
r11 = 048e265fe566e068674635ae830f3299d83ff551 (refs/remotes/git-svn)
	D	d
r12 = d3be58af64bfc7a179b515e898a5b8cdf1da49e3 (refs/remotes/git-svn)
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
HEAD is now at 8fce276 mkdir a
r13 = 37eecbd0eb209e1c81ea6c6ef25e1f4762847507 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
