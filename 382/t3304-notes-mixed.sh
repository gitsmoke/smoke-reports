Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3304-notes-mixed/.git/
expecting success: 

	test_tick &&
	cat <<INPUT_END >input &&
commit refs/heads/master
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
commit #1
COMMIT

M 644 inline file
data <<EOF
file in commit #1
EOF

INPUT_END

	test_tick &&
	cat <<INPUT_END >>input &&
commit refs/heads/master
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
commit #2
COMMIT

M 644 inline file
data <<EOF
file in commit #2
EOF

INPUT_END
	git fast-import --quiet <input

ok 1 - setup: create a couple of commits

expecting success: 

	commit1=$(git rev-parse refs/heads/master^) &&
	commit2=$(git rev-parse refs/heads/master) &&
	test_tick &&
	cat <<INPUT_END >input &&
commit refs/notes/commits
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
notes commit #1
COMMIT

N inline $commit1
data <<EOF
note for commit #1
EOF

N inline $commit2
data <<EOF
note for commit #2
EOF

INPUT_END
	test_tick &&
	cat <<INPUT_END >>input &&
commit refs/notes/commits
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
notes commit #2
COMMIT

M 644 inline foobar/non-note.txt
data <<EOF
A non-note in a notes tree
EOF

N inline $commit2
data <<EOF
edited note for commit #2
EOF

INPUT_END
	test_tick &&
	cat <<INPUT_END >>input &&
commit refs/notes/commits
committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
data <<COMMIT
notes commit #3
COMMIT

N inline $commit1
data <<EOF
edited note for commit #1
EOF

M 644 inline deadbeef
data <<EOF
non-note with SHA1-like name
EOF

M 644 inline de/adbeef
data <<EOF
another non-note with SHA1-like name
EOF

M 644 inline de/adbeefdeadbeefdeadbeefdeadbeefdeadbeef
data <<EOF
This is actually a valid note, albeit to a non-existing object.
It is needed in order to trigger the "mishandling" of the dead/beef non-note.
EOF

M 644 inline dead/beef
data <<EOF
yet another non-note with SHA1-like name
EOF

INPUT_END
	git fast-import --quiet <input &&
	git config core.notesRef refs/notes/commits

ok 2 - create a notes tree with both notes and non-notes

expecting success: 

	git log | grep "^    " > actual &&
	test_cmp expect actual


ok 3 - verify contents of notes
expecting success: 

	git cat-file -p refs/notes/commits:foobar/non-note.txt > actual_nn1 &&
	test_cmp expect_nn1 actual_nn1 &&
	git cat-file -p refs/notes/commits:deadbeef > actual_nn2 &&
	test_cmp expect_nn2 actual_nn2 &&
	git cat-file -p refs/notes/commits:de/adbeef > actual_nn3 &&
	test_cmp expect_nn3 actual_nn3 &&
	git cat-file -p refs/notes/commits:dead/beef > actual_nn4 &&
	test_cmp expect_nn4 actual_nn4

ok 4 - verify contents of non-notes

expecting success: 

	test_tick &&
	git notes add -f -m "foo bar"


ok 5 - git-notes preserves non-notes

expecting success: 

	git cat-file -p refs/notes/commits:foobar/non-note.txt > actual_nn1 &&
	test_cmp expect_nn1 actual_nn1 &&
	git cat-file -p refs/notes/commits:deadbeef > actual_nn2 &&
	test_cmp expect_nn2 actual_nn2 &&
	git cat-file -p refs/notes/commits:de/adbeef > actual_nn3 &&
	test_cmp expect_nn3 actual_nn3 &&
	git cat-file -p refs/notes/commits:dead/beef > actual_nn4 &&
	test_cmp expect_nn4 actual_nn4
ok 6 - verify contents of non-notes after git-notes

# passed all 6 test(s)
1..6
