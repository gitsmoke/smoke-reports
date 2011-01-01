Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3010-ls-files-killed-modified/.git/
expecting success: git update-index --add -- path0 path1 path?/file? path7 path8 path9 path10

ok 1 - git update-index --add to add various paths.
expecting success: git ls-files -k >.output

ok 2 - git ls-files -k to show killed files.
expecting success: test_cmp .expected .output

ok 3 - validate git ls-files -k output.

expecting success: git ls-files -m >.output

ok 4 - git ls-files -m to show modified files.
expecting success: test_cmp .expected .output
ok 5 - validate git ls-files -m output.
# passed all 5 test(s)
1..5
