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
r1 = 5b390ecfe821cc66f8eadc72f9d23e761df97a94 (refs/remotes/git-svn)
r2 = 451cc77e4cd5413461d4cf3992b98190eaa90268 (refs/remotes/git-svn)
r3 = 812e1ac2d375c97349c21cc4470b06b21e8d444a (refs/remotes/git-svn)
r4 = ce9aba5408e84775082a7594b5394e43014b1219 (refs/remotes/git-svn)
r5 = 07e379ad3e9462206d510cde9de1bb06092c6627 (refs/remotes/git-svn)
r6 = a861a687f9d4aaa531bd7408360a3c895eda26ef (refs/remotes/git-svn)
r7 = 78c572fc5674cdc04d0940bed2df88c88981d86c (refs/remotes/git-svn)
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
