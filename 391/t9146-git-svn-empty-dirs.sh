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
r1 = 78482dec8540295eac286106af2d64e24fc67243 (refs/remotes/git-svn)
r2 = dcc6edb6a4cae44b6b76a587aade7a6e460e37fc (refs/remotes/git-svn)
r3 = 34393f9abe5557074b9a25f350987b5e8e85af9e (refs/remotes/git-svn)
r4 = 00836ec9965116e87a0342e3ec883cffdeb8d831 (refs/remotes/git-svn)
r5 = ff63e330d55a3d7a246affad0524df7fea8682a6 (refs/remotes/git-svn)
r6 = 825f17e6aacf0b594817608dcd68b576adb82d89 (refs/remotes/git-svn)
r7 = cb76817952658aa6a0e0f805adbdca38a6e719d7 (refs/remotes/git-svn)
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
r8 = 9c6e999020f8b432616d469cee7373cf7e807a32 (refs/remotes/git-svn)
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
r9 = 01105420a41d1282c8d8dc4244d6bd5fea3f693c (refs/remotes/trunk)
r10 = 1e079f676a1c2df625b6654e9a148fd97d044e97 (refs/remotes/trunk)
r11 = db791fbf080cd9985343dd18b22c4141f757ccef (refs/remotes/trunk)
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
r1 = 78482dec8540295eac286106af2d64e24fc67243 (refs/remotes/git-svn)
r2 = dcc6edb6a4cae44b6b76a587aade7a6e460e37fc (refs/remotes/git-svn)
r3 = 34393f9abe5557074b9a25f350987b5e8e85af9e (refs/remotes/git-svn)
r4 = 00836ec9965116e87a0342e3ec883cffdeb8d831 (refs/remotes/git-svn)
r5 = ff63e330d55a3d7a246affad0524df7fea8682a6 (refs/remotes/git-svn)
r6 = 825f17e6aacf0b594817608dcd68b576adb82d89 (refs/remotes/git-svn)
r7 = cb76817952658aa6a0e0f805adbdca38a6e719d7 (refs/remotes/git-svn)
r8 = 9c6e999020f8b432616d469cee7373cf7e807a32 (refs/remotes/git-svn)
r9 = 32945118f42708404640b292d16af5a8af03bf29 (refs/remotes/git-svn)
r10 = aa988c665a2eb837c6fb9209883bb1ce366e37fd (refs/remotes/git-svn)
r11 = be0dd356af40534019e673233010fd49da2f8d37 (refs/remotes/git-svn)
	D	d
r12 = 0eebe12893b52597a232e016a16462a4628fd407 (refs/remotes/git-svn)
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
HEAD is now at 78482de mkdir a
r13 = f6bae9da153464359b0fa52fb65dc34c8bda3d1e (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
