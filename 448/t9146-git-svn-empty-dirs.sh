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
r1 = 25e308d97d5c9cfcbee32f695e9822fb68c8a452 (refs/remotes/git-svn)
r2 = 02c1f3a35073e685b615310d6a2609c24e6e7d64 (refs/remotes/git-svn)
r3 = bba248221738a9381051786745c7c8f1c51fc150 (refs/remotes/git-svn)
r4 = 6ae8658cbead44dce6ba30b83e78704b76ab4f38 (refs/remotes/git-svn)
r5 = f32c070964397ca4e411cf84e75d26d7456c5196 (refs/remotes/git-svn)
r6 = 20830e474cd4b579b5ed405264c4513af25d2177 (refs/remotes/git-svn)
r7 = 8846f3da8d1b8d9fd71a25abffae25a7f86361a4 (refs/remotes/git-svn)
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
r8 = 6fbe364cd110f6819f5fbe71b36b23618300724d (refs/remotes/git-svn)
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
r9 = 3e50fd8ab95f89c62893245d47253dc1d63afcef (refs/remotes/trunk)
r10 = b9fcc309889a1059bd9b633c47dc0f524ba8849e (refs/remotes/trunk)
r11 = 0aef52e6a5eb972c88a9c8dbe2cfc3333dd5491f (refs/remotes/trunk)
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
r1 = 25e308d97d5c9cfcbee32f695e9822fb68c8a452 (refs/remotes/git-svn)
r2 = 02c1f3a35073e685b615310d6a2609c24e6e7d64 (refs/remotes/git-svn)
r3 = bba248221738a9381051786745c7c8f1c51fc150 (refs/remotes/git-svn)
r4 = 6ae8658cbead44dce6ba30b83e78704b76ab4f38 (refs/remotes/git-svn)
r5 = f32c070964397ca4e411cf84e75d26d7456c5196 (refs/remotes/git-svn)
r6 = 20830e474cd4b579b5ed405264c4513af25d2177 (refs/remotes/git-svn)
r7 = 8846f3da8d1b8d9fd71a25abffae25a7f86361a4 (refs/remotes/git-svn)
r8 = 6fbe364cd110f6819f5fbe71b36b23618300724d (refs/remotes/git-svn)
r9 = 842a9dc1ad85a2db68f170c83fad81c15e9fddec (refs/remotes/git-svn)
r10 = d82e9f6e5efc8272498b0d93107b113970ea37b1 (refs/remotes/git-svn)
r11 = c39e92e80f33b2566cde6b7e4fa20e52fd12f217 (refs/remotes/git-svn)
	D	d
r12 = f97a596f9d88f56a4fbd9888073921b0d07057ea (refs/remotes/git-svn)
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
HEAD is now at 25e308d mkdir a
r13 = 4908a38057ba6b07bb79c10f5a15298347af08da (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
