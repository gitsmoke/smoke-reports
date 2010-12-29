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
r1 = 6f6aa0ac34bc78708c74c004955123874edf9b36 (refs/remotes/git-svn)
r2 = 87b8f69dd54f243304f4c16d4f2b0000bbb1d50b (refs/remotes/git-svn)
r3 = c314a49a9ae6a28a1577d1185b3323b7b8e9f5ff (refs/remotes/git-svn)
r4 = cb0630b3ff4e77c154a3b4b11b1b265bbde551a8 (refs/remotes/git-svn)
r5 = f654059b1155c00ca2121c79f37ea8189f9e10d3 (refs/remotes/git-svn)
r6 = 32225052fdd7d507bca7ac789ef604215e4aa6a2 (refs/remotes/git-svn)
r7 = 5a82644d690ff95633c8dcdf5201550621d49d1e (refs/remotes/git-svn)
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
r8 = 3c7e1e9610adc6da3e1592dd5fe28758c51aa4ab (refs/remotes/git-svn)
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
r9 = cf26ad368d2a23b053e0f02524ed83d6252808f7 (refs/remotes/trunk)
r10 = 5a13030e770f0b47a0295521253f5c9918caa0b3 (refs/remotes/trunk)
r11 = 12718c4e58689feffaa1081879bfce780acbd3d1 (refs/remotes/trunk)
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
r1 = 6f6aa0ac34bc78708c74c004955123874edf9b36 (refs/remotes/git-svn)
r2 = 87b8f69dd54f243304f4c16d4f2b0000bbb1d50b (refs/remotes/git-svn)
r3 = c314a49a9ae6a28a1577d1185b3323b7b8e9f5ff (refs/remotes/git-svn)
r4 = cb0630b3ff4e77c154a3b4b11b1b265bbde551a8 (refs/remotes/git-svn)
r5 = f654059b1155c00ca2121c79f37ea8189f9e10d3 (refs/remotes/git-svn)
r6 = 32225052fdd7d507bca7ac789ef604215e4aa6a2 (refs/remotes/git-svn)
r7 = 5a82644d690ff95633c8dcdf5201550621d49d1e (refs/remotes/git-svn)
r8 = 3c7e1e9610adc6da3e1592dd5fe28758c51aa4ab (refs/remotes/git-svn)
r9 = 621cefb99f58dd802f3f62255cfc1181f949ad80 (refs/remotes/git-svn)
r10 = c6e269f6b0108d1063073665acc702e8b3f87fb8 (refs/remotes/git-svn)
r11 = 6f1b1b4c4184f9954c014f0eb12c2379607c5ac7 (refs/remotes/git-svn)
	D	d
r12 = 3535d3df3fabf9c1fcacaa78642f1cfbac7472a5 (refs/remotes/git-svn)
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
HEAD is now at 6f6aa0a mkdir a
r13 = 7331987b1f723b27119e525ccda719efa82b7d1d (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
