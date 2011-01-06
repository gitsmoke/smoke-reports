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
r1 = 8ea11a59c2b219b63beca80b146406b443613f83 (refs/remotes/git-svn)
r2 = 0466886fea8feb0012aa788b08a7303d0b78c403 (refs/remotes/git-svn)
r3 = 0ccf24997e5c4965ccadb0aefc8c55a6e392b635 (refs/remotes/git-svn)
r4 = 9abc0cad6ad970a7092bf0270d33dc1e09e62fee (refs/remotes/git-svn)
r5 = c1a6c5fd7e67398bef2af735da2443153430ab95 (refs/remotes/git-svn)
r6 = a65ebc2adb22f2064163127e70b0b7a44c60ffff (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294287045 +0000
author dd <dd@sub.example.com> 1294287045 +0000
author cc <cc@sub.example.com> 1294287045 +0000
author bb <bb@example.com> 1294287045 +0000
author aa <aa@example.com> 1294287045 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294287045 +0000

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
r7 = 69a1e63a1719b4588aa4b901474352d2323060d6 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294287046 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
