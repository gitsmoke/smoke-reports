Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4000-diff-format/.git/
expecting success: git update-index --add path0 path1
ok 1 - update-index --add two files with and without +x.
expecting success: git diff-files -p >current
ok 2 - git diff-files -p after editing work tree.
expecting success: compare_diff_patch current expected
ok 3 - validate git diff-files -p output.

# passed all 3 test(s)
1..3
