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
r1 = ef2dcfb17977b891a6611995a42d8c3283044931 (refs/remotes/git-svn)
r2 = 4f42ef1d877503f76452597865aa8e23baebf402 (refs/remotes/git-svn)
r3 = 0c2815f7e795159fa5bdf957345bc37571c25da3 (refs/remotes/git-svn)
r4 = 8f1bdc3e51e18bea60b496ff03b354995ec58065 (refs/remotes/git-svn)
r5 = ecf3dad5772c9b47cec9244305631a19abd01cb3 (refs/remotes/git-svn)
r6 = 16084ce19091aa55ecc0d7e1756ae430d0aee882 (refs/remotes/git-svn)
r7 = 0e69c11a043ce3d91640d602300a21a105ab4f25 (refs/remotes/git-svn)
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
r8 = 488dc465aa1c7678812498533c8eea301ed76bbd (refs/remotes/git-svn)
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
r9 = fcf67e3bf7fef5f83731163ce741489246853ed7 (refs/remotes/trunk)
r10 = e9bc4f636a29fc9b6cc3acb390847509fbfe9aac (refs/remotes/trunk)
r11 = 7a527b62f9cc01095a7e6d27fb99196a8ab3970e (refs/remotes/trunk)
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
r1 = ef2dcfb17977b891a6611995a42d8c3283044931 (refs/remotes/git-svn)
r2 = 4f42ef1d877503f76452597865aa8e23baebf402 (refs/remotes/git-svn)
r3 = 0c2815f7e795159fa5bdf957345bc37571c25da3 (refs/remotes/git-svn)
r4 = 8f1bdc3e51e18bea60b496ff03b354995ec58065 (refs/remotes/git-svn)
r5 = ecf3dad5772c9b47cec9244305631a19abd01cb3 (refs/remotes/git-svn)
r6 = 16084ce19091aa55ecc0d7e1756ae430d0aee882 (refs/remotes/git-svn)
r7 = 0e69c11a043ce3d91640d602300a21a105ab4f25 (refs/remotes/git-svn)
r8 = 488dc465aa1c7678812498533c8eea301ed76bbd (refs/remotes/git-svn)
r9 = 0a4b7029629586a6c488277861a11ebfeaed0990 (refs/remotes/git-svn)
r10 = 455d053031aeee87bc3cff4cc827127c277d3b69 (refs/remotes/git-svn)
r11 = 5163c20fe3c7e1d2548352615a0af5c1d4282a41 (refs/remotes/git-svn)
	D	d
r12 = a8c3d042d9217ad94c9f5732ebbd8db7fc42bb4f (refs/remotes/git-svn)
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
HEAD is now at ef2dcfb mkdir a
r13 = 51c5e7938ab4da9a274a428f0529d084a2249ade (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
