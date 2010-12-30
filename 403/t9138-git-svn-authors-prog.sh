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
r1 = 0b554b143b6d5e8811dbd3a2ae8e0884cf83e151 (refs/remotes/git-svn)
r2 = e0f3e996e2eedf52355d5e5d0f123302305658c5 (refs/remotes/git-svn)
r3 = 036fca873654b0d3fe7968ae19172c70c5a1e66c (refs/remotes/git-svn)
r4 = e08ff08769ffbe943273469d784ce0ee0b0dc4b1 (refs/remotes/git-svn)
r5 = 4960b90f33b7c2acec2d09da51d13c454790a618 (refs/remotes/git-svn)
r6 = 4d820aa6a170a0db0f90904edb17a665c0ce6efb (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1293681845 +0000
author dd <dd@sub.example.com> 1293681845 +0000
author cc <cc@sub.example.com> 1293681845 +0000
author bb <bb@example.com> 1293681845 +0000
author aa <aa@example.com> 1293681845 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1293681845 +0000

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
r7 = ad194d26ec5ec66c3cbc6783ebead16a0817f103 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1293681847 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
