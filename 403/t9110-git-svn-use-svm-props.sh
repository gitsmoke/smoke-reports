Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9110-git-svn-use-svm-props/.git/
expecting success: 
	svnadmin load -q "$rawsvnrepo" < "$TEST_DIRECTORY"/t9110/svm.dump &&
	git svn init --minimize-url -R arr -i bar "$svnrepo"/mirror/arr &&
	git svn init --minimize-url -R argh -i dir "$svnrepo"/mirror/argh &&
	git svn init --minimize-url -R argh -i e \
	  "$svnrepo"/mirror/argh/a/b/c/d/e &&
	git config svn.useSvmProps true &&
	git svn fetch --all
	
	A	a/b/c/d/e/file
r9 (@1) = 79a1181387506bdda9e0f310c40ddb3f4eed7179 (refs/remotes/dir)
	A	file
r9 (@1) = 6aadfc98d31cbed4e89c9d601491ad7b5c46d857 (refs/remotes/e)
	D	a/b/c/d/e/file
	D	a/
	A	file
r10 (@2) = c165f07c4c5694be18c9c28331ca7efd46d78417 (refs/remotes/dir)
	A	zzz
r2 (@1) = 44a982ce17928f9542c6f3fce48affc197150e1e (refs/remotes/bar)
	M	zzz
r3 (@6) = 2ebd1f75bc1fdd83dcbcdf6194f8b9a16e4fdeb0 (refs/remotes/bar)
	A	d
r4 (@9) = 07c2950915eb3ada192043ac2e5efcf9d9e07de3 (refs/remotes/bar)
	A	newdir/dir
r5 (@10) = 7b59bc03f91e595ef213c16f436644c05d922782 (refs/remotes/bar)
	M	newdir/dir
r6 (@11) = 8775e0be15e9c3fd282c6f4e71a82766ab3e9231 (refs/remotes/bar)
	M	d
r7 (@12) = ab9ada04d293d792e2e941a664911858fe0167af (refs/remotes/bar)
ok 1 - load svm repo
expecting success: 
	git cat-file commit refs/remotes/bar | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@12 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/bar~1 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@11 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/bar~2 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@10 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/bar~3 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@9 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/bar~4 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@6 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/bar~5 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/bar@1 161ce429-a9dd-4828-af4a-52023f968c89$'
	
git-svn-id: http://mayonaise/svnrepo/bar@12 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/bar@11 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/bar@10 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/bar@9 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/bar@6 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/bar@1 161ce429-a9dd-4828-af4a-52023f968c89
ok 2 - verify metadata for /bar
expecting success: 
	git cat-file commit refs/remotes/e | 	   grep '^git-svn-id: http://mayonaise/svnrepo/dir/a/b/c/d/e@1 161ce429-a9dd-4828-af4a-52023f968c89$'
	
git-svn-id: http://mayonaise/svnrepo/dir/a/b/c/d/e@1 161ce429-a9dd-4828-af4a-52023f968c89
ok 3 - verify metadata for /dir/a/b/c/d/e
expecting success: 
	git cat-file commit refs/remotes/dir | 	   grep '^git-svn-id: http://mayonaise/svnrepo/dir@2 161ce429-a9dd-4828-af4a-52023f968c89$' &&
	git cat-file commit refs/remotes/dir~1 | 	   grep '^git-svn-id: http://mayonaise/svnrepo/dir@1 161ce429-a9dd-4828-af4a-52023f968c89$'
	
git-svn-id: http://mayonaise/svnrepo/dir@2 161ce429-a9dd-4828-af4a-52023f968c89
git-svn-id: http://mayonaise/svnrepo/dir@1 161ce429-a9dd-4828-af4a-52023f968c89
ok 4 - verify metadata for /dir
expecting success: 
        git svn find-rev r12 |
	    grep ab9ada04d293d792e2e941a664911858fe0167af
        
ab9ada04d293d792e2e941a664911858fe0167af

ok 5 - find commit based on SVN revision number

expecting success: 
	git svn rebase
	
Current branch master is up to date.

ok 6 - empty rebase

# passed all 6 test(s)
1..6
