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
r1 = 61648df21a06724751179c4ac9fdd2c37fce2d0a (refs/remotes/git-svn)
r2 = ca82be2c9d6c6221d0811707911946fb3ba014e8 (refs/remotes/git-svn)
r3 = d06dbea0769fc0da64388e0a016c597ee1a973ab (refs/remotes/git-svn)
r4 = 0b35f62a20f9a97b5cf39171deb21d767529914b (refs/remotes/git-svn)
r5 = 293b6ed4ed4d7e2d8f679dff1b789628ad61b0c6 (refs/remotes/git-svn)
r6 = aa780189e1f58df99d61cb8d7c320dcec28c6457 (refs/remotes/git-svn)
r7 = 5271b0ca88c73bfafdb52e2bf6912055e991899b (refs/remotes/git-svn)
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
r8 = 71b71d29b67db0e5443cef56234b9d9145fa3359 (refs/remotes/git-svn)
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
r9 = 2f098be522a66d7ad8278f482893b61a00ba4b55 (refs/remotes/trunk)
r10 = 373ac8150387aeb3d5f377bdb3b45c11cfad50dd (refs/remotes/trunk)
r11 = 9f02e84f0fb543e57fbf19c1d1f1c517011881ea (refs/remotes/trunk)
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
r1 = 61648df21a06724751179c4ac9fdd2c37fce2d0a (refs/remotes/git-svn)
r2 = ca82be2c9d6c6221d0811707911946fb3ba014e8 (refs/remotes/git-svn)
r3 = d06dbea0769fc0da64388e0a016c597ee1a973ab (refs/remotes/git-svn)
r4 = 0b35f62a20f9a97b5cf39171deb21d767529914b (refs/remotes/git-svn)
r5 = 293b6ed4ed4d7e2d8f679dff1b789628ad61b0c6 (refs/remotes/git-svn)
r6 = aa780189e1f58df99d61cb8d7c320dcec28c6457 (refs/remotes/git-svn)
r7 = 5271b0ca88c73bfafdb52e2bf6912055e991899b (refs/remotes/git-svn)
r8 = 71b71d29b67db0e5443cef56234b9d9145fa3359 (refs/remotes/git-svn)
r9 = ec6b2b7837fbdbf369a1c0e8f58acde349738698 (refs/remotes/git-svn)
r10 = ebd53303b77941476faadf6999a5cdf5bd735487 (refs/remotes/git-svn)
r11 = 0d2448207d35b51061d188e411ed06d93ad59904 (refs/remotes/git-svn)
	D	d
r12 = bc137ca3272490548719db2337d4de309809a1d5 (refs/remotes/git-svn)
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
HEAD is now at 61648df mkdir a
r13 = 3f4515d987c2e8de882bd196fd7036912c9ca2b7 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
