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
r1 = 816b6eb86e16d4b9e9231804f4196f614912e655 (refs/remotes/git-svn)
r2 = b4304661417e3e64bb2d314aed2875c26104c53e (refs/remotes/git-svn)
r3 = d72afae4f295734fad22977f90c43cb96af17a56 (refs/remotes/git-svn)
r4 = 34029e447e022fa81d16ac3d875ca75aaa4ee93b (refs/remotes/git-svn)
r5 = 5158cfe28d304a02b8b6ebf4fd4f481e7e54809c (refs/remotes/git-svn)
r6 = 16c2cc9144a301325db20881aa7bcf2c40075ea0 (refs/remotes/git-svn)
r7 = c0342b2a2eb83831f3ef41d58b31d2ad1735b5c9 (refs/remotes/git-svn)
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
r8 = fdc0bbf9a2fae8369f69b5d7b3593e7edfab6f35 (refs/remotes/git-svn)
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
r9 = 453e4007ae6ecf6a705def0b1aa4acf267b6fb8e (refs/remotes/trunk)
r10 = 10669bd85f81f6d7998eb50373f187910090e257 (refs/remotes/trunk)
r11 = beacaff4280f6c87dea0ca7c4e94e3f6e2f3df5b (refs/remotes/trunk)
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
r1 = 816b6eb86e16d4b9e9231804f4196f614912e655 (refs/remotes/git-svn)
r2 = b4304661417e3e64bb2d314aed2875c26104c53e (refs/remotes/git-svn)
r3 = d72afae4f295734fad22977f90c43cb96af17a56 (refs/remotes/git-svn)
r4 = 34029e447e022fa81d16ac3d875ca75aaa4ee93b (refs/remotes/git-svn)
r5 = 5158cfe28d304a02b8b6ebf4fd4f481e7e54809c (refs/remotes/git-svn)
r6 = 16c2cc9144a301325db20881aa7bcf2c40075ea0 (refs/remotes/git-svn)
r7 = c0342b2a2eb83831f3ef41d58b31d2ad1735b5c9 (refs/remotes/git-svn)
r8 = fdc0bbf9a2fae8369f69b5d7b3593e7edfab6f35 (refs/remotes/git-svn)
r9 = 6d6d91b14d1cfa7c5fc311d25ddba702061cd585 (refs/remotes/git-svn)
r10 = bbcb599155b432d61c685652635faec9fb69aab0 (refs/remotes/git-svn)
r11 = 97b141326b8be75be570a3b7c74031dbc7d433a5 (refs/remotes/git-svn)
	D	d
r12 = 9fbd347d7088fafd16d9c55d1a4e33bd2fff0f74 (refs/remotes/git-svn)
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
HEAD is now at 816b6eb mkdir a
r13 = e2d7d90232fbb30704deb9e00aefc69187ca7ce0 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz
ok 13 - git svn gc-ed files work
# passed all 13 test(s)
1..13
