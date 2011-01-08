Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9154-git-svn-fancy-glob/.git/
expecting success: 
	svnadmin load -q '/Users/trast/git-smoke/t/trash directory.t9154-git-svn-fancy-glob/svnrepo' < '/Users/trast/git-smoke/t/t9154/svn.dump' &&
	git svn init --minimize-url -T trunk 'file:///Users/trast/git-smoke/t/trash directory.t9154-git-svn-fancy-glob/svnrepo' &&
	git svn fetch
	
	A	foo
r1 = 0c089186ebd7a51ab6243b9a4df30bd40c0f3e37 (refs/remotes/trunk)
	M	foo
r6 = 5af9e23b532b6f14ffb6e7a41c4cc5edea0f90f1 (refs/remotes/trunk)
ok 1 - load svn repo

expecting success: 
	git config svn-remote.svn.branches 'branches/{red}:refs/remotes/*' &&
	git svn fetch &&
	git rev-parse refs/remotes/red &&
	test_must_fail git rev-parse refs/remotes/green &&
	test_must_fail git rev-parse refs/remotes/blue
	
r2 = a157183e4e8d6fa7b80bfbd149bf70581387b831 (refs/remotes/red)
	M	foo
r3 = c88674aa70585e7d5da5dbd6c6797083ad0954da (refs/remotes/red)
c88674aa70585e7d5da5dbd6c6797083ad0954da
refs/remotes/green
refs/remotes/blue

ok 2 - add red branch

expecting success: 
	GIT_CONFIG=.git/svn/.metadata git config --unset svn-remote.svn.branches-maxRev &&
	git config svn-remote.svn.branches 'branches/{red,green}:refs/remotes/*' &&
	git svn fetch &&
	git rev-parse refs/remotes/red &&
	git rev-parse refs/remotes/green &&
	test_must_fail git rev-parse refs/remotes/blue
	
r2 = 975baec835f2d923c4e7a06c55fcb5f69d67f163 (refs/remotes/green)
	M	foo
r4 = f340947d0f15e187ced6a4224832174e20b07768 (refs/remotes/green)
c88674aa70585e7d5da5dbd6c6797083ad0954da
f340947d0f15e187ced6a4224832174e20b07768
refs/remotes/blue
ok 3 - add green branch
expecting success: 
	GIT_CONFIG=.git/svn/.metadata git config --unset svn-remote.svn.branches-maxRev &&
	git config svn-remote.svn.branches 'branches/*:refs/remotes/*' &&
	git svn fetch &&
	git rev-parse refs/remotes/red &&
	git rev-parse refs/remotes/green &&
	git rev-parse refs/remotes/blue
	
r2 = 6d15e7a37085372fbf9f3bae10479a811dca4daa (refs/remotes/blue)
	M	foo
r5 = f77a2fb1d07593760efe634c8a3452320c700196 (refs/remotes/blue)
c88674aa70585e7d5da5dbd6c6797083ad0954da
f340947d0f15e187ced6a4224832174e20b07768
f77a2fb1d07593760efe634c8a3452320c700196
ok 4 - add all branches

# passed all 4 test(s)
1..4
