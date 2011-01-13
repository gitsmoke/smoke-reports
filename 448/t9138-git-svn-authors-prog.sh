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
r1 = f312cd7f7e1b0c2448225aa1e7072a4f65efb266 (refs/remotes/git-svn)
r2 = 6842eebab0fc0e1a875d4a2640f4ba7d3392336b (refs/remotes/git-svn)
r3 = 133c7a4c5324944e059d5abd4d5ffb54eec5149c (refs/remotes/git-svn)
r4 = 9069d038a0607d01d91fc5d5cbc51abd5f8999fe (refs/remotes/git-svn)
r5 = f6a5443d4beaf70d7cdcd7aaf7b73a85155c2e55 (refs/remotes/git-svn)
r6 = 63203cc1e36f9b23ea6b3432f8ee6b26aee732dc (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294891447 +0000
author dd <dd@sub.example.com> 1294891447 +0000
author cc <cc@sub.example.com> 1294891447 +0000
author bb <bb@example.com> 1294891447 +0000
author aa <aa@example.com> 1294891447 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294891447 +0000

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
r7 = e14a268dfb42b1516deb9e42db9287263a8706f4 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294891448 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
