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
r1 = ee5d2825ae95bf86a44ff4818fe8f77bd751f282 (refs/remotes/git-svn)
r2 = ae5586db5bfef3edd69b90539b8e8556e6b23ffa (refs/remotes/git-svn)
r3 = c77ee57b30aaaa1465fca977a073f3d999f1c884 (refs/remotes/git-svn)
r4 = cd107cabe0603ef9a6c5e9311fc26f0326dce2ea (refs/remotes/git-svn)
r5 = 823f0ccd0cd8f5e7a51c6abd8147ea61e7f6df2a (refs/remotes/git-svn)
r6 = 2ee00d9d4e09cfdc810767ad1bc4086b91f4e7b1 (refs/remotes/git-svn)
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
	
author ee-foo <ee-foo@example.com> 1294891812 +0000
author dd <dd@sub.example.com> 1294891812 +0000
author cc <cc@sub.example.com> 1294891812 +0000
author bb <bb@example.com> 1294891812 +0000
author aa <aa@example.com> 1294891812 +0000

ok 4 - authors-prog ran correctly

expecting success: 
	(
		cd x
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author FFFFFFF FFFFFFF <fFf@other\.example\.com> "
	)
	
author FFFFFFF FFFFFFF <fFf@other.example.com> 1294891812 +0000

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
r7 = ae27f7519e7f25054578bd84b8acf10b6ceae1ad (refs/remotes/git-svn)
author xyz; touch evil <xyz; touch evil@example.com> 1294891814 +0000

ok 6 - authors-prog handled special characters in username

# passed all 6 test(s)
1..6
