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
r1 = 19afb1336c60bcbd2e2c518d456a9457fb1fa7d9 (refs/remotes/git-svn)
r2 = 2e995ed9aa1f22f4c9911a7f1430c70454f19660 (refs/remotes/git-svn)
r3 = 62ee6da46275419fec485308abb782794f171c43 (refs/remotes/git-svn)
r4 = 45e9481c79bcb5ebca892fda826d40a77934d246 (refs/remotes/git-svn)
r5 = 2261a0d34e12081cf44586e0e17f95ad780b9fac (refs/remotes/git-svn)
r6 = dfb15ed5bb6edfdf2024a6352c63ff7453517458 (refs/remotes/git-svn)
r7 = 92211a3b1801da80975a67587ea7e06817c9d652 (refs/remotes/git-svn)
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
r8 = 5701628608abdc5413c2f00bbb041ae2080649e9 (refs/remotes/git-svn)
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
r9 = 66a484027d358ddea9d38d169b8543b54f204689 (refs/remotes/trunk)
r10 = 28dc6425d94b00a8b38b32c34f7ece4935d6d09b (refs/remotes/trunk)
r11 = 67e0bb4568728f44a170ead37d3a675fad97c9be (refs/remotes/trunk)
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
r1 = 19afb1336c60bcbd2e2c518d456a9457fb1fa7d9 (refs/remotes/git-svn)
r2 = 2e995ed9aa1f22f4c9911a7f1430c70454f19660 (refs/remotes/git-svn)
r3 = 62ee6da46275419fec485308abb782794f171c43 (refs/remotes/git-svn)
r4 = 45e9481c79bcb5ebca892fda826d40a77934d246 (refs/remotes/git-svn)
r5 = 2261a0d34e12081cf44586e0e17f95ad780b9fac (refs/remotes/git-svn)
r6 = dfb15ed5bb6edfdf2024a6352c63ff7453517458 (refs/remotes/git-svn)
r7 = 92211a3b1801da80975a67587ea7e06817c9d652 (refs/remotes/git-svn)
r8 = 5701628608abdc5413c2f00bbb041ae2080649e9 (refs/remotes/git-svn)
r9 = 087ea2ae159354e98957aac9ca5cb25f0f00e5c6 (refs/remotes/git-svn)
r10 = c0451bd71f310cc12cbe83ae5e1e1aa3262623d0 (refs/remotes/git-svn)
r11 = 65309adb0b1c0b929268ae586baac1e588f0c6d1 (refs/remotes/git-svn)
	D	d
r12 = 4d75992a53549630b4bf6e4e6c77254395bd2849 (refs/remotes/git-svn)
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
HEAD is now at 19afb13 mkdir a
r13 = d3bc3c3765aa1569d2cbda7d729d459cd0dec317 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz
ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
