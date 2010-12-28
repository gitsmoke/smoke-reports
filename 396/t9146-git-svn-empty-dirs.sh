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
r1 = 59af4f8c59621105c5ed9a74d12cd87c94c2343d (refs/remotes/git-svn)
r2 = 8dc3dd1aadae383ceeadc134072b9adf8bb7414b (refs/remotes/git-svn)
r3 = 4c807988528398d692ae4874bfcb059b19aff71d (refs/remotes/git-svn)
r4 = d790cf0c5e39f6683ae165a45528e53bb53f7cc4 (refs/remotes/git-svn)
r5 = a33e734b40391bd03744427bdc678ce736ebbf47 (refs/remotes/git-svn)
r6 = d428d95053edba06d903206f61fb167dc6288538 (refs/remotes/git-svn)
r7 = 1e472a89109edda87b2b8e1bc89634a948029b5e (refs/remotes/git-svn)
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

r8 = c7c9e1eb719f9b56774f25eda4bce077f7526b3b (refs/remotes/git-svn)
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
r9 = 1075587d5400a314087f7748aa51ea9c405a9666 (refs/remotes/trunk)
r10 = 4161f2b0a6bc607b6ddb1fa26a47de5fbc2d8a1a (refs/remotes/trunk)
r11 = 3b6d95e38eff4210de8e81283efb09d5ada7d6fc (refs/remotes/trunk)
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
r1 = 59af4f8c59621105c5ed9a74d12cd87c94c2343d (refs/remotes/git-svn)
r2 = 8dc3dd1aadae383ceeadc134072b9adf8bb7414b (refs/remotes/git-svn)
r3 = 4c807988528398d692ae4874bfcb059b19aff71d (refs/remotes/git-svn)
r4 = d790cf0c5e39f6683ae165a45528e53bb53f7cc4 (refs/remotes/git-svn)
r5 = a33e734b40391bd03744427bdc678ce736ebbf47 (refs/remotes/git-svn)
r6 = d428d95053edba06d903206f61fb167dc6288538 (refs/remotes/git-svn)
r7 = 1e472a89109edda87b2b8e1bc89634a948029b5e (refs/remotes/git-svn)
r8 = c7c9e1eb719f9b56774f25eda4bce077f7526b3b (refs/remotes/git-svn)
r9 = a0148cb14b792d3624af6b71d44bdf5889ea6b89 (refs/remotes/git-svn)
r10 = 168f77515c4a70e80777fc4ee9ab0e6dadc4b31c (refs/remotes/git-svn)
r11 = 08bf3c206bab3d355cb4f9e7aba1801f077d0d0a (refs/remotes/git-svn)
	D	d
r12 = a0ac4fb8ea363c005d710388471e63f685d4fd9e (refs/remotes/git-svn)
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
HEAD is now at 59af4f8 mkdir a
r13 = 601793f77813bc0cd2702de4b9917128448d9542 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
