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
r1 = 7a2498a41819f52754bdb5749695f4ed6e3f454f (refs/remotes/git-svn)
r2 = 1847b0d7e698839063a760f6fbb313ecdd9380ef (refs/remotes/git-svn)
r3 = 62f6a2b48daefe7efc35169a163116be004a4fca (refs/remotes/git-svn)
r4 = acac4d999b228f4082be39a6228f7ef982414a52 (refs/remotes/git-svn)
r5 = 518d77a88c3d041fcb9d61e2403cca87278d8483 (refs/remotes/git-svn)
r6 = c1f5adf45ffb8722ab58483c80c15741ccbdd785 (refs/remotes/git-svn)
r7 = 7fdf2cb62d6e013baf80643e5bd801394e10dac0 (refs/remotes/git-svn)
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
r8 = 05c170a99fe4c379859dce11cef642d5ec3f642f (refs/remotes/git-svn)
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
r9 = 02ebbba721ff47c8bdc9f71a790852d579f8aad9 (refs/remotes/trunk)
r10 = 155ed6c38986727d6ea01d74a5625016c20718a6 (refs/remotes/trunk)
r11 = c1c08567b398393639f51f46aa1c89d9eabcf478 (refs/remotes/trunk)
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
r1 = 7a2498a41819f52754bdb5749695f4ed6e3f454f (refs/remotes/git-svn)
r2 = 1847b0d7e698839063a760f6fbb313ecdd9380ef (refs/remotes/git-svn)
r3 = 62f6a2b48daefe7efc35169a163116be004a4fca (refs/remotes/git-svn)
r4 = acac4d999b228f4082be39a6228f7ef982414a52 (refs/remotes/git-svn)
r5 = 518d77a88c3d041fcb9d61e2403cca87278d8483 (refs/remotes/git-svn)
r6 = c1f5adf45ffb8722ab58483c80c15741ccbdd785 (refs/remotes/git-svn)
r7 = 7fdf2cb62d6e013baf80643e5bd801394e10dac0 (refs/remotes/git-svn)
r8 = 05c170a99fe4c379859dce11cef642d5ec3f642f (refs/remotes/git-svn)
r9 = 229ba6ab24bfe84a41cd38a6275ab89243751ff9 (refs/remotes/git-svn)
r10 = 2984d70808e2fd323b5522efea80c8702ab7b0c7 (refs/remotes/git-svn)
r11 = fe9145a82d9f692fd541a7423a5c7f71e8babd65 (refs/remotes/git-svn)
	D	d
r12 = b116758175b2bc580a074ec832305a633e169fc8 (refs/remotes/git-svn)
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
HEAD is now at 7a2498a mkdir a
r13 = e2a624a0e177fec254d2640861192338b15d1ef7 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
