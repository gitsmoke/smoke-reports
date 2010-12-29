Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5402-post-merge-hook/.git/
expecting success: 
	echo Data for commit0. >a &&
	git update-index --add a &&
	tree0=$(git write-tree) &&
	commit0=$(echo setup | git commit-tree $tree0) &&
	echo Changed data for commit1. >a &&
	git update-index a &&
	tree1=$(git write-tree) &&
	commit1=$(echo modify | git commit-tree $tree1 -p $commit0) &&
        git update-ref refs/heads/master $commit0 &&
	git clone ./. clone1 &&
	GIT_DIR=clone1/.git git update-index --add a &&
	git clone ./. clone2 &&
	GIT_DIR=clone2/.git git update-index --add a
Cloning into clone1
done.
Cloning into clone2
done.
ok 1 - setup
expecting success: 
        GIT_DIR=clone1/.git git merge $commit0 &&
	! test -f clone1/.git/post-merge.args
Already up-to-date.
ok 2 - post-merge does not run for up-to-date 
expecting success: 
        GIT_DIR=clone1/.git git merge $commit1 &&
	test -e clone1/.git/post-merge.args
Updating ce94690..0d2fa06
Fast-forward
 a |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - post-merge runs as expected 
expecting success: 
        grep 0 clone1/.git/post-merge.args
0
ok 4 - post-merge from normal merge receives the right argument 
expecting success: 
        GIT_DIR=clone2/.git git merge --squash $commit1 &&
	test -e clone2/.git/post-merge.args
Updating ce94690..0d2fa06
Fast-forward
Squash commit -- not updating HEAD
 a |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - post-merge from squash merge runs as expected 

expecting success: 
        grep 1 clone2/.git/post-merge.args

1

ok 6 - post-merge from squash merge receives the right argument 

# passed all 6 test(s)
1..6
