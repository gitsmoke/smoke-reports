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
r1 = f78aca6c28b06c6e8f6052b0c64e09e948ba92fb (refs/remotes/git-svn)
r2 = 227c5258155252de7f6d1d2df19210b6881ab17f (refs/remotes/git-svn)
r3 = eac13d3465504f1bf2d748c7a201b0759ba36c48 (refs/remotes/git-svn)
r4 = ad8ce079f516bb88ef8a0b39db7dfdfe1d4cfdb8 (refs/remotes/git-svn)
r5 = ac4b05bd8c2905d04c7103b52c34cfd09a26be10 (refs/remotes/git-svn)
r6 = 501d83e7f536a857ac5a15198310e2cc2bcf441a (refs/remotes/git-svn)
r7 = dc7a7f79dec31948fbfcf45eb468667a4f4dd576 (refs/remotes/git-svn)
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
r8 = 7f44c2f29d0f2f151f5c7877f3457d275ca99ae8 (refs/remotes/git-svn)
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
r9 = 40e63a9539d189e5fdd6947d3d2c812dfc3f38ec (refs/remotes/trunk)
r10 = 8f5794359d7c0b910e69ba9fed468a8294b72d07 (refs/remotes/trunk)
r11 = 8a9e2e6f9380688d65bfeacfbabe63017fabd5b6 (refs/remotes/trunk)
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
r1 = f78aca6c28b06c6e8f6052b0c64e09e948ba92fb (refs/remotes/git-svn)
r2 = 227c5258155252de7f6d1d2df19210b6881ab17f (refs/remotes/git-svn)
r3 = eac13d3465504f1bf2d748c7a201b0759ba36c48 (refs/remotes/git-svn)
r4 = ad8ce079f516bb88ef8a0b39db7dfdfe1d4cfdb8 (refs/remotes/git-svn)
r5 = ac4b05bd8c2905d04c7103b52c34cfd09a26be10 (refs/remotes/git-svn)
r6 = 501d83e7f536a857ac5a15198310e2cc2bcf441a (refs/remotes/git-svn)
r7 = dc7a7f79dec31948fbfcf45eb468667a4f4dd576 (refs/remotes/git-svn)
r8 = 7f44c2f29d0f2f151f5c7877f3457d275ca99ae8 (refs/remotes/git-svn)
r9 = d99ce433c41ade21759f4cd4d0f2c700dbc96ac8 (refs/remotes/git-svn)
r10 = 903eb30e606f511d5f4bc68c5cd1dcd2f87029d6 (refs/remotes/git-svn)
r11 = 294c2851c88ebf0d2e4d31502f9d52c5900a5f96 (refs/remotes/git-svn)
	D	d
r12 = 29332d18a1434a6161f623efecb9ea2437452e13 (refs/remotes/git-svn)
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
HEAD is now at f78aca6 mkdir a
r13 = c676dc209cb257a93e76cd0be646cd271764db4b (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
