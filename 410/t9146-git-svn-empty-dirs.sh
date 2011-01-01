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
r1 = e82a99dc3c4dafd5396319ec2cc63ff2f1be3fe7 (refs/remotes/git-svn)
r2 = aea13e66627120a139fb067013e34c8f3886c1da (refs/remotes/git-svn)
r3 = 3bcd7cc9ac1d687760b3ceddb05a26c8caad3d0d (refs/remotes/git-svn)
r4 = 03baf91a644ed0fe7c076ac80eb74bed936b3bc3 (refs/remotes/git-svn)
r5 = 1f65969b9eb52734132709cdc2f2909088ff1079 (refs/remotes/git-svn)
r6 = 2fc62144b40fc82336bb5de80cafba386595a649 (refs/remotes/git-svn)
r7 = 5d7654980d579a7f5acefe0ce93b0c32d14605dd (refs/remotes/git-svn)
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
r8 = 7c56ea8e7d2d00cb5d621606de9670d400c5f83b (refs/remotes/git-svn)
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
r9 = 6f1da5dbcbdd87ed9ef5892802f63fd2990f3b7c (refs/remotes/trunk)
r10 = 567096eba4b2207b9b1a7653918919b8438b3d65 (refs/remotes/trunk)
r11 = 74e8bc8fec85c90a86d3f1630223cc0434684490 (refs/remotes/trunk)
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
r1 = e82a99dc3c4dafd5396319ec2cc63ff2f1be3fe7 (refs/remotes/git-svn)
r2 = aea13e66627120a139fb067013e34c8f3886c1da (refs/remotes/git-svn)
r3 = 3bcd7cc9ac1d687760b3ceddb05a26c8caad3d0d (refs/remotes/git-svn)
r4 = 03baf91a644ed0fe7c076ac80eb74bed936b3bc3 (refs/remotes/git-svn)
r5 = 1f65969b9eb52734132709cdc2f2909088ff1079 (refs/remotes/git-svn)
r6 = 2fc62144b40fc82336bb5de80cafba386595a649 (refs/remotes/git-svn)
r7 = 5d7654980d579a7f5acefe0ce93b0c32d14605dd (refs/remotes/git-svn)
r8 = 7c56ea8e7d2d00cb5d621606de9670d400c5f83b (refs/remotes/git-svn)
r9 = 66d1bfa415500bac0c2976e838e1d9f661c4d097 (refs/remotes/git-svn)
r10 = be6a589a10d1ad034d28cec51b2de07ae1281c81 (refs/remotes/git-svn)
r11 = fb9dd03d914784feae9cb714c91b218a89b1880c (refs/remotes/git-svn)
	D	d
r12 = 754b94209608e87bcfc927dae4db0d175941c289 (refs/remotes/git-svn)
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
HEAD is now at e82a99d mkdir a
r13 = 7216e33328ec58f41510da1463c7bf50328fcd37 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
