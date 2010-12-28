Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3303-notes-subtrees/.git/
expecting success: 

	(
		nr=0 &&
		while [ $nr -lt $number_of_commits ]; do
			nr=$(($nr+1)) &&
			test_tick &&
			cat <<INPUT_END
commit refs/heads/master
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
commit #$nr
COMMIT

M 644 inline file
data <<EOF
file in commit #$nr
EOF

INPUT_END

		done &&
		test_tick &&
		cat <<INPUT_END
commit refs/notes/commits
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
no notes
COMMIT

deleteall

INPUT_END

	) |
	git fast-import --quiet &&
	git config core.notesRef refs/notes/commits

ok 1 - setup: create 100 commits

expecting success: test_sha1_based "s|^..|&/|"

ok 2 - test notes in 2/38-fanout

expecting success: verify_notes

ok 3 - verify notes in 2/38-fanout

expecting success: test_sha1_based "s|^\(..\)\(..\)|\1/\2/|"

ok 4 - test notes in 2/2/36-fanout

expecting success: verify_notes

ok 5 - verify notes in 2/2/36-fanout

expecting success: test_sha1_based "s|^\(..\)\(..\)\(..\)|\1/\2/\3/|"

ok 6 - test notes in 2/2/2/34-fanout

expecting success: verify_notes

ok 7 - verify notes in 2/2/2/34-fanout
expecting success: test_same_notes "s|^..|&/|" ""
ok 8 - test same notes in no fanout and 2/38-fanout

expecting success: verify_notes

ok 9 - verify same notes in no fanout and 2/38-fanout
expecting success: test_same_notes "s|^\(..\)\(..\)|\1/\2/|" ""
ok 10 - test same notes in no fanout and 2/2/36-fanout

expecting success: verify_notes

ok 11 - verify same notes in no fanout and 2/2/36-fanout
expecting success: test_same_notes "s|^\(..\)\(..\)|\1/\2/|" "s|^..|&/|"
ok 12 - test same notes in 2/38-fanout and 2/2/36-fanout

expecting success: verify_notes

ok 13 - verify same notes in 2/38-fanout and 2/2/36-fanout

expecting success: test_same_notes "s|^\(..\)\(..\)|\1/\2/|" "s|^\(..\)\(..\)\(..\)|\1/\2/\3/|"

ok 14 - test same notes in 2/2/2/34-fanout and 2/2/36-fanout

expecting success: verify_notes

ok 15 - verify same notes in 2/2/2/34-fanout and 2/2/36-fanout

expecting success: test_concatenated_notes "s|^..|&/|" ""

ok 16 - test notes in no fanout concatenated with 2/38-fanout

expecting success: verify_concatenated_notes

ok 17 - verify notes in no fanout concatenated with 2/38-fanout
expecting success: test_concatenated_notes "s|^\(..\)\(..\)|\1/\2/|" ""

ok 18 - test notes in no fanout concatenated with 2/2/36-fanout

expecting success: verify_concatenated_notes

ok 19 - verify notes in no fanout concatenated with 2/2/36-fanout

expecting success: test_concatenated_notes "s|^\(..\)\(..\)|\1/\2/|" "s|^..|&/|"

ok 20 - test notes in 2/38-fanout concatenated with 2/2/36-fanout

expecting success: verify_concatenated_notes

ok 21 - verify notes in 2/38-fanout concatenated with 2/2/36-fanout
expecting success: test_concatenated_notes "s|^\(..\)\(..\)\(..\)|\1/\2/\3/|" "s|^\(..\)\(..\)|\1/\2/|"

ok 22 - test notes in 2/2/36-fanout concatenated with 2/2/2/34-fanout
expecting success: verify_concatenated_notes
ok 23 - verify notes in 2/2/36-fanout concatenated with 2/2/2/34-fanout

# passed all 23 test(s)
1..23
