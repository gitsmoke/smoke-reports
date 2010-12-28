Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4008-diff-break-rewrite/.git/
expecting success: cat "$TEST_DIRECTORY"/../README >file0 &&
     cat "$TEST_DIRECTORY"/../COPYING >file1 &&
    git update-index --add file0 file1 &&
    tree=$(git write-tree) &&
    echo "$tree"
b32a3de27b340d7ae5d4a119afced25094af0582

ok 1 - setup

expecting success: sed -e "s/git/GIT/" file0 >file1 &&
     rm -f file0 &&
    git update-index --remove file0 file1

ok 2 - change file1 with copy-edit of file0 and remove file0

expecting success: git diff-index -B --cached "$tree" >current

ok 3 - run diff with -B
expecting success: compare_diff_raw expected current
ok 4 - validate result of -B (#1)
expecting success: git diff-index -B -M "$tree" >current

ok 5 - run diff with -B and -M

expecting success: compare_diff_raw expected current

ok 6 - validate result of -B -M (#2)

expecting success: rm -f file0 file1 &&
     git read-tree -m $tree &&
     git checkout-index -f -u -a &&
     mv file0 tmp &&
     mv file1 file0 &&
     mv tmp file1 &&
     git update-index file0 file1

ok 7 - swap file0 and file1

expecting success: git diff-index -B "$tree" >current

ok 8 - run diff with -B
expecting success: compare_diff_raw expected current
ok 9 - validate result of -B (#3)
expecting success: git diff-index -B -M "$tree" >current

ok 10 - run diff with -B and -M

expecting success: compare_diff_raw expected current

ok 11 - validate result of -B -M (#4)

expecting success: rm -f file0 &&
     ln -s frotz file0 &&
     git update-index file0 file1

ok 12 - make file0 into something completely different

expecting success: git diff-index -B "$tree" >current

ok 13 - run diff with -B

expecting success: compare_diff_raw expected current

ok 14 - validate result of -B (#5)

expecting success: git diff-index -B -M "$tree" >current

ok 15 - run diff with -B -M

expecting success: compare_diff_raw expected current

ok 16 - validate result of -B -M (#6)

expecting success: git diff-index -M "$tree" >current

ok 17 - run diff with -M

expecting success: compare_diff_raw expected current

ok 18 - validate result of -M (#7)

expecting success: rm -f file0 file1 &&
     git read-tree -m $tree &&
     git checkout-index -f -u -a &&
     sed -e "s/git/GIT/" file0 >file1 &&
     sed -e "s/git/GET/" file0 >file2 &&
     rm -f file0 &&
     git update-index --add --remove file0 file1 file2

ok 19 - file1 edited to look like file0 and file0 rename-edited to file2

expecting success: git diff-index -B "$tree" >current

ok 20 - run diff with -B
expecting success: compare_diff_raw expected current
ok 21 - validate result of -B (#8)
expecting success: git diff-index -B -M "$tree" >current
ok 22 - run diff with -B -M
expecting success: compare_diff_raw expected current

ok 23 - validate result of -B -M (#9)

# passed all 23 test(s)
1..23
