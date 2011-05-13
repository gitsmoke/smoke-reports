ok 1 - setup
ok 2 - read-tree without .git/info/sparse-checkout
ok 3 - read-tree with .git/info/sparse-checkout but disabled
ok 4 - read-tree --no-sparse-checkout with empty .git/info/sparse-checkout and enabled
ok 5 - read-tree with empty .git/info/sparse-checkout
ok 6 - match directories with trailing slash
ok 7 - match directories without trailing slash
ok 8 - match directories with negated patterns
ok 9 - match directories with negated patterns (2)
ok 10 - match directory pattern
ok 11 - checkout area changes
ok 12 - read-tree updates worktree, absent case
ok 13 - read-tree updates worktree, dirty case
ok 14 - read-tree removes worktree, dirty case
ok 15 - read-tree adds to worktree, absent case
ok 16 - read-tree adds to worktree, dirty case
ok 17 - index removal and worktree narrowing at the same time
ok 18 - read-tree --reset removes outside worktree
# passed all 18 test(s)
1..18
