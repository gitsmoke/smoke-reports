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
r1 = 44186c5289cfa8b3e0380ee4082d338c92ad9a98 (refs/remotes/git-svn)
r2 = 7cd9e2abfc882404f4f3ec277b58040f1f2115aa (refs/remotes/git-svn)
r3 = 9a60cc871397113b92e6d27e88876686ed54df17 (refs/remotes/git-svn)
r4 = b94bfebf7367de115a7b3c64995ee515d609bf17 (refs/remotes/git-svn)
r5 = 418a8052e2ea41b1eee05b62593b310b656c5eb4 (refs/remotes/git-svn)
r6 = b9ef850e22fb1f6f3999024eeedacd98b23becec (refs/remotes/git-svn)
r7 = 8e99fb9e341f029bcb4fac62d5fb19e0a67de6af (refs/remotes/git-svn)
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
