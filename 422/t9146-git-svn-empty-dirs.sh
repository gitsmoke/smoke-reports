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
r1 = 063f11595d2030bc4ca321702471610d477da67c (refs/remotes/git-svn)
r2 = 3a607d9605a3affddfd235d5ef8aef9f5ce2e4ae (refs/remotes/git-svn)
r3 = a47714d89c6ab70ac115ca4102841f168d3dd425 (refs/remotes/git-svn)
r4 = d0a6394b8eb0042a68ef00f0ffcd0fea82fd8772 (refs/remotes/git-svn)
r5 = 14a2d9234c6f231102f6a91249d63c052e677119 (refs/remotes/git-svn)
r6 = 09532e519dcef5621a036cb04f219db8b78991c9 (refs/remotes/git-svn)
r7 = e96dc570e934d16b2e42a92822421a4b7a94cc3e (refs/remotes/git-svn)
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
r8 = df1584958d84dc0822d2716796edf2a68895c610 (refs/remotes/git-svn)
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
r9 = af085b59228e77df5f49082d35a8cd6740536595 (refs/remotes/trunk)
r10 = 5af1e041a1714543c767b8b4238889126c6fd6c2 (refs/remotes/trunk)
r11 = 193d10073a8ce5ddbedf0bd95245994062a571b6 (refs/remotes/trunk)
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
r1 = 063f11595d2030bc4ca321702471610d477da67c (refs/remotes/git-svn)
r2 = 3a607d9605a3affddfd235d5ef8aef9f5ce2e4ae (refs/remotes/git-svn)
r3 = a47714d89c6ab70ac115ca4102841f168d3dd425 (refs/remotes/git-svn)
r4 = d0a6394b8eb0042a68ef00f0ffcd0fea82fd8772 (refs/remotes/git-svn)
r5 = 14a2d9234c6f231102f6a91249d63c052e677119 (refs/remotes/git-svn)
r6 = 09532e519dcef5621a036cb04f219db8b78991c9 (refs/remotes/git-svn)
r7 = e96dc570e934d16b2e42a92822421a4b7a94cc3e (refs/remotes/git-svn)
r8 = df1584958d84dc0822d2716796edf2a68895c610 (refs/remotes/git-svn)
r9 = ca4e36dbbb4333314997b330e91baa6ef84462ef (refs/remotes/git-svn)
r10 = 2ccb274b1ef583c23c7ab1c2b6f6f84b0bfa1022 (refs/remotes/git-svn)
r11 = c5af9da06c8e8c5fe05b1ba12ba867e0bfd3a243 (refs/remotes/git-svn)
	D	d
r12 = f568ceacf746520be7880e5903c0a3ef4cb49c92 (refs/remotes/git-svn)
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
HEAD is now at 063f115 mkdir a
r13 = 40aab5fc60f6a079345d38920d575b0654e4357f (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
creating empty directory: gz

ok 13 - git svn gc-ed files work

# passed all 13 test(s)
1..13
