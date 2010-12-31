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
r1 = 2fe0eaf9cb6f437d78f4d3e4f6acf715ce81bfa1 (refs/remotes/git-svn)
r2 = a498e35db251e6bd55b113ea20abce52421b6935 (refs/remotes/git-svn)
r3 = f46ef5bb56c2fe0949b7b2f913ffd57ba2bb0785 (refs/remotes/git-svn)
r4 = e383ba34cc9286392e563d82eea75fb21668af02 (refs/remotes/git-svn)
r5 = 5c8c585dd83d82810aacff4e72ebb116468683ae (refs/remotes/git-svn)
r6 = 73b404721ebcb2fe75f40fd0895bf10bd9354e99 (refs/remotes/git-svn)
r7 = 8dc67502120672f111ae1611e1d8380db8a9eaf0 (refs/remotes/git-svn)
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
r8 = b4366937d54bc741ab1e76775c8d59b7047727b2 (refs/remotes/git-svn)
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
r9 = 48080d02ae90cf6ad2a52c5b1b74d967fb115ba4 (refs/remotes/trunk)
r10 = 62349009badbac54a654ee1df6977321df96c29a (refs/remotes/trunk)
r11 = abfc65b1da6a28af57df49337465bbb72feab318 (refs/remotes/trunk)
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
r1 = 2fe0eaf9cb6f437d78f4d3e4f6acf715ce81bfa1 (refs/remotes/git-svn)
r2 = a498e35db251e6bd55b113ea20abce52421b6935 (refs/remotes/git-svn)
r3 = f46ef5bb56c2fe0949b7b2f913ffd57ba2bb0785 (refs/remotes/git-svn)
r4 = e383ba34cc9286392e563d82eea75fb21668af02 (refs/remotes/git-svn)
r5 = 5c8c585dd83d82810aacff4e72ebb116468683ae (refs/remotes/git-svn)
r6 = 73b404721ebcb2fe75f40fd0895bf10bd9354e99 (refs/remotes/git-svn)
r7 = 8dc67502120672f111ae1611e1d8380db8a9eaf0 (refs/remotes/git-svn)
r8 = b4366937d54bc741ab1e76775c8d59b7047727b2 (refs/remotes/git-svn)
r9 = 571bb33bbb79de887dbe48595ba0f70374121d0c (refs/remotes/git-svn)
r10 = 5fefebf4bbc75d8f7160c4fddfcf00d4090a9544 (refs/remotes/git-svn)
r11 = abb737f3a18bec6c0e008e8f6713be9e24045c1d (refs/remotes/git-svn)
	D	d
r12 = a197fc865a2c734ec980eb95026b8686976194b2 (refs/remotes/git-svn)
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
HEAD is now at 2fe0eaf mkdir a
r13 = 7827c69fc265d74350f74b4f2a98e167ed69dd25 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
