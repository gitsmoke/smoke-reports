Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3203-branch-output/.git/
expecting success: 
	echo content >file &&
	git add file &&
	git commit -m one &&
	echo content >>file &&
	git commit -a -m two
[master (root-commit) ba618b2] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master b0504cc] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - make commits

expecting success: 
	git branch branch-one &&
	git branch branch-two HEAD^

ok 2 - make branches

expecting success: 
	git update-ref refs/remotes/origin/branch-one branch-one &&
	git update-ref refs/remotes/origin/branch-two branch-two &&
	git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/branch-one

ok 3 - make remote branches
expecting success: 
	git branch >actual &&
	test_cmp expect actual

ok 4 - git branch shows local branches

expecting success: 
	git branch -r >actual &&
	test_cmp expect actual


ok 5 - git branch -r shows remote branches

expecting success: 
	git branch -a >actual &&
	test_cmp expect actual

ok 6 - git branch -a shows local and remote branches

expecting success: 
	git branch -v >tmp &&
	awk "{print \$NF}" <tmp >actual &&
	test_cmp expect actual


ok 7 - git branch -v shows branch summaries

expecting success: 
	git checkout HEAD^0 &&
	git branch >actual &&
	test_cmp expect actual

ok 8 - git branch shows detached HEAD properly

# passed all 8 test(s)
1..8
