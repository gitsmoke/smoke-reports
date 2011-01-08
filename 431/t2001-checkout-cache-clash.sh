Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2001-checkout-cache-clash/.git/
expecting success: git update-index --add path0/file0

ok 1 - git update-index --add path0/file0

expecting success: tree1=$(git write-tree)

ok 2 - writing tree out with git write-tree
expecting success: git update-index --add path1/file1
ok 3 - git update-index --add path1/file1

expecting success: tree2=$(git write-tree)

ok 4 - writing tree out with git write-tree

expecting success: git read-tree -m $tree1 && git checkout-index -f -a

ok 5 - read previously written tree and checkout.
expecting success: ln -s path0 path1 &&
     git update-index --add path1

ok 6 - git update-index --add a symlink.

expecting success: tree3=$(git write-tree)

ok 7 - writing tree out with git write-tree

expecting success: git read-tree $tree2 && git checkout-index -f -a

ok 8 - read previously written tree and checkout.

expecting success: test ! -h path0 && test -d path0 &&
     test ! -h path1 && test -d path1 &&
     test ! -h path0/file0 && test -f path0/file0 &&
     test ! -h path1/file1 && test -f path1/file1

ok 9 - checking out conflicting path with -f

# passed all 9 test(s)
1..9
