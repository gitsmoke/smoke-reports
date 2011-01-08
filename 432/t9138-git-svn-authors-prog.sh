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
r1 = 0dbafe550ca0a3a62c52c08ba13c33bde75cfa5e (refs/remotes/git-svn)
r2 = 8c145d473e92d27067af9dd1d577a5e80b90e247 (refs/remotes/git-svn)
r3 = c5f80af6a2b8f5853f50fac823adfd5497061ca1 (refs/remotes/git-svn)
r4 = a50c150cc344383d1d0f8fb741fba9b78b63a4e1 (refs/remotes/git-svn)
r5 = 4569ca8a212cea3fd1a42f491a9144910fde085c (refs/remotes/git-svn)
r6 = 2677b8030fb9c75d0b31e060a67ff0fe9a20557b (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294459803 +0000
author dd <dd@sub.example.com> 1294459803 +0000
author cc <cc@sub.example.com> 1294459803 +0000
author bb <bb@example.com> 1294459803 +0000
author aa <aa@example.com> 1294459803 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294459803 +0000

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
r7 = e2f0b2791fc9eb1838b76f7b9ca8dda1e10d01b9 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294459804 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
