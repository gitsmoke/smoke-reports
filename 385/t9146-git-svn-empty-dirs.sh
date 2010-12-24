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
r1 = 19c20582426ff3251ca9ac5f88e447be9c3c2371 (refs/remotes/git-svn)
r2 = 6e9e97faf0a349770b1091e05854981c3391bcdc (refs/remotes/git-svn)
r3 = 6c2df749cb7c7cf2e5fd8936ce77a2056273a54b (refs/remotes/git-svn)
r4 = 2d71aa7be2ac69958ed1b153c79c268eb0e8875c (refs/remotes/git-svn)
r5 = 61e3e6e52732f2b961251a24bcde5313f6ffee09 (refs/remotes/git-svn)
r6 = a3620cec0a94c39acfcc6405e48e20c401b5ec8e (refs/remotes/git-svn)
r7 = a6cc936656c9ec8b79e99c2f9c57f3938dec918e (refs/remotes/git-svn)
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
r8 = 9476326fa26607a93ff7befe7ae778b42d98b482 (refs/remotes/git-svn)
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
r9 = eab2a585b28c7a44aacd9a02f655d7ea8de734cb (refs/remotes/trunk)
r10 = 345e13fe469e16be1bf030a8320ad9bc4ab4634e (refs/remotes/trunk)
r11 = 64af585713555ffae2d7400604e8c1d5760eb0f0 (refs/remotes/trunk)
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
r1 = 19c20582426ff3251ca9ac5f88e447be9c3c2371 (refs/remotes/git-svn)
r2 = 6e9e97faf0a349770b1091e05854981c3391bcdc (refs/remotes/git-svn)
r3 = 6c2df749cb7c7cf2e5fd8936ce77a2056273a54b (refs/remotes/git-svn)
r4 = 2d71aa7be2ac69958ed1b153c79c268eb0e8875c (refs/remotes/git-svn)
r5 = 61e3e6e52732f2b961251a24bcde5313f6ffee09 (refs/remotes/git-svn)
r6 = a3620cec0a94c39acfcc6405e48e20c401b5ec8e (refs/remotes/git-svn)
r7 = a6cc936656c9ec8b79e99c2f9c57f3938dec918e (refs/remotes/git-svn)
r8 = 9476326fa26607a93ff7befe7ae778b42d98b482 (refs/remotes/git-svn)
r9 = bb4cc0f4eb9f7192c5c14cd00521a22c043144a8 (refs/remotes/git-svn)
r10 = 0bf2cdc3720871f170102475da58132772fc1b3d (refs/remotes/git-svn)
r11 = 3fab97cce19aabac6ba5981a29cd5004f2986755 (refs/remotes/git-svn)
	D	d
r12 = f02e3eb377791fb85c69532b5c4d072860fd2793 (refs/remotes/git-svn)
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
HEAD is now at 19c2058 mkdir a
r13 = 43ee9678ca430524126447b79ac7bfc262dd7da8 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
