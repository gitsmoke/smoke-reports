Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3502-cherry-pick-merge/.git/
expecting success: 

	>A &&
	>B &&
	git add A B &&
	git commit -m "Initial" &&
	git tag initial &&
	git branch side &&
	echo new line >A &&
	git commit -m "add line to A" A &&
	git tag a &&
	git checkout side &&
	echo new line >B &&
	git commit -m "add line to B" B &&
	git tag b &&
	git checkout master &&
	git merge side &&
	git tag c


[master (root-commit) 6d05686] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 A
 create mode 100644 B
[master df36025] add line to A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[side 660fb8e] add line to B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
df36025 add line to A
virtual side
found 1 common ancestor(s):
6d05686 Initial
Merge made by recursive.
 B |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git reset --hard &&
	git checkout a^0 &&
	test_must_fail git cherry-pick -m 1 b &&
	git diff --exit-code a --


HEAD is now at ba803ae Merge branch 'side'

ok 2 - cherry-pick a non-merge with -m should fail

expecting success: 

	git reset --hard &&
	git checkout a^0 &&
	test_must_fail git cherry-pick c &&
	git diff --exit-code a --


HEAD is now at df36025 add line to A

ok 3 - cherry pick a merge without -m should fail

expecting success: 

	git reset --hard &&
	git checkout a^0 &&
	git cherry-pick -m 1 c &&
	git diff --exit-code c


HEAD is now at df36025 add line to A
[detached HEAD 934af00] Merge branch 'side'
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - cherry pick a merge (1)

expecting success: 

	git reset --hard &&
	git checkout b^0 &&
	git cherry-pick -m 2 c &&
	git diff --exit-code c


HEAD is now at 934af00 Merge branch 'side'
[detached HEAD fc94e63] Merge branch 'side'
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - cherry pick a merge (2)

expecting success: 

	git reset --hard &&
	git checkout b^0 &&
	test_must_fail git cherry-pick -m 3 c


HEAD is now at fc94e63 Merge branch 'side'

ok 6 - cherry pick a merge relative to nonexistent parent should fail

expecting success: 

	git reset --hard &&
	git checkout c^0 &&
	test_must_fail git revert -m 1 b &&
	git diff --exit-code c


HEAD is now at 660fb8e add line to B

ok 7 - revert a non-merge with -m should fail

expecting success: 

	git reset --hard &&
	git checkout c^0 &&
	test_must_fail git revert c &&
	git diff --exit-code c


HEAD is now at ba803ae Merge branch 'side'

ok 8 - revert a merge without -m should fail

expecting success: 

	git reset --hard &&
	git checkout c^0 &&
	git revert -m 1 c &&
	git diff --exit-code a --


HEAD is now at ba803ae Merge branch 'side'
[detached HEAD 6244331] Revert "Merge branch 'side'"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)

ok 9 - revert a merge (1)

expecting success: 

	git reset --hard &&
	git checkout c^0 &&
	git revert -m 2 c &&
	git diff --exit-code b --


HEAD is now at 6244331 Revert "Merge branch 'side'"
[detached HEAD 94e7f08] Revert "Merge branch 'side'"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)

ok 10 - revert a merge (2)

expecting success: 

	git reset --hard &&
	git checkout c^0 &&
	test_must_fail git revert -m 3 c &&
	git diff --exit-code c


HEAD is now at 94e7f08 Revert "Merge branch 'side'"

ok 11 - revert a merge relative to nonexistent parent should fail

# passed all 11 test(s)
1..11
