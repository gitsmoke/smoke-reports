Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2002-checkout-cache-u/.git/
expecting success: 
echo frotz >path0 &&
git update-index --add path0 &&
t=$(git write-tree)

ok 1 - preparation
expecting success: 
rm -f path0 &&
git read-tree $t &&
git checkout-index -f -a &&
test_must_fail git diff-files --exit-code
:100644 100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0000000000000000000000000000000000000000 M	path0
ok 2 - without -u, git checkout-index smudges stat information.
expecting success: 
rm -f path0 &&
git read-tree $t &&
git checkout-index -u -f -a &&
git diff-files --exit-code

ok 3 - with -u, git checkout-index picks up stat information from new files.

# passed all 3 test(s)
1..3
