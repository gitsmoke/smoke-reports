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
r1 = 39e8304c6a18976424f0e65ff8d24ad917dab805 (refs/remotes/git-svn)
r2 = 85c8e618e18ead73b41be05b10b07be610f53a95 (refs/remotes/git-svn)
r3 = f8d94d7fe839b3b19906ad17415a7c3a7a73e72b (refs/remotes/git-svn)
r4 = a1011927871ad2d70e0429667c763ed043f5dc85 (refs/remotes/git-svn)
r5 = 08423741acd5a52251dffd4d3b1f9b015fd6b107 (refs/remotes/git-svn)
r6 = c7617b021826883bd9778ce8ccb39358607e1f7b (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1293595803 +0000
author dd <dd@sub.example.com> 1293595803 +0000
author cc <cc@sub.example.com> 1293595803 +0000
author bb <bb@example.com> 1293595803 +0000
author aa <aa@example.com> 1293595803 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1293595803 +0000

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
r7 = a4d4c47fb2d3de374553ef9fefc12db57d91eb76 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1293595805 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
