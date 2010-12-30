Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1011-read-tree-sparse-checkout/.git/
expecting success: 
	cat >expected <<-\EOF &&
	100644 77f0ba1734ed79d12881f81b36ee134de6a3327b 0	init.t
	100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0	sub/added
	100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0	subsub/added
	EOF
	cat >expected.swt <<-\EOF &&
	H init.t
	H sub/added
	H subsub/added
	EOF

	test_commit init &&
	echo modified >>init.t &&
	mkdir sub subsub &&
	touch sub/added subsub/added &&
	git add init.t sub/added subsub/added &&
	git commit -m "modified and added" &&
	git tag top &&
	git rm sub/added &&
	git commit -m removed &&
	git tag removed &&
	git checkout top &&
	git ls-files --stage >result &&
	test_cmp expected result
[master (root-commit) 2519212] init
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 init.t
[master a06c3d5] modified and added
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 sub/added
 create mode 100644 subsub/added
rm 'sub/added'
[master 388c946] removed
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 sub/added
ok 1 - setup

expecting success: 
	git read-tree -m -u HEAD &&
	git ls-files --stage >result &&
	test_cmp expected result &&
	git ls-files -t >result &&
	test_cmp expected.swt result

ok 2 - read-tree without .git/info/sparse-checkout

expecting success: 
	echo >.git/info/sparse-checkout &&
	git read-tree -m -u HEAD &&
	git ls-files -t >result &&
	test_cmp expected.swt result &&
	test -f init.t &&
	test -f sub/added

ok 3 - read-tree with .git/info/sparse-checkout but disabled

expecting success: 
	git config core.sparsecheckout true &&
	echo >.git/info/sparse-checkout &&
	git read-tree --no-sparse-checkout -m -u HEAD &&
	git ls-files -t >result &&
	test_cmp expected.swt result &&
	test -f init.t &&
	test -f sub/added

ok 4 - read-tree --no-sparse-checkout with empty .git/info/sparse-checkout and enabled

expecting success: 
	git config core.sparsecheckout true &&
	echo >.git/info/sparse-checkout &&
	test_must_fail git read-tree -m -u HEAD &&
	git ls-files --stage >result &&
	test_cmp expected result &&
	git ls-files -t >result &&
	test_cmp expected.swt result &&
	test -f init.t &&
	test -f sub/added
ok 5 - read-tree with empty .git/info/sparse-checkout
expecting success: 
	cat >expected.swt-noinit <<-\EOF &&
	S init.t
	H sub/added
	S subsub/added
	EOF

	echo sub/ > .git/info/sparse-checkout &&
	git read-tree -m -u HEAD &&
	git ls-files -t > result &&
	test_cmp expected.swt-noinit result &&
	test ! -f init.t &&
	test -f sub/added

ok 6 - match directories with trailing slash

expecting success: 
	echo sub >>.git/info/sparse-checkout &&
	git read-tree -m -u HEAD &&
	git ls-files -t >result &&
	test_cmp expected.swt-noinit result &&
	test ! -f init.t &&
	test -f sub/added

ok 7 - match directories without trailing slash

expecting success: 
	echo "s?b" >>.git/info/sparse-checkout &&
	git read-tree -m -u HEAD &&
	git ls-files -t >result &&
	test_cmp expected.swt-noinit result &&
	test ! -f init.t &&
	test -f sub/added

ok 8 - match directory pattern

expecting success: 
	cat >expected.swt-nosub <<-\EOF &&
	H init.t
	S sub/added
	S subsub/added
	EOF

	echo init.t >.git/info/sparse-checkout &&
	git read-tree -m -u HEAD &&
	git ls-files -t >result &&
	test_cmp expected.swt-nosub result &&
	test -f init.t &&
	test ! -f sub/added

ok 9 - checkout area changes

expecting success: 
	echo sub/added >.git/info/sparse-checkout &&
	git checkout -f top &&
	git read-tree -m -u HEAD^ &&
	test ! -f init.t
ok 10 - read-tree updates worktree, absent case

expecting success: 
	echo sub/added >.git/info/sparse-checkout &&
	git checkout -f top &&
	echo dirty >init.t &&
	git read-tree -m -u HEAD^ &&
	grep -q dirty init.t &&
	rm init.t
ok 11 - read-tree updates worktree, dirty case

expecting success: 
	echo init.t >.git/info/sparse-checkout &&
	git checkout -f top &&
	echo dirty >added &&
	git read-tree -m -u HEAD^ &&
	grep -q dirty added
ok 12 - read-tree removes worktree, dirty case

expecting success: 
	echo init.t >.git/info/sparse-checkout &&
	git checkout -f removed &&
	git read-tree -u -m HEAD^ &&
	test ! -f sub/added
ok 13 - read-tree adds to worktree, absent case

expecting success: 
	echo init.t >.git/info/sparse-checkout &&
	git checkout -f removed &&
	mkdir sub &&
	echo dirty >sub/added &&
	git read-tree -u -m HEAD^ &&
	grep -q dirty sub/added
ok 14 - read-tree adds to worktree, dirty case
expecting success: 
	>empty &&
	echo init.t >.git/info/sparse-checkout &&
	echo sub/added >>.git/info/sparse-checkout &&
	git checkout -f top &&
	echo init.t >.git/info/sparse-checkout &&
	git checkout removed &&
	git ls-files sub/added >result &&
	test ! -f sub/added &&
	test_cmp empty result
ok 15 - index removal and worktree narrowing at the same time

expecting success: 
	>empty &&
	echo init.t >.git/info/sparse-checkout &&
	git checkout -f top &&
	git reset --hard removed &&
	git ls-files sub/added >result &&
	test_cmp empty result
HEAD is now at 388c946 removed

ok 16 - read-tree --reset removes outside worktree

# passed all 16 test(s)
1..16
