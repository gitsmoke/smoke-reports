Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4102-apply-rename/.git/
expecting success: git update-index --add foo
ok 1 - setup
expecting success: git apply --index --stat --summary --apply test-patch
 bar |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename foo => bar (47%)

ok 2 - apply
expecting success: test -f bar && ls -l bar | grep "^-..x......"
-rwxr-xr-x  1 trast  staff  12 Jan  2 04:07 bar
ok 3 - validate
expecting success: git apply -R --index --stat --summary --apply test-patch &&
     test "$(cat foo)" = "This is foo"
 foo |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename bar => foo (47%)

ok 4 - apply reverse
expecting success: git apply --index --stat --summary --apply test-patch &&
     test "$(cat bar)" = "This is bar" -a "$(cat foo)" = "This is foo"
 bar |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 copy foo => bar (47%)

ok 5 - apply copy

# passed all 5 test(s)
1..5
