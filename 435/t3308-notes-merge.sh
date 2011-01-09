Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3308-notes-merge/.git/
expecting success: 
	test_commit 1st &&
	test_commit 2nd &&
	test_commit 3rd &&
	test_commit 4th &&
	test_commit 5th &&
	# Create notes on 4 first commits
	git config core.notesRef refs/notes/x &&
	git notes add -m "Notes on 1st commit" 1st &&
	git notes add -m "Notes on 2nd commit" 2nd &&
	git notes add -m "Notes on 3rd commit" 3rd &&
	git notes add -m "Notes on 4th commit" 4th
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

ok 1 - setup
expecting success: 
	verify_notes x

ok 2 - verify initial notes (x)
expecting success: 
	test_must_fail git -c "core.notesRef=refs/notes/y" notes merge z
ok 3 - fail to merge empty notes ref into empty notes ref (z => y)
expecting success: 
	test_must_fail git -c "core.notesRef=refs/notes" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/notes/" notes merge x &&
	mkdir -p .git/refs/notes/dir &&
	test_must_fail git -c "core.notesRef=refs/notes/dir" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/notes/dir/" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/heads/master" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/notes/y:" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/notes/y:foo" notes merge x &&
	test_must_fail git -c "core.notesRef=refs/notes/foo^{bar" notes merge x
ok 4 - fail to merge into various non-notes refs

expecting success: 
	git config core.notesRef refs/notes/y &&
	test_must_fail git notes merge refs/notes &&
	test_must_fail git notes merge refs/notes/ &&
	test_must_fail git notes merge refs/notes/dir &&
	test_must_fail git notes merge refs/notes/dir/ &&
	test_must_fail git notes merge refs/heads/master &&
	test_must_fail git notes merge x: &&
	test_must_fail git notes merge x:foo &&
	test_must_fail git notes merge foo^{bar
ok 5 - fail to merge various non-note-trees

expecting success: 
	git config core.notesRef refs/notes/y &&
	git notes merge x &&
	verify_notes y &&
	# x and y should point to the same notes commit
	test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"

ok 6 - merge notes into empty notes ref (x => y)

expecting success: 
	git notes merge z &&
	# y should not change (still == x)
	test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"

ok 7 - merge empty notes ref (z => y)

expecting success: 
	# Not touching notes to 1st commit
	git notes remove 2nd &&
	git notes append -m "More notes on 3rd commit" 3rd &&
	git notes add -f -m "New notes on 4th commit" 4th &&
	git notes add -m "Notes on 5th commit" 5th
ok 8 - change notes on other notes ref (y)
expecting success: 
	pre_state="$(git rev-parse refs/notes/y)" &&
	git notes merge y^ &&
	# y should not move
	test "$pre_state" = "$(git rev-parse refs/notes/y)"
Already up-to-date!
ok 9 - merge previous notes commit (y^ => y) => No-op
expecting success: 
	verify_notes y

ok 10 - verify changed notes on other notes ref (y)

expecting success: 
	verify_notes x


ok 11 - verify unchanged notes on original notes ref (x)

expecting success: 
	git notes merge -vvv x &&
	verify_notes y &&
	verify_notes x
One merge base found (bf2877f)
Merging remote commit bf2877f into local commit 21b8c5e with merge-base bf2877f
Already up-to-date!

ok 12 - merge original notes (x) into changed notes (y) => No-op
expecting success: 
	git config core.notesRef refs/notes/x &&
	git notes merge y &&
	verify_notes x &&
	verify_notes y &&
	# x and y should point to same the notes commit
	test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"
Fast-forward

ok 13 - merge changed (y) into original (x) => Fast-forward
expecting success: 
	# Prepare empty (but valid) notes ref (z)
	git config core.notesRef refs/notes/z &&
	git notes add -m "foo" &&
	git notes remove &&
	git notes >output_notes_z &&
	test_cmp /dev/null output_notes_z &&
	# Do the merge (z => y)
	git config core.notesRef refs/notes/y &&
	git notes merge z &&
	verify_notes y &&
	# y should no longer point to the same notes commit as x
	test "$(git rev-parse refs/notes/x)" != "$(git rev-parse refs/notes/y)"
ok 14 - merge empty notes ref (z => y)
expecting success: 
	# Append to 1st commit notes
	git notes append -m "More notes on 1st commit" 1st &&
	# Add new notes to 2nd commit
	git notes add -m "New notes on 2nd commit" 2nd &&
	verify_notes y

ok 15 - change notes on other notes ref (y)
expecting success: 
	git config core.notesRef refs/notes/x &&
	git notes remove 3rd &&
	git notes append -m "More notes on 4th commit" 4th &&
	verify_notes x
ok 16 - change notes on notes ref (x)
expecting success: 
	git notes merge y &&
	verify_notes x &&
	verify_notes y

ok 17 - merge y into x => Non-conflicting 3-way merge
expecting success: 
	git config core.notesRef refs/notes/w &&
	# Add same note as refs/notes/y on 2nd commit
	git notes add -m "New notes on 2nd commit" 2nd &&
	# Add new note on 3rd commit (non-conflicting)
	git notes add -m "New notes on 3rd commit" 3rd &&
	# Verify state of notes on new, separate notes ref (w)
	verify_notes w

ok 18 - create notes on new, separate notes ref (w)
expecting success: 
	git config core.notesRef refs/notes/x &&
	git notes merge w &&
	# Verify new state of notes on other notes ref (x)
	verify_notes x &&
	# Also verify that nothing changed on other notes refs (y and w)
	verify_notes y &&
	verify_notes w


ok 19 - merge w into x => Non-conflicting history-less merge

# passed all 19 test(s)
1..19
