Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9152-svn-empty-dirs-after-gc/.git/
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
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9152-svn-empty-dirs-after-gc/cloned/.git/
r1 = dec9d0ee96b6e13889e3f0768bb40078fd84a00f (refs/remotes/git-svn)
r2 = 0dfc2c90cc6b7eb79383db5c265b27f0235ec486 (refs/remotes/git-svn)
r3 = b0ff83d06e1bc12a37ce050f48ebe71abdbe03c9 (refs/remotes/git-svn)
r4 = 161961385fe3b5094de4de910f5c008bfa54827d (refs/remotes/git-svn)
r5 = 7f7b38250a82ed5c6e253ece7ecf1894aacb166a (refs/remotes/git-svn)
r6 = 88e0aee1890d4d6c7ba942d0a172e230cfc0ee66 (refs/remotes/git-svn)
r7 = 3c5193463468423193fbc8e96e2452fb4f98f354 (refs/remotes/git-svn)
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
		git svn gc
	)

ok 3 - git svn gc runs

expecting success: 
	(
		cd cloned &&
		rm -r * &&
		git svn mkdirs &&
		for i in a b c d d/e d/e/f "weird file name"
		do
			if ! test -d "$i"
			then
				echo >&2 "$i does not exist"
				exit 1
			fi
		done
	)

creating empty directory: a
creating empty directory: b
creating empty directory: c
creating empty directory: d
creating empty directory: d/e
creating empty directory: d/e/f
creating empty directory: weird file name

ok 4 - git svn mkdirs recreates empty directories after git svn gc

# passed all 4 test(s)
1..4
