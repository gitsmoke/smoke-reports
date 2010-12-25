Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9111-git-svn-use-svnsync-props/.git/
expecting success: 
	svnadmin load -q "$rawsvnrepo" < "$TEST_DIRECTORY"/t9111/svnsync.dump &&
	git svn init --minimize-url -R arr -i bar "$svnrepo"/bar &&
	git svn init --minimize-url -R argh -i dir "$svnrepo"/dir &&
	git svn init --minimize-url -R argh -i e "$svnrepo"/dir/a/b/c/d/e &&
	git config svn.useSvnsyncProps true &&
	git svn fetch --all
	
	A	file
r1 = 6aadfc98d31cbed4e89c9d601491ad7b5c46d857 (refs/remotes/e)
	A	a/b/c/d/e/file
r1 = 79a1181387506bdda9e0f310c40ddb3f4eed7179 (refs/remotes/dir)
	D	a/b/c/d/e/file
	D	a/
	A	file
r2 = c165f07c4c5694be18c9c28331ca7efd46d78417 (refs/remotes/dir)
	A	zzz
r1 = 44a982ce17928f9542c6f3fce48affc197150e1e (refs/remotes/bar)
	M	zzz
r6 = 2ebd1f75bc1fdd83dcbcdf6194f8b9a16e4fdeb0 (refs/remotes/bar)
	A	d
r9 = 07c2950915eb3ada192043ac2e5efcf9d9e07de3 (refs/remotes/bar)
	A	newdir/dir
r10 = 7b59bc03f91e595ef213c16f436644c05d922782 (refs/remotes/bar)
	M	newdir/dir
r11 = 8775e0be15e9c3fd282c6f4e71a82766ab3e9231 (refs/remotes/bar)
	M	d
r12 = ab9ada04d293d792e2e941a664911858fe0167af (refs/remotes/bar)
ok 1 - load svnsync repo
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

# passed all 4 test(s)
1..4
