ok 1 - setup
ok 2 - read-tree without .git/info/sparse-checkout
ok 3 - read-tree with .git/info/sparse-checkout but disabled
ok 4 - read-tree --no-sparse-checkout with empty .git/info/sparse-checkout and enabled
ok 5 - read-tree with empty .git/info/sparse-checkout
ok 6 - match directories with trailing slash
not ok 7 - match directories without trailing slash # TODO known breakage
ok 8 - checkout area changes
ok 9 - read-tree updates worktree, absent case
ok 10 - read-tree updates worktree, dirty case
ok 11 - read-tree removes worktree, dirty case
ok 12 - read-tree adds to worktree, absent case
ok 13 - read-tree adds to worktree, dirty case
ok 14 - index removal and worktree narrowing at the same time
not ok - 15 read-tree --reset removes outside worktree
#	
#		>empty &&
#		echo init.t >.git/info/sparse-checkout &&
#		git checkout -f top &&
#		git reset --hard removed &&
#		git ls-files sub/added >result &&
#		test_cmp empty result
#	
# still have 1 known breakage(s)
# failed 1 among remaining 14 test(s)
1..15
