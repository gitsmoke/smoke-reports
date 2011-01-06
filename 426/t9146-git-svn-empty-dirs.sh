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
r1 = c6b27ab0fdf11305b28623751d4e695c6b6cdfda (refs/remotes/git-svn)
r2 = eb6edb6ca37c2962248f20c9b6587a88e40783f3 (refs/remotes/git-svn)
r3 = f3258892c31a6978860de2314bb40d999bfe71ce (refs/remotes/git-svn)
r4 = 3c0fcf1a29735cb74127776732b6c0ebce84564b (refs/remotes/git-svn)
r5 = 4e4566b70d37fcddec028c2a34b8578ec2708bd2 (refs/remotes/git-svn)
r6 = 2c9c30fbb31753bdd58849abd1960b11d895b73b (refs/remotes/git-svn)
r7 = fd10a88c085c8e66d2f04ae5ee10ac1f7e9355ac (refs/remotes/git-svn)
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
r8 = cc102d2d3a6cfba08cde2084a84be3666f1013f8 (refs/remotes/git-svn)
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
r9 = e195478db5e1b40d988799c73a21e3ac3c3aa4f6 (refs/remotes/trunk)
r10 = c97a3cb01c47da22a68a92b454d54182d969fbc2 (refs/remotes/trunk)
r11 = 31ad81fa27d61c194f2426cf49e99d43e1f87ef7 (refs/remotes/trunk)
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
r1 = c6b27ab0fdf11305b28623751d4e695c6b6cdfda (refs/remotes/git-svn)
r2 = eb6edb6ca37c2962248f20c9b6587a88e40783f3 (refs/remotes/git-svn)
r3 = f3258892c31a6978860de2314bb40d999bfe71ce (refs/remotes/git-svn)
r4 = 3c0fcf1a29735cb74127776732b6c0ebce84564b (refs/remotes/git-svn)
r5 = 4e4566b70d37fcddec028c2a34b8578ec2708bd2 (refs/remotes/git-svn)
r6 = 2c9c30fbb31753bdd58849abd1960b11d895b73b (refs/remotes/git-svn)
r7 = fd10a88c085c8e66d2f04ae5ee10ac1f7e9355ac (refs/remotes/git-svn)
r8 = cc102d2d3a6cfba08cde2084a84be3666f1013f8 (refs/remotes/git-svn)
r9 = 20ee24565df563b0baaf1c1d1c2d2452434eb3f9 (refs/remotes/git-svn)
r10 = 7bb8d155659c8a172fcb5bc3d447517331eb321c (refs/remotes/git-svn)
r11 = ed2ce80f12f93c97619840fc4a3bd6cc724ff13c (refs/remotes/git-svn)
	D	d
r12 = 086b2561a0cb285cb00a620b593f0ea0e8cdafac (refs/remotes/git-svn)
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
HEAD is now at c6b27ab mkdir a
r13 = 54296ced1f4a1995659ae54a042ac19c10b960b1 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
