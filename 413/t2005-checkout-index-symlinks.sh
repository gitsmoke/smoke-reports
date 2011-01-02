Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2005-checkout-index-symlinks/.git/
expecting success: 
git config core.symlinks false &&
l=$(printf file | git hash-object -t blob -w --stdin) &&
echo "120000 $l	symlink" | git update-index --index-info

ok 1 - preparation
expecting success: 
git checkout-index symlink &&
test -f symlink

ok 2 - the checked-out symlink must be a file
expecting success: 
test "$(git hash-object -t blob symlink)" = $l

ok 3 - the file must be the blob we added during the setup

# passed all 3 test(s)
1..3
