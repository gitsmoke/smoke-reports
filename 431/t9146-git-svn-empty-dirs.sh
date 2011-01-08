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
r1 = e91f76c21217a8b32122c1ea10a0820ac9154c8c (refs/remotes/git-svn)
r2 = d6edf8e038f2e885a930f2e7fc9516c9b54ad0be (refs/remotes/git-svn)
r3 = b79e0b60ef94fd22f806f18498d2a2086fe04d25 (refs/remotes/git-svn)
r4 = af2fd76e36135a50e7a006aef62f23e15588d6f7 (refs/remotes/git-svn)
r5 = 7adf14dbcfbd1371e45b84e1d96b90f6dd81478c (refs/remotes/git-svn)
r6 = de6db3cbabcafad59986886fd922f8d00a81e6bc (refs/remotes/git-svn)
r7 = c0498c89406014ab3b9b789510007e122a2617c9 (refs/remotes/git-svn)
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
r8 = 0df2a4189f09bf35721d9b701539409c4e45ee67 (refs/remotes/git-svn)
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
r9 = 93f4a3c7bd88712b5e17c97ec2c1b250417f607c (refs/remotes/trunk)
r10 = a2d00cf67cea705f3ff0f87fb05957f8deae19b4 (refs/remotes/trunk)
r11 = 5418cbd0920544cb4b4e9fce9f6d254720d51040 (refs/remotes/trunk)
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
r1 = e91f76c21217a8b32122c1ea10a0820ac9154c8c (refs/remotes/git-svn)
r2 = d6edf8e038f2e885a930f2e7fc9516c9b54ad0be (refs/remotes/git-svn)
r3 = b79e0b60ef94fd22f806f18498d2a2086fe04d25 (refs/remotes/git-svn)
r4 = af2fd76e36135a50e7a006aef62f23e15588d6f7 (refs/remotes/git-svn)
r5 = 7adf14dbcfbd1371e45b84e1d96b90f6dd81478c (refs/remotes/git-svn)
r6 = de6db3cbabcafad59986886fd922f8d00a81e6bc (refs/remotes/git-svn)
r7 = c0498c89406014ab3b9b789510007e122a2617c9 (refs/remotes/git-svn)
r8 = 0df2a4189f09bf35721d9b701539409c4e45ee67 (refs/remotes/git-svn)
r9 = 641d3a791bf31d1f80589fbc94a7d548da6dcf07 (refs/remotes/git-svn)
r10 = f66b8c248006134963962b8b6fb40ba5b3deb7f1 (refs/remotes/git-svn)
r11 = d951591f3ffb2c6a1834cb148b59776f58339ffe (refs/remotes/git-svn)
	D	d
r12 = 737d78017ef3295001392c92c2e7a144001e9f4a (refs/remotes/git-svn)
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
HEAD is now at e91f76c mkdir a
r13 = d1622a9886eab29211e3e392a40f9764740cf56e (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
