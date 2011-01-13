Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4009-diff-rename-4/.git/
expecting success: cat "$TEST_DIRECTORY"/../COPYING >COPYING &&
     echo frotz >rezrov &&
    git update-index --add COPYING rezrov &&
    tree=$(git write-tree) &&
    echo $tree
2c3393c67b3dfc145747edfc45887fd8a2e941f4

ok 1 - prepare reference tree

expecting success: sed -e s/HOWEVER/However/ <COPYING >COPYING.1 &&
    sed -e s/GPL/G.P.L/g <COPYING >COPYING.2 &&
    rm -f COPYING &&
    git update-index --add --remove COPYING COPYING.?

ok 2 - prepare work tree

expecting success: compare_diff_raw_z current expected

ok 3 - validate output from rename/copy detection (#1)

expecting success: mv COPYING.2 COPYING &&
     git update-index --add --remove COPYING COPYING.1 COPYING.2

ok 4 - prepare work tree again

expecting success: compare_diff_raw_z current expected

ok 5 - validate output from rename/copy detection (#2)

expecting success: cat "$TEST_DIRECTORY"/../COPYING >COPYING &&
     git update-index --add --remove COPYING COPYING.1

ok 6 - prepare work tree once again

expecting success: compare_diff_raw_z current expected

ok 7 - validate output from rename/copy detection (#3)

# passed all 7 test(s)
1..7
