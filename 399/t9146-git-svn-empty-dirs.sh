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
r1 = 5194444c83c95e777ea04e9c54c185d47e69f3e0 (refs/remotes/git-svn)
r2 = db4e00a414b7e07804db0e4434e62193ab95bf5e (refs/remotes/git-svn)
r3 = b52f44a54018e1d00999dc1106a5983eb727b978 (refs/remotes/git-svn)
r4 = 6e4219524bc9970edac13350df2c2a1296718f9d (refs/remotes/git-svn)
r5 = b8f059fc30d0727af4958f73c78330451be83b86 (refs/remotes/git-svn)
r6 = ca24d233d46b6e78e55e6a09b3c8d0ab371f8666 (refs/remotes/git-svn)
r7 = f73bfefb7d45c2a3f9272658c4ee50d979e7b1a6 (refs/remotes/git-svn)
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
r8 = 8d9a8dfcef31aecc87b1ae0ec5221df53cc638b8 (refs/remotes/git-svn)
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
r9 = 481fb50b84d1a18d0b054f142eae333c5c997aed (refs/remotes/trunk)
r10 = dbfb413a02f9cd8fb82d1804b12748189d63a887 (refs/remotes/trunk)
r11 = 917f90140ac66884374a4bf414a5762895ccffce (refs/remotes/trunk)
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
r1 = 5194444c83c95e777ea04e9c54c185d47e69f3e0 (refs/remotes/git-svn)
r2 = db4e00a414b7e07804db0e4434e62193ab95bf5e (refs/remotes/git-svn)
r3 = b52f44a54018e1d00999dc1106a5983eb727b978 (refs/remotes/git-svn)
r4 = 6e4219524bc9970edac13350df2c2a1296718f9d (refs/remotes/git-svn)
r5 = b8f059fc30d0727af4958f73c78330451be83b86 (refs/remotes/git-svn)
r6 = ca24d233d46b6e78e55e6a09b3c8d0ab371f8666 (refs/remotes/git-svn)
r7 = f73bfefb7d45c2a3f9272658c4ee50d979e7b1a6 (refs/remotes/git-svn)
r8 = 8d9a8dfcef31aecc87b1ae0ec5221df53cc638b8 (refs/remotes/git-svn)
r9 = ac5660efe9341de884f9747dbde79eb4d83a86f5 (refs/remotes/git-svn)
r10 = bc15e90ee3aff23f799b509705a47d0f2714bc67 (refs/remotes/git-svn)
r11 = 3f48ec7897d37fd2a0db40ff70e73dc88620ed3a (refs/remotes/git-svn)
	D	d
r12 = 5982f700eed62ffc8c16dbd38cc6f5e613080005 (refs/remotes/git-svn)
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
HEAD is now at 5194444 mkdir a
r13 = 022ced191b8d24644f0566f0f8a9765abe20b02d (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
