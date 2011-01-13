ok 1 - setup a few initial commits with notes (notes ref: x)
ok 2 - sanity check (x)
ok 3 - Add a few hundred commits w/notes to trigger fanout (x -> y)
ok 4 - notes tree has fanout (y)
not ok - 5 No-op merge (already included) (x => y)
#	
#		git update-ref refs/notes/m refs/notes/y &&
#		git config core.notesRef refs/notes/m &&
#		git notes merge x &&
#		test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/y)"
#	
not ok - 6 Fast-forward merge (y => x)
#	
#		git update-ref refs/notes/m refs/notes/x &&
#		git notes merge y &&
#		test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/y)"
#	
ok 7 - change some of the initial 5 notes (x -> z)
ok 8 - notes tree has no fanout (z)
not ok - 9 successful merge without conflicts (y => z)
#	
#		git update-ref refs/notes/m refs/notes/z &&
#		git config core.notesRef refs/notes/m &&
#		git notes merge y &&
#		verify_notes m commit5 &&
#		# x/y/z unchanged
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
not ok - 10 notes tree still has fanout after merge (m)
#	verify_fanout m
ok 11 - introduce conflicting changes (y -> w)
not ok - 12 successful merge using "ours" strategy (z => w)
#	
#		git update-ref refs/notes/m refs/notes/w &&
#		git config core.notesRef refs/notes/m &&
#		git notes merge -s ours z &&
#		verify_notes m commit5 &&
#		# w/x/y/z unchanged
#		verify_notes w commit5 &&
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
ok 13 - notes tree still has fanout after merge (m)
not ok - 14 successful merge using "theirs" strategy (z => w)
#	
#		git update-ref refs/notes/m refs/notes/w &&
#		git notes merge -s theirs z &&
#		verify_notes m commit5 &&
#		# w/x/y/z unchanged
#		verify_notes w commit5 &&
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
ok 15 - notes tree still has fanout after merge (m)
not ok - 16 successful merge using "union" strategy (z => w)
#	
#		git update-ref refs/notes/m refs/notes/w &&
#		git notes merge -s union z &&
#		verify_notes m commit5 &&
#		# w/x/y/z unchanged
#		verify_notes w commit5 &&
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
ok 17 - notes tree still has fanout after merge (m)
not ok - 18 successful merge using "cat_sort_uniq" strategy (z => w)
#	
#		git update-ref refs/notes/m refs/notes/w &&
#		git notes merge -s cat_sort_uniq z &&
#		verify_notes m commit5 &&
#		# w/x/y/z unchanged
#		verify_notes w commit5 &&
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
ok 19 - notes tree still has fanout after merge (m)
ok 20 - fails to merge using "manual" strategy (z => w)
ok 21 - notes tree still has fanout after merge (m)
not ok - 22 verify conflict entries (with no fanout)
#	
#		ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
#		test_cmp expect_conflicts output_conflicts &&
#		( for f in $(cat expect_conflicts); do
#			test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
#			exit 1
#		done ) &&
#		# Verify that current notes tree (pre-merge) has not changed (m == w)
#		test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/w)"
#	
not ok - 23 resolve and finalize merge (z => w)
#	
#		cat >.git/NOTES_MERGE_WORKTREE/$commit_sha3 <<EOF &&
#	other notes for commit3
#	
#	appended notes for commit3
#	EOF
#		git notes merge --commit &&
#		verify_notes m commit5 &&
#		# w/x/y/z unchanged
#		verify_notes w commit5 &&
#		verify_notes x commit5 &&
#		verify_notes y commit5 &&
#		verify_notes z commit5
#	
ok 24 - notes tree still has fanout after merge (m)
# failed 10 among 24 test(s)
1..24
