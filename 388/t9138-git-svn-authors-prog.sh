Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9138-git-svn-authors-prog/.git/
expecting success: 
	for i in aa bb cc-sub dd-sub ee-foo ff
	do
		svn mkdir -m $i --username $i "$svnrepo"/$i
	done
	

Committed revision 1.

Committed revision 2.

Committed revision 3.

Committed revision 4.

Committed revision 5.

Committed revision 6.

ok 1 - setup svnrepo

expecting success: 
	git svn clone --authors-prog=./svn-authors-prog \
	    --authors-file=svn-authors "$svnrepo" x
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9138-git-svn-authors-prog/x/.git/
r1 = 464a5626829317e7169d8dfa939ce2456dd2c0c6 (refs/remotes/git-svn)
r2 = 39116aa8d87dc9e2cceeda75de06e181e388774d (refs/remotes/git-svn)
r3 = 156dee4f2a1fffa9e94657a240e73f59eb57f68f (refs/remotes/git-svn)
r4 = b3417ced83e3796d0b3e246055c7c23869b9d538 (refs/remotes/git-svn)
r5 = 8059452c57eaefaddd6b8cd4c5699128438c3611 (refs/remotes/git-svn)
r6 = 2888eaced6d4d1262f9dd9bc044add17b95b53eb (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc-sub
creating empty directory: dd-sub
creating empty directory: ee-foo
creating empty directory: ff

ok 2 - import authors with prog and file

expecting success: 
	(
		cd x
		test "`git rev-list refs/remotes/git-svn | wc -l`" -eq 6
	)
	

ok 3 - imported 6 revisions successfully

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn~1 | \
		  grep "^author ee-foo <ee-foo@example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~2 | \
		  grep "^author dd <dd@sub\.example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~3 | \
		  grep "^author cc <cc@sub\.example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~4 | \
		  grep "^author bb <bb@example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~5 | \
		  grep "^author aa <aa@example\.com> "
	)
	
author ee-foo <ee-foo@example.com> 1293249839 +0000
author dd <dd@sub.example.com> 1293249839 +0000
author cc <cc@sub.example.com> 1293249839 +0000
author bb <bb@example.com> 1293249839 +0000
author aa <aa@example.com> 1293249839 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1293249839 +0000

ok 5 - authors-file overrode authors-prog

expecting success: 
	svn mkdir -m bad --username "xyz; touch evil" "$svnrepo"/bad &&
	(
		cd x &&
		git svn --authors-prog=../svn-authors-prog fetch &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn |
		grep "^author xyz; touch evil <xyz; touch evil@example\.com> " &&
		! test -f evil
	)


Committed revision 7.
r7 = 049d1fdf735e18c23797561e138b4771584776f9 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1293249840 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
