Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3506-cherry-pick-ff/.git/
expecting success: 
	echo first > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m "first" &&
	git tag first &&

	git checkout -b other &&
	echo second >> file1 &&
	git add file1 &&
	test_tick &&
	git commit -m "second" &&
	git tag second

[master (root-commit) 0c72e4f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[other 453a047] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	git checkout master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick --ff second &&
	test "$(git rev-parse --verify HEAD)" = "$(git rev-parse --verify second)"

HEAD is now at 0c72e4f first

ok 2 - cherry-pick using --ff fast forwards

expecting success: 
	git checkout master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick second &&
	test "$(git rev-parse --verify HEAD)" != "$(git rev-parse --verify second)"

HEAD is now at 0c72e4f first
[master 43e4ff7] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - cherry-pick not using --ff does not fast forwards

expecting success: 
	git checkout master &&
	git reset --hard first &&
	echo new line >A &&
	git add A &&
	test_tick &&
	git commit -m "add line to A" A &&
	git tag A &&
	git checkout -b side first &&
	echo new line >B &&
	git add B &&
	test_tick &&
	git commit -m "add line to B" B &&
	git tag B &&
	git checkout master &&
	git merge side &&
	git tag C &&
	git checkout -b new A
HEAD is now at 0c72e4f first
[master e3ca70e] add line to A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[side 5faaf2e] add line to B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
Merging:
e3ca70e add line to A
virtual side
found 1 common ancestor(s):
0c72e4f first
Merge made by recursive.
 B |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
ok 4 - merge setup

expecting success: 
	git reset --hard A -- &&
	test_must_fail git cherry-pick --ff -m 1 B &&
	git diff --exit-code A --
HEAD is now at e3ca70e add line to A

ok 5 - cherry-pick a non-merge with --ff and -m should fail

expecting success: 
	git reset --hard A -- &&
	test_must_fail git cherry-pick --ff C &&
	git diff --exit-code A --

HEAD is now at e3ca70e add line to A

ok 6 - cherry pick a merge with --ff but without -m should fail

expecting success: 
	git reset --hard A -- &&
	git cherry-pick --ff -m 1 C &&
	git diff --exit-code C &&
	test "$(git rev-parse --verify HEAD)" = "$(git rev-parse --verify C)"

HEAD is now at e3ca70e add line to A

ok 7 - cherry pick with --ff a merge (1)

expecting success: 
	git reset --hard B -- &&
	git cherry-pick --ff -m 2 C &&
	git diff --exit-code C &&
	test "$(git rev-parse --verify HEAD)" = "$(git rev-parse --verify C)"

HEAD is now at 5faaf2e add line to B
ok 8 - cherry pick with --ff a merge (2)
expecting success: 
	git reset --hard B -- &&
	test_must_fail git cherry-pick --ff -m 3 C
HEAD is now at 5faaf2e add line to B

ok 9 - cherry pick a merge relative to nonexistent parent with --ff should fail

expecting success: 
	git reset --hard first -- &&
	git rm file1 &&
	echo first >file2 &&
	git add file2 &&
	git commit --amend -m "file2" &&
	git cherry-pick --ff first &&
	test "$(git rev-parse --verify HEAD)" = "1df192cd8bc58a2b275d842cede4d221ad9000d1"

HEAD is now at 0c72e4f first
rm 'file1'
[new 1654ff9] file2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[new 1df192c] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 10 - cherry pick a root commit with --ff

# passed all 10 test(s)
1..10
