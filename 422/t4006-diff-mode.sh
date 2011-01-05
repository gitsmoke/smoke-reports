Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4006-diff-mode/.git/
expecting success: echo frotz >rezrov &&
     git update-index --add rezrov &&
     tree=`git write-tree` &&
     echo $tree
5189e2f1ba2c164fa2006e4f8f4e4ec56f15291e

ok 1 - setup

expecting success: test_chmod +x rezrov &&
     git diff-index $tree >current

ok 2 - chmod
expecting success: test_cmp expected check

ok 3 - verify

# passed all 3 test(s)
1..3
