Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5403-post-checkout-hook/.git/
expecting success: 
	echo Data for commit0. >a &&
	echo Data for commit0. >b &&
	git update-index --add a &&
	git update-index --add b &&
	tree0=$(git write-tree) &&
	commit0=$(echo setup | git commit-tree $tree0) &&
	git update-ref refs/heads/master $commit0 &&
	git clone ./. clone1 &&
	git clone ./. clone2 &&
	GIT_DIR=clone2/.git git branch new2 &&
	echo Data for commit1. >clone2/b &&
	GIT_DIR=clone2/.git git add clone2/b &&
	GIT_DIR=clone2/.git git commit -m new2
Cloning into clone1
done.
Cloning into clone2
done.
[master 1844edf] new2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 clone2/b

ok 1 - setup
expecting success: 
        GIT_DIR=clone1/.git git checkout master &&
        test -e clone1/.git/post-checkout.args
ok 2 - post-checkout runs as expected 
expecting success: 
        old=$(awk "{print \$1}" clone1/.git/post-checkout.args) &&
        new=$(awk "{print \$2}" clone1/.git/post-checkout.args) &&
        flag=$(awk "{print \$3}" clone1/.git/post-checkout.args) &&
        test $old = $new -a $flag = 1

ok 3 - post-checkout receives the right arguments with HEAD unchanged 

expecting success: 
        GIT_DIR=clone1/.git git checkout master &&
        test -e clone1/.git/post-checkout.args


ok 4 - post-checkout runs as expected 

expecting success: 
        GIT_DIR=clone1/.git git checkout -b new1 &&
        old=$(awk "{print \$1}" clone1/.git/post-checkout.args) &&
        new=$(awk "{print \$2}" clone1/.git/post-checkout.args) &&
        flag=$(awk "{print \$3}" clone1/.git/post-checkout.args) &&
        test $old = $new -a $flag = 1
ok 5 - post-checkout args are correct with git checkout -b 
expecting success: 
        GIT_DIR=clone2/.git git checkout new2 &&
        old=$(awk "{print \$1}" clone2/.git/post-checkout.args) &&
        new=$(awk "{print \$2}" clone2/.git/post-checkout.args) &&
        flag=$(awk "{print \$3}" clone2/.git/post-checkout.args) &&
        test $old != $new -a $flag = 1
ok 6 - post-checkout receives the right args with HEAD changed 
expecting success: 
        GIT_DIR=clone2/.git git checkout master b &&
        old=$(awk "{print \$1}" clone2/.git/post-checkout.args) &&
        new=$(awk "{print \$2}" clone2/.git/post-checkout.args) &&
        flag=$(awk "{print \$3}" clone2/.git/post-checkout.args) &&
        test $old = $new -a $flag = 0

ok 7 - post-checkout receives the right args when not switching branches 

expecting success: 
	git clone --template=templates . clone3 &&
	test -f clone3/.git/post-checkout.args
Cloning into clone3
done.

ok 8 - post-checkout hook is triggered by clone

# passed all 8 test(s)
1..8
