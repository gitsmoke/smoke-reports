ok 1 - setup
ok 2 - verify initial notes (x)
ok 3 - fail to merge empty notes ref into empty notes ref (z => y)
ok 4 - fail to merge into various non-notes refs
ok 5 - fail to merge various non-note-trees
not ok - 6 merge notes into empty notes ref (x => y)
#	
#		git config core.notesRef refs/notes/y &&
#		git notes merge x &&
#		verify_notes y &&
#		# x and y should point to the same notes commit
#		test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"
#	
not ok - 7 merge empty notes ref (z => y)
#	
#		git notes merge z &&
#		# y should not change (still == x)
#		test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"
#	
not ok - 8 change notes on other notes ref (y)
#	
#		# Not touching notes to 1st commit
#		git notes remove 2nd &&
#		git notes append -m "More notes on 3rd commit" 3rd &&
#		git notes add -f -m "New notes on 4th commit" 4th &&
#		git notes add -m "Notes on 5th commit" 5th
#	
not ok - 9 merge previous notes commit (y^ => y) => No-op
#	
#		pre_state="$(git rev-parse refs/notes/y)" &&
#		git notes merge y^ &&
#		# y should not move
#		test "$pre_state" = "$(git rev-parse refs/notes/y)"
#	
not ok - 10 verify changed notes on other notes ref (y)
#	
#		verify_notes y
#	
ok 11 - verify unchanged notes on original notes ref (x)
not ok - 12 merge original notes (x) into changed notes (y) => No-op
#	
#		git notes merge -vvv x &&
#		verify_notes y &&
#		verify_notes x
#	
not ok - 13 merge changed (y) into original (x) => Fast-forward
#	
#		git config core.notesRef refs/notes/x &&
#		git notes merge y &&
#		verify_notes x &&
#		verify_notes y &&
#		# x and y should point to same the notes commit
#		test "$(git rev-parse refs/notes/x)" = "$(git rev-parse refs/notes/y)"
#	
not ok - 14 merge empty notes ref (z => y)
#	
#		# Prepare empty (but valid) notes ref (z)
#		git config core.notesRef refs/notes/z &&
#		git notes add -m "foo" &&
#		git notes remove &&
#		git notes >output_notes_z &&
#		test_cmp /dev/null output_notes_z &&
#		# Do the merge (z => y)
#		git config core.notesRef refs/notes/y &&
#		git notes merge z &&
#		verify_notes y &&
#		# y should no longer point to the same notes commit as x
#		test "$(git rev-parse refs/notes/x)" != "$(git rev-parse refs/notes/y)"
#	
not ok - 15 change notes on other notes ref (y)
#	
#		# Append to 1st commit notes
#		git notes append -m "More notes on 1st commit" 1st &&
#		# Add new notes to 2nd commit
#		git notes add -m "New notes on 2nd commit" 2nd &&
#		verify_notes y
#	
not ok - 16 change notes on notes ref (x)
#	
#		git config core.notesRef refs/notes/x &&
#		git notes remove 3rd &&
#		git notes append -m "More notes on 4th commit" 4th &&
#		verify_notes x
#	
not ok - 17 merge y into x => Non-conflicting 3-way merge
#	
#		git notes merge y &&
#		verify_notes x &&
#		verify_notes y
#	
ok 18 - create notes on new, separate notes ref (w)
not ok - 19 merge w into x => Non-conflicting history-less merge
#	
#		git config core.notesRef refs/notes/x &&
#		git notes merge w &&
#		# Verify new state of notes on other notes ref (x)
#		verify_notes x &&
#		# Also verify that nothing changed on other notes refs (y and w)
#		verify_notes y &&
#		verify_notes w
#	
# failed 12 among 19 test(s)
1..19
