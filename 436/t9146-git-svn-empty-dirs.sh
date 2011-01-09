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
r1 = 66afe9e672e943032e52d722f19addde9bb8264c (refs/remotes/git-svn)
r2 = 3450dce794f09705ae6cdac4eb8ed12161b02e9a (refs/remotes/git-svn)
r3 = bd4892ef5fca00d62d906e28b64de0a80defdbaf (refs/remotes/git-svn)
r4 = 80a7e6633e563cfca6fa9b3627029076e2831bc6 (refs/remotes/git-svn)
r5 = f582062cb2e947f490133e9afc0d16d329ecdd16 (refs/remotes/git-svn)
r6 = 1804e3c53cfdb6cb659d76bd28932f9826e58018 (refs/remotes/git-svn)
r7 = 6f139b665100b97be1cef7817cc675db1a9969f9 (refs/remotes/git-svn)
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
r8 = 4cb0635ba27a74c04080415116acf67932df2225 (refs/remotes/git-svn)
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
r9 = 058f80c09c13386df956db505d2fe377f13d0c1f (refs/remotes/trunk)
r10 = 8b19adbee0d7c25927193c07e56c421e5376ec6e (refs/remotes/trunk)
r11 = 079dd017f28d09f2fd4fbf4b69fc4ba5fcd89c90 (refs/remotes/trunk)
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
r1 = 66afe9e672e943032e52d722f19addde9bb8264c (refs/remotes/git-svn)
r2 = 3450dce794f09705ae6cdac4eb8ed12161b02e9a (refs/remotes/git-svn)
r3 = bd4892ef5fca00d62d906e28b64de0a80defdbaf (refs/remotes/git-svn)
r4 = 80a7e6633e563cfca6fa9b3627029076e2831bc6 (refs/remotes/git-svn)
r5 = f582062cb2e947f490133e9afc0d16d329ecdd16 (refs/remotes/git-svn)
r6 = 1804e3c53cfdb6cb659d76bd28932f9826e58018 (refs/remotes/git-svn)
r7 = 6f139b665100b97be1cef7817cc675db1a9969f9 (refs/remotes/git-svn)
r8 = 4cb0635ba27a74c04080415116acf67932df2225 (refs/remotes/git-svn)
r9 = 0a774d55446d73736bb22f663f181954dc25434d (refs/remotes/git-svn)
r10 = 932ce9b17f321ae63b73f1f917db5219b9728d64 (refs/remotes/git-svn)
r11 = 8a4f5e76ddf4da12c195ae5a977b2eae8154e4ec (refs/remotes/git-svn)
	D	d
r12 = 9061581e7dec215ffa09575ef0e75119c96e8c0a (refs/remotes/git-svn)
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
HEAD is now at 66afe9e mkdir a
r13 = 97968083623347da914319958637ffb47d7cf0ab (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz
ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
