Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7601-merge-pull-config/.git/
expecting success: 
	echo c0 >c0.c &&
	git add c0.c &&
	git commit -m c0 &&
	git tag c0 &&
	echo c1 >c1.c &&
	git add c1.c &&
	git commit -m c1 &&
	git tag c1 &&
	git reset --hard c0 &&
	echo c2 >c2.c &&
	git add c2.c &&
	git commit -m c2 &&
	git tag c2 &&
	git reset --hard c0 &&
	echo c3 >c3.c &&
	git add c3.c &&
	git commit -m c3 &&
	git tag c3
[master (root-commit) fc5ba59] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master 186c024] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
HEAD is now at fc5ba59 c0
[master 119ea97] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
HEAD is now at fc5ba59 c0
[master d6441c8] c3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c3.c

ok 1 - setup
expecting success: 
	git reset --hard c1 &&
	test -f c0.c &&
	test -f c1.c &&
	test ! -f c2.c &&
	test ! -f c3.c &&
	git merge c2 &&
	test -f c1.c &&
	test -f c2.c
HEAD is now at 186c024 c1
Merging:
186c024 c1
virtual c2
found 1 common ancestor(s):
fc5ba59 c0
Merge made by recursive.
 c2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
ok 2 - merge c1 with c2
expecting success: 
	git reset --hard c1 &&
	git config pull.twohead ours &&
	git merge c2 &&
	test -f c1.c &&
	! test -f c2.c
HEAD is now at 186c024 c1
Merge made by ours.

ok 3 - merge c1 with c2 (ours in pull.twohead)

expecting success: 
	git reset --hard c1 &&
	git config pull.octopus "recursive" &&
	test_must_fail git merge c2 c3 &&
	test "$(git rev-parse c1)" = "$(git rev-parse HEAD)"
HEAD is now at 186c024 c1
ok 4 - merge c1 with c2 and c3 (recursive in pull.octopus)
expecting success: 
	git reset --hard c1 &&
	git config pull.octopus "recursive octopus" &&
	git merge c2 c3 &&
	test "$(git rev-parse c1)" != "$(git rev-parse HEAD)" &&
	test "$(git rev-parse c1)" = "$(git rev-parse HEAD^1)" &&
	test "$(git rev-parse c2)" = "$(git rev-parse HEAD^2)" &&
	test "$(git rev-parse c3)" = "$(git rev-parse HEAD^3)" &&
	git diff --exit-code &&
	test -f c0.c &&
	test -f c1.c &&
	test -f c2.c &&
	test -f c3.c
HEAD is now at 186c024 c1
Trying merge strategy recursive...
Rewinding the tree to pristine...
Trying merge strategy octopus...
Trying simple merge with c2
Trying simple merge with c3
Merge made by octopus.
 c2.c |    1 +
 c3.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
 create mode 100644 c3.c

ok 5 - merge c1 with c2 and c3 (recursive and octopus in pull.octopus)
expecting success: 
	git reset --hard c0 &&
	echo A >conflict.c &&
	git add conflict.c &&
	echo contents >foo.c &&
	git add foo.c &&
	git commit -m c4 &&
	git tag c4 &&
	echo B >conflict.c &&
	git add conflict.c &&
	git mv foo.c bar.c &&
	git commit -m c5 &&
	git tag c5 &&
	git reset --hard c4 &&
	echo C >conflict.c &&
	git add conflict.c &&
	echo secondline >> foo.c &&
	git add foo.c &&
	git commit -m c6 &&
	git tag c6
HEAD is now at fc5ba59 c0
[master 319c6fc] c4
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 conflict.c
 create mode 100644 foo.c
[master e9371cd] c5
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename foo.c => bar.c (100%)
HEAD is now at 319c6fc c4
[master adbc227] c6
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)

ok 6 - setup conflicted merge
expecting success: 
	git config --unset-all pull.twohead &&
	git reset --hard c5 &&
	test_must_fail git merge -s resolve c6 &&
	resolve_count=$(conflict_count) &&
	git reset --hard c5 &&
	test_must_fail git merge -s recursive c6 &&
	recursive_count=$(conflict_count) &&
	git reset --hard c5 &&
	test_must_fail git merge -s recursive -s resolve c6 &&
	auto_count=$(conflict_count) &&
	test $auto_count = $recursive_count &&
	test $auto_count != $resolve_count
HEAD is now at e9371cd c5
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Auto-merging conflict.c
ERROR: content conflict in conflict.c
ERROR: foo.c: Not handling case 12f00e90b6ef79117ce6e650416b8cf517099b78 ->  -> f09d25f6fef310fe4501c2b3ad8106df35603251
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at e9371cd c5
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Auto-merging bar.c
Auto-merging conflict.c
CONFLICT (content): Merge conflict in conflict.c
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at e9371cd c5
Trying merge strategy recursive...
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Auto-merging bar.c
Auto-merging conflict.c
CONFLICT (content): Merge conflict in conflict.c
Rewinding the tree to pristine...
Trying merge strategy resolve...
conflict.c: needs merge
conflict.c: needs merge
Rewinding the tree to pristine...
Using the recursive to prepare resolving by hand.
conflict.c: needs merge
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Aborting

ok 7 - merge picks up the best result

expecting success: 
	git config pull.twohead "recursive resolve" &&
	git reset --hard c5 &&
	test_must_fail git merge -s resolve c6 &&
	resolve_count=$(conflict_count) &&
	git reset --hard c5 &&
	test_must_fail git merge -s recursive c6 &&
	recursive_count=$(conflict_count) &&
	git reset --hard c5 &&
	test_must_fail git merge c6 &&
	auto_count=$(conflict_count) &&
	test $auto_count = $recursive_count &&
	test $auto_count != $resolve_count
HEAD is now at e9371cd c5
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Auto-merging conflict.c
ERROR: content conflict in conflict.c
ERROR: foo.c: Not handling case 12f00e90b6ef79117ce6e650416b8cf517099b78 ->  -> f09d25f6fef310fe4501c2b3ad8106df35603251
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at e9371cd c5
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Auto-merging bar.c
Auto-merging conflict.c
CONFLICT (content): Merge conflict in conflict.c
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at e9371cd c5
Trying merge strategy recursive...
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Auto-merging bar.c
Auto-merging conflict.c
CONFLICT (content): Merge conflict in conflict.c
Rewinding the tree to pristine...
Trying merge strategy resolve...
conflict.c: needs merge
conflict.c: needs merge
Rewinding the tree to pristine...
Using the recursive to prepare resolving by hand.
conflict.c: needs merge
Merging:
e9371cd c5
virtual c6
found 1 common ancestor(s):
319c6fc c4
Aborting

ok 8 - merge picks up the best result (from config)

expecting success: 
	git config pull.twohead "foobar" &&
	git reset --hard c5 &&
	test_must_fail git merge c6
HEAD is now at e9371cd c5
ok 9 - merge errors out on invalid strategy
expecting success: 
	git config --unset-all pull.twohead &&
	git reset --hard c5 &&
	test_must_fail git merge -s "resolve recursive" c6
HEAD is now at e9371cd c5
ok 10 - merge errors out on invalid strategy

# passed all 10 test(s)
1..10
