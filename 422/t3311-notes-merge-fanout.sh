Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3311-notes-merge-fanout/.git/
expecting success: 
	git config core.notesRef refs/notes/x &&
	for i in 1 2 3 4 5
	do
		test_commit "commit$i" >/dev/null &&
		git notes add -m "notes for commit$i" || return 1
	done

ok 1 - setup a few initial commits with notes (notes ref: x)
expecting success: 
	verify_notes x commit5 &&
	verify_no_fanout x


ok 2 - sanity check (x)

expecting success: 
	git update-ref refs/notes/y refs/notes/x &&
	git config core.notesRef refs/notes/y &&
	i=5 &&
	while test $i -lt $num
	do
		i=$(($i + 1)) &&
		test_commit "commit$i" >/dev/null &&
		git notes add -m "notes for commit$i" || return 1
	done &&
	test "$(git rev-parse refs/notes/y)" != "$(git rev-parse refs/notes/x)" &&
	# Expected number of commits and notes
	test $(git rev-list HEAD | wc -l) = $num &&
	test $(git notes list | wc -l) = $num &&
	# 5 first notes unchanged
	verify_notes y commit5

ok 3 - Add a few hundred commits w/notes to trigger fanout (x -> y)

expecting success: verify_fanout y

ok 4 - notes tree has fanout (y)

expecting success: 
	git update-ref refs/notes/m refs/notes/y &&
	git config core.notesRef refs/notes/m &&
	git notes merge x &&
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/y)"
Already up-to-date!

ok 5 - No-op merge (already included) (x => y)

expecting success: 
	git update-ref refs/notes/m refs/notes/x &&
	git notes merge y &&
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/y)"

Fast-forward

ok 6 - Fast-forward merge (y => x)

expecting success: 
	git update-ref refs/notes/z refs/notes/x &&
	git config core.notesRef refs/notes/z &&
	git notes add -f -m "new notes for commit2" commit2 &&
	git notes append -m "appended notes for commit3" commit3 &&
	git notes remove commit4 &&
	git notes remove commit5 &&
	verify_notes z commit5


ok 7 - change some of the initial 5 notes (x -> z)

expecting success: verify_no_fanout z

ok 8 - notes tree has no fanout (z)

expecting success: 
	git update-ref refs/notes/m refs/notes/z &&
	git config core.notesRef refs/notes/m &&
	git notes merge y &&
	verify_notes m commit5 &&
	# x/y/z unchanged
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5


ok 9 - successful merge without conflicts (y => z)

expecting success: verify_fanout m

ok 10 - notes tree still has fanout after merge (m)

expecting success: 
	git update-ref refs/notes/w refs/notes/y &&
	git config core.notesRef refs/notes/w &&
	git notes add -f -m "other notes for commit1" commit1 &&
	git notes add -f -m "other notes for commit3" commit3 &&
	git notes add -f -m "other notes for commit4" commit4 &&
	git notes remove commit5 &&
	verify_notes w commit5

ok 11 - introduce conflicting changes (y -> w)

expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	git config core.notesRef refs/notes/m &&
	git notes merge -s ours z &&
	verify_notes m commit5 &&
	# w/x/y/z unchanged
	verify_notes w commit5 &&
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5
Using local notes for 157e8cc0aeac5befb302d276f2e706112bf6e413
Using local notes for e0851358fb6b4703f23d74ef964bc4491bec7ab9

ok 12 - successful merge using "ours" strategy (z => w)

expecting success: verify_fanout m

ok 13 - notes tree still has fanout after merge (m)

expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	git notes merge -s theirs z &&
	verify_notes m commit5 &&
	# w/x/y/z unchanged
	verify_notes w commit5 &&
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5

Using remote notes for 157e8cc0aeac5befb302d276f2e706112bf6e413
Using remote notes for e0851358fb6b4703f23d74ef964bc4491bec7ab9
ok 14 - successful merge using "theirs" strategy (z => w)

expecting success: verify_fanout m

ok 15 - notes tree still has fanout after merge (m)

expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	git notes merge -s union z &&
	verify_notes m commit5 &&
	# w/x/y/z unchanged
	verify_notes w commit5 &&
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5

Concatenating local and remote notes for 157e8cc0aeac5befb302d276f2e706112bf6e413
Concatenating local and remote notes for e0851358fb6b4703f23d74ef964bc4491bec7ab9

ok 16 - successful merge using "union" strategy (z => w)

expecting success: verify_fanout m

ok 17 - notes tree still has fanout after merge (m)

expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	git notes merge -s cat_sort_uniq z &&
	verify_notes m commit5 &&
	# w/x/y/z unchanged
	verify_notes w commit5 &&
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5
Concatenating unique lines in local and remote notes for 157e8cc0aeac5befb302d276f2e706112bf6e413
Concatenating unique lines in local and remote notes for e0851358fb6b4703f23d74ef964bc4491bec7ab9

ok 18 - successful merge using "cat_sort_uniq" strategy (z => w)
expecting success: verify_fanout m
ok 19 - notes tree still has fanout after merge (m)
expecting success: 
	git update-ref refs/notes/m refs/notes/w &&
	test_must_fail git notes merge z
Auto-merging notes for 157e8cc0aeac5befb302d276f2e706112bf6e413
CONFLICT (delete/modify): Notes for object 157e8cc0aeac5befb302d276f2e706112bf6e413 deleted in refs/notes/z and modified in refs/notes/m. Version from refs/notes/m left in tree.
Auto-merging notes for e0851358fb6b4703f23d74ef964bc4491bec7ab9
CONFLICT (content): Merge conflict in notes for object e0851358fb6b4703f23d74ef964bc4491bec7ab9
Automatic notes merge failed. Fix conflicts in .git/NOTES_MERGE_WORKTREE and commit the result with 'git notes merge --commit', or abort the merge with 'git notes merge --abort'.

ok 20 - fails to merge using "manual" strategy (z => w)

expecting success: verify_fanout m

ok 21 - notes tree still has fanout after merge (m)

expecting success: 
	ls .git/NOTES_MERGE_WORKTREE >output_conflicts &&
	test_cmp expect_conflicts output_conflicts &&
	( for f in $(cat expect_conflicts); do
		test_cmp "expect_conflict_$f" ".git/NOTES_MERGE_WORKTREE/$f" ||
		exit 1
	done ) &&
	# Verify that current notes tree (pre-merge) has not changed (m == w)
	test "$(git rev-parse refs/notes/m)" = "$(git rev-parse refs/notes/w)"


ok 22 - verify conflict entries (with no fanout)

expecting success: 
	cat >.git/NOTES_MERGE_WORKTREE/$commit_sha3 <<EOF &&
other notes for commit3

appended notes for commit3
EOF
	git notes merge --commit &&
	verify_notes m commit5 &&
	# w/x/y/z unchanged
	verify_notes w commit5 &&
	verify_notes x commit5 &&
	verify_notes y commit5 &&
	verify_notes z commit5

ok 23 - resolve and finalize merge (z => w)

expecting success: verify_fanout m

ok 24 - notes tree still has fanout after merge (m)

# passed all 24 test(s)
1..24
