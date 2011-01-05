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
r1 = 8baddd4e0863413876457adae69df78440bef077 (refs/remotes/git-svn)
r2 = f6a3bbac7098a195ae77272297f437846cbf4bcb (refs/remotes/git-svn)
r3 = 47395d5e4a1849e301198f1702e35b907a5a9b89 (refs/remotes/git-svn)
r4 = 235c863445097da2793c0122afb7216f44ff71da (refs/remotes/git-svn)
r5 = 2ee8c793f8e298635659a6ba51ba0c241ab3bba5 (refs/remotes/git-svn)
r6 = bcb2430269bc18bfc18349552ceb5eee9e526a8c (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294200591 +0000
author dd <dd@sub.example.com> 1294200591 +0000
author cc <cc@sub.example.com> 1294200591 +0000
author bb <bb@example.com> 1294200591 +0000
author aa <aa@example.com> 1294200591 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294200591 +0000

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
r7 = 7610e820706a4f4eedc95b0dc3d544c1536867c6 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294200592 +0000
ok 6 - authors-prog handled special characters in username
# passed all 6 test(s)
1..6
