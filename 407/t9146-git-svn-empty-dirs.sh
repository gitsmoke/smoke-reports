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
r1 = af500c33c6d5923391b9b361876cecca9f73f871 (refs/remotes/git-svn)
r2 = b31650e4b92419b7b3fb33f5f462ee2605cf3366 (refs/remotes/git-svn)
r3 = 74fc3dcddeb04c14b639c70cc66564b029d37e40 (refs/remotes/git-svn)
r4 = fae90696cc9009bc8f45dc2a772f4fa89aa7f830 (refs/remotes/git-svn)
r5 = edac6e629d7cb78bf5d7003d16469aabe6513429 (refs/remotes/git-svn)
r6 = f6971a6ff36ade82057d06932dab2a3c7d59f055 (refs/remotes/git-svn)
r7 = 28b112e2788348b593ddc59ab9ad4555d8c3eb4b (refs/remotes/git-svn)
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
r8 = 1cf5b8e0d1c48ed2972e0b3d8da7d53800495e0f (refs/remotes/git-svn)
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
r9 = ffc482ccdd6e083598de462373c3f75145927b39 (refs/remotes/trunk)
r10 = d4d11b351a50783264446ac9ece904072acc30bd (refs/remotes/trunk)
r11 = 4787c1d0b88939cba92ecf653c0b47ed930c5f4d (refs/remotes/trunk)
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
r1 = af500c33c6d5923391b9b361876cecca9f73f871 (refs/remotes/git-svn)
r2 = b31650e4b92419b7b3fb33f5f462ee2605cf3366 (refs/remotes/git-svn)
r3 = 74fc3dcddeb04c14b639c70cc66564b029d37e40 (refs/remotes/git-svn)
r4 = fae90696cc9009bc8f45dc2a772f4fa89aa7f830 (refs/remotes/git-svn)
r5 = edac6e629d7cb78bf5d7003d16469aabe6513429 (refs/remotes/git-svn)
r6 = f6971a6ff36ade82057d06932dab2a3c7d59f055 (refs/remotes/git-svn)
r7 = 28b112e2788348b593ddc59ab9ad4555d8c3eb4b (refs/remotes/git-svn)
r8 = 1cf5b8e0d1c48ed2972e0b3d8da7d53800495e0f (refs/remotes/git-svn)
r9 = 885a545c06989988c25a4333733a3c1cfc3a14f4 (refs/remotes/git-svn)
r10 = 6048e0e1377e562d11268666c250b2de799b7eb4 (refs/remotes/git-svn)
r11 = fa2bf37b2cd074fd2fc740c90d07a095e75b62e7 (refs/remotes/git-svn)
	D	d
r12 = f7cc8e80350fa1fff48820bf85d243ac1af1a1bd (refs/remotes/git-svn)
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
HEAD is now at af500c3 mkdir a
r13 = e6fd78a008716066a781e6e002a903e180eaff1c (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
