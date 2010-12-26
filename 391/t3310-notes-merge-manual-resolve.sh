Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3310-notes-merge-manual-resolve/.git/
expecting success: 
	test_commit 1st &&
	test_commit 2nd &&
	test_commit 3rd &&
	test_commit 4th &&
	test_commit 5th

[master (root-commit) 04ed9a0] 1st
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1st.t
[master 7a4ca6e] 2nd
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2nd.t
[master d07d62e] 3rd
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 3rd.t
[master 0f7aa3e] 4th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 4th.t
[master 7f9ad88] 5th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 5th.t

ok 1 - setup commits
expecting success: 
	git config core.notesRef refs/notes/x &&
	git notes add -m "x notes on 2nd commit" 2nd &&
	git notes add -m "x notes on 3rd commit" 3rd &&
	git notes add -m "x notes on 4th commit" 4th &&
	verify_notes x

ok 2 - setup merge base (x)
expecting success: 
	git update-ref refs/notes/y refs/notes/x &&
	git config core.notesRef refs/notes/y &&
	git notes add -f -m "y notes on 1st commit" 1st &&
	git notes remove 2nd &&
	git notes add -f -m "y notes on 3rd commit" 3rd &&
	git notes add -f -m "y notes on 4th commit" 4th &&
	verify_notes y

ok 3 - setup local branch (y)
expecting success: 
	git update-ref refs/notes/z refs/notes/x &&
	git config core.notesRef refs/notes/z &&
	git notes add -f -m "z notes on 1st commit" 1st &&
	git notes add -f -m "z notes on 2nd commit" 2nd &&
	git notes remove 3rd &&
	git notes add -f -m "z notes on 4th commit" 4th &&
	verify_notes z
ok 4 - setup remote branch (z)
expecting success: 
	git update-ref refs/notes/m refs/notes/y &&
	git config core.notesRef refs/notes/m &&
	test_must_fail git notes merge z >output &&
	# Output should point to where to resolve conflicts
	grep -q "\.git/NOTES_MERGE_WORKTREE" output &&
	# Inspect merge conflicts
	ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
	test_cmp expect_conflicts output_conflicts &&
	( for f in $(cat expect_conflicts); do
		test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
		exit 1
	done ) &&
	# Verify that current notes tree (pre-merge) has not changed (m == y)
	verify_notes y &&
	verify_notes m &&
	test "$(git rev-parse refs/notes/m)" = "$(cat pre_merge_y)"

ok 5 - merge z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
expecting success: 
	git notes --ref z append -m "More z notes on 4th commit" 4th &&
	verify_notes z

ok 6 - change notes in z

expecting success: 
	test -d .git/NOTES_MERGE_WORKTREE &&
	test_must_fail git notes merge z >output 2>&1 &&
	# Output should indicate what is wrong
	grep -q "\.git/NOTES_MERGE_\* exists" output

ok 7 - cannot do merge w/conflicts when previous merge is unfinished
expecting success: 
	git config core.notesRef refs/notes/w &&
	git notes add -m "w notes on 1st commit" 1st &&
	git notes add -m "x notes on 2nd commit" 2nd &&
	verify_notes w

ok 8 - setup unrelated notes ref (w)
expecting success: 
	test -d .git/NOTES_MERGE_WORKTREE &&
	git notes merge x &&
	verify_notes w &&
	# Verify that other notes refs has not changed (x and y)
	verify_notes x &&
	verify_notes y

ok 9 - can do merge without conflicts even if previous merge is unfinished (x => w)
expecting success: 
	# Resolve conflicts and finalize merge
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha1 <<EOF &&
y and z notes on 1st commit
EOF
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha4 <<EOF &&
y and z notes on 4th commit
EOF
	git notes merge --commit &&
	# No .git/NOTES_MERGE_* files left
	test_must_fail ls .git/NOTES_MERGE_* >output 2>/dev/null &&
	test_cmp /dev/null output &&
	# Merge commit has pre-merge y and pre-merge z as parents
	test "$(git rev-parse refs/notes/m^1)" = "$(cat pre_merge_y)" &&
	test "$(git rev-parse refs/notes/m^2)" = "$(cat pre_merge_z)" &&
	# Merge commit mentions the notes refs merged
	git log -1 --format=%B refs/notes/m > merge_commit_msg &&
	grep -q refs/notes/m merge_commit_msg &&
	grep -q refs/notes/z merge_commit_msg &&
	# Merge commit mentions conflicting notes
	grep -q "Conflicts" merge_commit_msg &&
	( for sha1 in $(cat expect_conflicts); do
		grep -q "$sha1" merge_commit_msg ||
		exit 1
	done ) &&
	# Verify contents of merge result
	verify_notes m &&
	# Verify that other notes refs has not changed (w, x, y and z)
	verify_notes w &&
	verify_notes x &&
	verify_notes y &&
	verify_notes z

ok 10 - finalize conflicting merge (z => m)
expecting success: 
	git update-ref refs/notes/m refs/notes/y &&
	git config core.notesRef refs/notes/m &&
	test_must_fail git notes merge z >output &&
	# Output should point to where to resolve conflicts
	grep -q "\.git/NOTES_MERGE_WORKTREE" output &&
	# Inspect merge conflicts
	ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
	test_cmp expect_conflicts output_conflicts &&
	( for f in $(cat expect_conflicts); do
		test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
		exit 1
	done ) &&
	# Verify that current notes tree (pre-merge) has not changed (m == y)
	verify_notes y &&
	verify_notes m &&
	test "$(git rev-parse refs/notes/m)" = "$(cat pre_merge_y)"

ok 11 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge

expecting success: 
	git notes merge --abort &&
	# No .git/NOTES_MERGE_* files left
	test_must_fail ls .git/NOTES_MERGE_* >output 2>/dev/null &&
	test_cmp /dev/null output &&
	# m has not moved (still == y)
	test "$(git rev-parse refs/notes/m)" = "$(cat pre_merge_y)"
	# Verify that other notes refs has not changed (w, x, y and z)
	verify_notes w &&
	verify_notes x &&
	verify_notes y &&
	verify_notes z

ok 12 - abort notes merge
expecting success: 
	test_must_fail git notes merge z >output &&
	# Output should point to where to resolve conflicts
	grep -q "\.git/NOTES_MERGE_WORKTREE" output &&
	# Inspect merge conflicts
	ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
	test_cmp expect_conflicts output_conflicts &&
	( for f in $(cat expect_conflicts); do
		test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
		exit 1
	done ) &&
	# Verify that current notes tree (pre-merge) has not changed (m == y)
	verify_notes y &&
	verify_notes m &&
	test "$(git rev-parse refs/notes/m)" = "$(cat pre_merge_y)"

ok 13 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge
expecting success: 
	# Resolve one conflict
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha1 <<EOF &&
y and z notes on 1st commit
EOF
	# Remove another conflict
	rm .git/NOTES_MERGE_WORKTREE/$commit_sha4 &&
	# Remove a D/F conflict
	rm .git/NOTES_MERGE_WORKTREE/$commit_sha3 &&
	# Add a new note
	echo "new note on 5th commit" > .git/NOTES_MERGE_WORKTREE/$commit_sha5 &&
	# Finalize merge
	git notes merge --commit &&
	# No .git/NOTES_MERGE_* files left
	test_must_fail ls .git/NOTES_MERGE_* >output 2>/dev/null &&
	test_cmp /dev/null output &&
	# Merge commit has pre-merge y and pre-merge z as parents
	test "$(git rev-parse refs/notes/m^1)" = "$(cat pre_merge_y)" &&
	test "$(git rev-parse refs/notes/m^2)" = "$(cat pre_merge_z)" &&
	# Merge commit mentions the notes refs merged
	git log -1 --format=%B refs/notes/m > merge_commit_msg &&
	grep -q refs/notes/m merge_commit_msg &&
	grep -q refs/notes/z merge_commit_msg &&
	# Merge commit mentions conflicting notes
	grep -q "Conflicts" merge_commit_msg &&
	( for sha1 in $(cat expect_conflicts); do
		grep -q "$sha1" merge_commit_msg ||
		exit 1
	done ) &&
	# Verify contents of merge result
	verify_notes m &&
	# Verify that other notes refs has not changed (w, x, y and z)
	verify_notes w &&
	verify_notes x &&
	verify_notes y &&
	verify_notes z

ok 14 - add + remove notes in finalized merge (z => m)
expecting success: 
	git update-ref refs/notes/m refs/notes/y &&
	test_must_fail git notes merge z >output &&
	# Output should point to where to resolve conflicts
	grep -q "\.git/NOTES_MERGE_WORKTREE" output &&
	# Inspect merge conflicts
	ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
	test_cmp expect_conflicts output_conflicts &&
	( for f in $(cat expect_conflicts); do
		test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
		exit 1
	done ) &&
	# Verify that current notes tree (pre-merge) has not changed (m == y)
	verify_notes y &&
	verify_notes m &&
	test "$(git rev-parse refs/notes/m)" = "$(cat pre_merge_y)"

ok 15 - redo merge of z into m (== y) with default ("manual") resolver => Conflicting 3-way merge

expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	verify_notes m &&
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/w)"

ok 16 - reset notes ref m to somewhere else (w)

expecting success: 
	# Resolve conflicts
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha1 <<EOF &&
y and z notes on 1st commit
EOF
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha4 <<EOF &&
y and z notes on 4th commit
EOF
	# Fail to finalize merge
	test_must_fail git notes merge --commit >output 2>&1 &&
	# .git/NOTES_MERGE_* must remain
	test -f .git/NOTES_MERGE_PARTIAL &&
	test -f .git/NOTES_MERGE_REF &&
	test -f .git/NOTES_MERGE_WORKTREE/$commit_sha1 &&
	test -f .git/NOTES_MERGE_WORKTREE/$commit_sha2 &&
	test -f .git/NOTES_MERGE_WORKTREE/$commit_sha3 &&
	test -f .git/NOTES_MERGE_WORKTREE/$commit_sha4 &&
	# Refs are unchanged
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/w)"
	test "$(git rev-parse refs/notes/y)" = "$(git rev-parse NOTES_MERGE_PARTIAL^1)"
	test "$(git rev-parse refs/notes/m)" != "$(git rev-parse NOTES_MERGE_PARTIAL^1)"
	# Mention refs/notes/m, and its current and expected value in output
	grep -q "refs/notes/m" output &&
	grep -q "$(git rev-parse refs/notes/m)" output &&
	grep -q "$(git rev-parse NOTES_MERGE_PARTIAL^1)" output &&
	# Verify that other notes refs has not changed (w, x, y and z)
	verify_notes w &&
	verify_notes x &&
	verify_notes y &&
	verify_notes z

ok 17 - fail to finalize conflicting merge if underlying ref has moved in the meantime (m != NOTES_MERGE_PARTIAL^1)

expecting success: 
	git notes merge --abort &&
	# No .git/NOTES_MERGE_* files left
	test_must_fail ls .git/NOTES_MERGE_* >output 2>/dev/null &&
	test_cmp /dev/null output &&
	# m has not moved (still == w)
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/w)"
	# Verify that other notes refs has not changed (w, x, y and z)
	verify_notes w &&
	verify_notes x &&
	verify_notes y &&
	verify_notes z

ok 18 - resolve situation by aborting the notes merge

# passed all 18 test(s)
1..18
