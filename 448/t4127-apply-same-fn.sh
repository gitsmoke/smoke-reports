Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4127-apply-same-fn/.git/
expecting success: 
	for i in a b c d e f g h i j k l m
	do
		echo $i
	done >same_fn &&
	cp same_fn other_fn &&
	git add same_fn other_fn &&
	git commit -m initial
[master (root-commit) 56c29de] initial
 Author: A U Thor <author@example.com>
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 other_fn
 create mode 100644 same_fn

ok 1 - setup

expecting success: 
	modify "s/^d/z/" same_fn &&
	git diff > patch0 &&
	git add same_fn &&
	modify "s/^i/y/" same_fn &&
	git diff >> patch0 &&
	cp same_fn same_fn2 &&
	git reset --hard &&
	git apply patch0 &&
	test_cmp same_fn same_fn2
HEAD is now at 56c29de initial
ok 2 - apply same filename with independent changes
expecting success: 
	git reset --hard &&
	modify "s/^d/z/" same_fn &&
	git diff > patch0 &&
	git add same_fn &&
	modify "s/^e/y/" same_fn &&
	git diff >> patch0 &&
	cp same_fn same_fn2 &&
	git reset --hard &&
	git apply patch0 &&
	test_cmp same_fn same_fn2
HEAD is now at 56c29de initial
HEAD is now at 56c29de initial

ok 3 - apply same filename with overlapping changes

expecting success: 
	git reset --hard &&
	git mv same_fn new_fn &&
	modify "s/^d/z/" new_fn &&
	git add new_fn &&
	git diff -M --cached > patch1 &&
	modify "s/^e/y/" new_fn &&
	git diff >> patch1 &&
	cp new_fn new_fn2 &&
	git reset --hard &&
	git apply --index patch1 &&
	test_cmp new_fn new_fn2
HEAD is now at 56c29de initial
HEAD is now at 56c29de initial

ok 4 - apply same new filename after rename

expecting success: 
	git reset --hard &&
	git mv same_fn new_fn &&
	modify "s/^d/z/" new_fn &&
	git add new_fn &&
	git diff -M --cached > patch1 &&
	git mv new_fn same_fn &&
	modify "s/^e/y/" same_fn &&
	git diff >> patch1 &&
	git reset --hard &&
	test_must_fail git apply patch1
HEAD is now at 56c29de initial
HEAD is now at 56c29de initial

ok 5 - apply same old filename after rename -- should fail.

expecting success: 
	git reset --hard &&
	git mv same_fn new_fn &&
	modify "s/^d/z/" new_fn &&
	git add new_fn &&
	git diff -M --cached > patch1 &&
	git commit -m "a rename" &&
	git mv other_fn same_fn &&
	modify "s/^e/y/" same_fn &&
	git add same_fn &&
	git diff -M --cached >> patch1 &&
	modify "s/^g/x/" same_fn &&
	git diff >> patch1 &&
	git reset --hard HEAD^ &&
	git apply patch1
HEAD is now at 56c29de initial
[master 6f99e8e] a rename
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename same_fn => new_fn (92%)
HEAD is now at 56c29de initial

ok 6 - apply A->B (rename), C->A (rename), A->A -- should pass.

# passed all 6 test(s)
1..6
