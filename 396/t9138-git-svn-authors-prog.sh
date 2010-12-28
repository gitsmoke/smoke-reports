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
r1 = 8a7841d08572b15ce94a02ef57589169d8804157 (refs/remotes/git-svn)
r2 = 57e2f26556e63007c53bf1b24c44221b7b7e90ed (refs/remotes/git-svn)
r3 = c71787ef0814f52034c8bbfb1d97864e9f6be626 (refs/remotes/git-svn)
r4 = e099681bd5c861530eb18cf59258e6acadfef1b6 (refs/remotes/git-svn)
r5 = 9fb694292ee1ba91b249a5f75c8e2cb321fe4b81 (refs/remotes/git-svn)
r6 = 520fdde037bdf0a3099136d791eb5a230e1c33a0 (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1293509048 +0000
author dd <dd@sub.example.com> 1293509048 +0000
author cc <cc@sub.example.com> 1293509048 +0000
author bb <bb@example.com> 1293509048 +0000
author aa <aa@example.com> 1293509048 +0000
ok 4 - authors-prog ran correctly
expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1293509048 +0000
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
r7 = 14133c74086f0d1ba8ed5a854fe4f01c110cf713 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1293509049 +0000
ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
