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
r1 = 368c70e3f180f0a4ba35852ed860b90be954845f (refs/remotes/git-svn)
r2 = 7937400929fe539433697e0f3595b84b19b5260e (refs/remotes/git-svn)
r3 = c5153a529adb9d7ffbf0ad10eaef86269b980fb2 (refs/remotes/git-svn)
r4 = d2bd1fa42691c49950aa0b95851d1293ccb515ca (refs/remotes/git-svn)
r5 = 7786785104b19e8a0907fb087437dad4e06e6943 (refs/remotes/git-svn)
r6 = 1c0681f07efcad2b49362264b3414251e3393c93 (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294286683 +0000
author dd <dd@sub.example.com> 1294286683 +0000
author cc <cc@sub.example.com> 1294286683 +0000
author bb <bb@example.com> 1294286683 +0000
author aa <aa@example.com> 1294286683 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294286683 +0000

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
r7 = 0afa7d082ab437bbe46a28566313972d0c98d542 (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294286685 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
