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
r1 = 29b3a86acdb6638b3b26af9e0dbdff4a3031dc54 (refs/remotes/git-svn)
r2 = a30eedf3995bc44cd2f8ae17b42feab27e903ce3 (refs/remotes/git-svn)
r3 = a0d9b51ea775fad488b35b171d80b5a2bdc2fcae (refs/remotes/git-svn)
r4 = c388ccf6beb493d5fe48ede76ac970154139068d (refs/remotes/git-svn)
r5 = 2df43b2955ccbe339c2959f2cadef067affe4faf (refs/remotes/git-svn)
r6 = 39f5be5e5b8c461448fc320445fd752238424079 (refs/remotes/git-svn)
r7 = 336b04819506eecaa871f9b8e0767b56d344d781 (refs/remotes/git-svn)
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
r8 = 67d74d6d24e7dd73d7a1cf2cfb7ad4e167b5cd2b (refs/remotes/git-svn)
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
r9 = d68e9583772540d90c6cc59f9dc8921872b28331 (refs/remotes/trunk)
r10 = 54e470d07e5d56bdcc93322c5eeb534e338b171c (refs/remotes/trunk)
r11 = 62427201471cde9a1d0419108bf35ccaa9289264 (refs/remotes/trunk)
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
r1 = 29b3a86acdb6638b3b26af9e0dbdff4a3031dc54 (refs/remotes/git-svn)
r2 = a30eedf3995bc44cd2f8ae17b42feab27e903ce3 (refs/remotes/git-svn)
r3 = a0d9b51ea775fad488b35b171d80b5a2bdc2fcae (refs/remotes/git-svn)
r4 = c388ccf6beb493d5fe48ede76ac970154139068d (refs/remotes/git-svn)
r5 = 2df43b2955ccbe339c2959f2cadef067affe4faf (refs/remotes/git-svn)
r6 = 39f5be5e5b8c461448fc320445fd752238424079 (refs/remotes/git-svn)
r7 = 336b04819506eecaa871f9b8e0767b56d344d781 (refs/remotes/git-svn)
r8 = 67d74d6d24e7dd73d7a1cf2cfb7ad4e167b5cd2b (refs/remotes/git-svn)
r9 = 224c6ba162a0e83b7db3c263495f4e374575c923 (refs/remotes/git-svn)
r10 = d28154460e96495ce76ca39f28d7a7af3eefaffc (refs/remotes/git-svn)
r11 = 41f205b942375d2c85b6af24ee7f33a3f92ceb02 (refs/remotes/git-svn)
	D	d
r12 = d91fd9d25e921321faa1cc372aae3c8e84592afc (refs/remotes/git-svn)
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
HEAD is now at 29b3a86 mkdir a
r13 = 5824f6fd67436fc5b4f147127ca46e83fc4e19d1 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
