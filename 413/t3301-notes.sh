Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3301-notes/.git/
expecting success: 
	(MSG=3 && export MSG && test_must_fail git notes add)
ok 1 - cannot annotate non-existing HEAD
expecting success: 
	: > a1 &&
	git add a1 &&
	test_tick &&
	git commit -m 1st &&
	: > a2 &&
	git add a2 &&
	test_tick &&
	git commit -m 2nd
[master (root-commit) 34b09d6] 1st
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a1
[master 268048b] 2nd
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a2

ok 2 - setup
expecting success: 
	(MSG=1 GIT_NOTES_REF=/ && export MSG GIT_NOTES_REF &&
	 test_must_fail git notes add) &&
	(MSG=2 GIT_NOTES_REF=/ && export MSG GIT_NOTES_REF &&
	 test_must_fail git notes show)
ok 3 - need valid notes ref

expecting success: 
	(MSG=1 GIT_NOTES_REF=refs/heads/bogus &&
	 export MSG GIT_NOTES_REF &&
	 test_must_fail git notes add)
ok 4 - refusing to add notes in refs/heads/
expecting success: 
	(MSG=1 GIT_NOTES_REF=refs/remotes/bogus &&
	 export MSG GIT_NOTES_REF &&
	 test_must_fail git notes edit)
ok 5 - refusing to edit notes in refs/remotes/
expecting success: 
	test_expect_code 1 git notes show
ok 6 - handle empty notes gracefully
expecting success: 
	for l in A B
	do
		echo "$l"
	done >expect &&
	git show -s --format=A%n%NB >output &&
	test_cmp expect output

ok 7 - show non-existent notes entry with %N

expecting success: 
	git config core.notesRef refs/notes/commits &&
	MSG=b4 git notes add &&
	test ! -f .git/NOTES_EDITMSG &&
	test 1 = $(git ls-tree refs/notes/commits | wc -l) &&
	test b4 = $(git notes show) &&
	git show HEAD^ &&
	test_must_fail git notes show HEAD^
commit 34b09d6ffa51a8a03203627f0e369f607227364f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    1st

diff --git a/a1 b/a1
new file mode 100644
index 0000000..e69de29

ok 8 - create notes

expecting success: 
	for l in A b4 B
	do
		echo "$l"
	done >expect &&
	git show -s --format=A%n%NB >output &&
	test_cmp expect output


ok 9 - show notes entry with %N

expecting success: 
	git reflog show refs/notes/commits >output &&
	test_cmp expect output

ok 10 - create reflog entry

expecting success: 
	MSG=b3 git notes edit &&
	test ! -f .git/NOTES_EDITMSG &&
	test 1 = $(git ls-tree refs/notes/commits | wc -l) &&
	test b3 = $(git notes show) &&
	git show HEAD^ &&
	test_must_fail git notes show HEAD^
commit 34b09d6ffa51a8a03203627f0e369f607227364f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    1st

diff --git a/a1 b/a1
new file mode 100644
index 0000000..e69de29

ok 11 - edit existing notes

expecting success: 
	! MSG=b2 git notes add &&
	test ! -f .git/NOTES_EDITMSG &&
	test 1 = $(git ls-tree refs/notes/commits | wc -l) &&
	test b3 = $(git notes show) &&
	git show HEAD^ &&
	test_must_fail git notes show HEAD^
commit 34b09d6ffa51a8a03203627f0e369f607227364f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    1st

diff --git a/a1 b/a1
new file mode 100644
index 0000000..e69de29

ok 12 - cannot add note where one exists
expecting success: 
	MSG=b1 git notes add -f &&
	test ! -f .git/NOTES_EDITMSG &&
	test 1 = $(git ls-tree refs/notes/commits | wc -l) &&
	test b1 = $(git notes show) &&
	git show HEAD^ &&
	test_must_fail git notes show HEAD^
commit 34b09d6ffa51a8a03203627f0e369f607227364f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    1st

diff --git a/a1 b/a1
new file mode 100644
index 0000000..e69de29

ok 13 - can overwrite existing note with "git notes add -f"

expecting success: 
	! (git cat-file commit HEAD | grep b1) &&
	git log -1 > output &&
	test_cmp expect output


ok 14 - show notes

expecting success: 
	: > a3 &&
	git add a3 &&
	test_tick &&
	git commit -m 3rd &&
	MSG="b3
c3c3c3c3
d3d3d3" git notes add
[master 1584215] 3rd
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a3
ok 15 - create multi-line notes (setup)
expecting success: 
	git log -2 > output &&
	test_cmp expect-multiline output

ok 16 - show multi-line notes

expecting success: 
	: > a4 &&
	git add a4 &&
	test_tick &&
	git commit -m 4th &&
	echo "xyzzy" > note5 &&
	git notes add -F note5
[master 1502353] 4th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a4

ok 17 - create -F notes (setup)

expecting success: 
	git log -3 > output &&
	test_cmp expect-F output


ok 18 - show -F notes

expecting success: 
	git log -1 --pretty=raw >output &&
	test_cmp expect output

ok 19 - git log --pretty=raw does not show notes
expecting success: 
	git log -1 --pretty=raw --show-notes >output &&
	test_cmp expect output

ok 20 - git log --show-notes
expecting success: 
	git log -1 --no-notes >output &&
	! grep xyzzy output

ok 21 - git log --no-notes
expecting success: 
	git format-patch -1 --stdout >output &&
	! grep xyzzy output

ok 22 - git format-patch does not show notes
expecting success: 
	git format-patch --show-notes -1 --stdout >output &&
	grep xyzzy output
    xyzzy
ok 23 - git format-patch --show-notes does show notes
expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	
    xyzzy
ok 24 - git show  does show notes
expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 25 - git show --pretty does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 26 - git show --pretty=raw does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 27 - git show --pretty=short does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 28 - git show --pretty=medium does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 29 - git show --pretty=full does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 30 - git show --pretty=fuller does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 31 - git show --pretty=format:%s does not show notes

expecting success: 
		git show $p >output &&
		eval "$negate grep xyzzy output"
	

ok 32 - git show --oneline does not show notes

expecting success: 
	: > a5 &&
	git add a5 &&
	test_tick &&
	git commit -m 5th &&
	git notes add -m spam -m "foo
bar
baz"
[master bd17532] 5th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a5

ok 33 - create -m notes (setup)
expecting success: 
	git log -4 > output &&
	test_cmp expect-m output


ok 34 - show -m notes

expecting success: 
	git notes add -f -F /dev/null


ok 35 - remove note with add -f -F /dev/null (setup)

expecting success: 
	git log -4 > output &&
	test_cmp expect-rm-F output &&
	test_must_fail git notes show
ok 36 - verify note removal with -F /dev/null
expecting success: 
	git notes add -m ""
ok 37 - do not create empty note with -m "" (setup)
expecting success: 
	git log -4 > output &&
	test_cmp expect-rm-F output &&
	test_must_fail git notes show
ok 38 - verify non-creation of note with -m ""
expecting success: 
	echo "xyzzy" > note_a &&
	echo "zyxxy" > note_b &&
	git notes add -m "foo" -F note_a -m "bar" -F note_b -m "baz" &&
	git notes show > output &&
	test_cmp expect-combine_m_and_F output

ok 39 - create note with combination of -m and -F

expecting success: 
	git notes remove HEAD^ &&
	git notes remove


ok 40 - remove note with "git notes remove" (setup)

expecting success: 
	git log -4 > output &&
	test_cmp expect-rm-remove output &&
	test_must_fail git notes show HEAD^


ok 41 - verify note removal with "git notes remove"

expecting success: 
	git rev-parse --verify refs/notes/commits > before_commit &&
	test_must_fail git notes remove HEAD^ &&
	git rev-parse --verify refs/notes/commits > after_commit &&
	test_cmp before_commit after_commit


ok 42 - removing non-existing note should not create new commit

expecting success: 
	git notes list > output &&
	test_cmp expect output


ok 43 - list notes with "git notes list"

expecting success: 
	git notes > output &&
	test_cmp expect output


ok 44 - list notes with "git notes"

expecting success: 
	git notes list HEAD^^ > output &&
	test_cmp expect output


ok 45 - list specific note with "git notes list <object>"

expecting success: 
	test_must_fail git notes list HEAD > output &&
	test_cmp expect output


ok 46 - listing non-existing notes fails

expecting success: 
	git notes add -m "Initial set of notes" &&
	git notes append -m "More notes appended with git notes append" &&
	git notes show > output &&
	test_cmp expect output


ok 47 - append to existing note with "git notes append"

expecting success: 
	git notes list > output &&
	test_cmp expect_list output


ok 48 - "git notes list" does not expand to "git notes list HEAD"

expecting success: 
	git notes append -m "" &&
	git notes show > output &&
	test_cmp expect output


ok 49 - appending empty string does not change existing note

expecting success: 
	git notes remove HEAD &&
	test_must_fail git notes list HEAD &&
	git notes append -m "Initial set of notes

More notes appended with git notes append" &&
	git notes show > output &&
	test_cmp expect output


ok 50 - git notes append == add when there is no existing note

expecting success: 
	git notes remove HEAD &&
	test_must_fail git notes list HEAD &&
	git notes append -m "" &&
	test_must_fail git notes list HEAD


ok 51 - appending empty string to non-existing note does not create note

expecting success: 
	: > a6 &&
	git add a6 &&
	test_tick &&
	git commit -m 6th &&
	GIT_NOTES_REF="refs/notes/other" git notes add -m "other note"

[master 387a899] 6th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a6

ok 52 - create other note on a different notes ref (setup)

expecting success: 
	git log -1 > output &&
	test_cmp expect-not-other output


ok 53 - Do not show note on other ref by default

expecting success: 
	GIT_NOTES_REF="refs/notes/other" git log -1 > output &&
	test_cmp expect-other output


ok 54 - Do show note when ref is given in GIT_NOTES_REF

expecting success: 
	git config core.notesRef "refs/notes/other" &&
	git log -1 > output &&
	test_cmp expect-other output


ok 55 - Do show note when ref is given in core.notesRef config

expecting success: 
	GIT_NOTES_REF="refs/notes/wrong" git log -1 > output &&
	test_cmp expect-not-other output


ok 56 - Do not show note when core.notesRef is overridden

expecting success: 
	GIT_NOTES_REF=refs/notes/commits git notes add \
		-m"replacement for deleted note" HEAD^ &&
	GIT_NOTES_REF=refs/notes/commits git notes add -m"order test" &&
	git config --unset core.notesRef &&
	git config notes.displayRef "refs/notes/*" &&
	git log -2 > output &&
	test_cmp expect-both output


ok 57 - Show all notes when notes.displayRef=refs/notes/*

expecting success: 
	git config core.notesRef refs/notes/commits &&
	git config notes.displayRef refs/notes/other &&
	git log -2 > output &&
	test_cmp expect-both output


ok 58 - core.notesRef is implicitly in notes.displayRef

expecting success: 
	git config --unset core.notesRef &&
	git config notes.displayRef refs/notes/commits &&
	git config --add notes.displayRef refs/notes/other &&
	git log -2 > output &&
	test_cmp expect-both output


ok 59 - notes.displayRef can be given more than once

expecting success: 
	git config core.notesRef refs/notes/other &&
	git config --unset-all notes.displayRef &&
	git config notes.displayRef refs/notes/commits &&
	git log -1 > output &&
	test_cmp expect-both-reversed output


ok 60 - notes.displayRef respects order

expecting success: 
	git config --unset-all core.notesRef &&
	git config --unset-all notes.displayRef &&
	GIT_NOTES_DISPLAY_REF=refs/notes/commits:refs/notes/other \
		git log -2 > output &&
	test_cmp expect-both output


ok 61 - GIT_NOTES_DISPLAY_REF works

expecting success: 
	git config notes.displayRef "refs/notes/*" &&
	GIT_NOTES_REF= GIT_NOTES_DISPLAY_REF= git log -2 > output &&
	test_cmp expect-none output


ok 62 - GIT_NOTES_DISPLAY_REF overrides config

expecting success: 
	GIT_NOTES_REF= GIT_NOTES_DISPLAY_REF= git log --show-notes=* -2 > output &&
	test_cmp expect-both output


ok 63 - --show-notes=* adds to GIT_NOTES_DISPLAY_REF

expecting success: 
	git log --no-standard-notes --show-notes=commits -1 > output &&
	test_cmp expect-commits output


ok 64 - --no-standard-notes

expecting success: 
	git log --no-standard-notes --show-notes=commits \
		--standard-notes -2 > output &&
	test_cmp expect-both output


ok 65 - --standard-notes

expecting success: 
	git log --show-notes=other --show-notes=commits \
		 --no-standard-notes -1 > output &&
	test_cmp expect-both-reversed output


ok 66 - --show-notes=ref accumulates

expecting success: 
	git config core.notesRef refs/notes/other &&
	echo "Note on a tree" > expect &&
	git notes add -m "Note on a tree" HEAD: &&
	git notes show HEAD: > actual &&
	test_cmp expect actual &&
	echo "Note on a blob" > expect &&
	filename=$(git ls-tree --name-only HEAD | head -n1) &&
	git notes add -m "Note on a blob" HEAD:$filename &&
	git notes show HEAD:$filename > actual &&
	test_cmp expect actual &&
	echo "Note on a tag" > expect &&
	git tag -a -m "This is an annotated tag" foobar HEAD^ &&
	git notes add -m "Note on a tag" foobar &&
	git notes show foobar > actual &&
	test_cmp expect actual

ok 67 - Allow notes on non-commits (trees, blobs, tags)

expecting success: 
	: > a7 &&
	git add a7 &&
	test_tick &&
	git commit -m 7th &&
	git notes add -C $(git notes list HEAD^) &&
	git log -1 > actual &&
	test_cmp expect actual &&
	test "$(git notes list HEAD)" = "$(git notes list HEAD^)"

[master 2ede894] 7th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a7
ok 68 - create note from other note with "git notes add -C"

expecting success: 
	: > a8 &&
	git add a8 &&
	test_tick &&
	git commit -m 8th &&
	test_must_fail git notes add -C deadbeef &&
	test_must_fail git notes list HEAD
[master 80d796d] 8th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a8
ok 69 - create note from non-existing note with "git notes add -C" fails
expecting success: 
	: > a9 &&
	git add a9 &&
	test_tick &&
	git commit -m 9th &&
	MSG="yet another note" git notes add -c $(git notes list HEAD^^) &&
	git log -1 > actual &&
	test_cmp expect actual
[master 016e982] 9th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a9
ok 70 - create note from other note with "git notes add -c"

expecting success: 
	: > a10 &&
	git add a10 &&
	test_tick &&
	git commit -m 10th &&
	(
		MSG="yet another note" &&
		export MSG &&
		test_must_fail git notes add -c deadbeef
	) &&
	test_must_fail git notes list HEAD
[master ffed603] 10th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a10
ok 71 - create note from non-existing note with "git notes add -c" fails
expecting success: 
	git notes append -C $(git notes list HEAD^) HEAD^ &&
	git log -1 HEAD^ > actual &&
	test_cmp expect actual

ok 72 - append to note from other note with "git notes append -C"
expecting success: 
	MSG="other note" git notes append -c $(git notes list HEAD^) &&
	git log -1 > actual &&
	test_cmp expect actual
ok 73 - create note from other note with "git notes append -c"
expecting success: 
	MSG="yet another note" git notes append -c $(git notes list HEAD) &&
	git log -1 > actual &&
	test_cmp expect actual
ok 74 - append to note from other note with "git notes append -c"
expecting success: 
	: > a11 &&
	git add a11 &&
	test_tick &&
	git commit -m 11th &&
	git notes copy HEAD^ HEAD &&
	git log -1 > actual &&
	test_cmp expect actual &&
	test "$(git notes list HEAD)" = "$(git notes list HEAD^)"
[master 6352c5e] 11th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a11

ok 75 - copy note with "git notes copy"

expecting success: 
	test_must_fail git notes copy HEAD~2 HEAD &&
	git log -1 > actual &&
	test_cmp expect actual &&
	test "$(git notes list HEAD)" = "$(git notes list HEAD^)"
ok 76 - prevent overwrite with "git notes copy"
expecting success: 
	git notes copy -f HEAD~2 HEAD &&
	git log -1 > actual &&
	test_cmp expect actual &&
	test "$(git notes list HEAD)" = "$(git notes list HEAD~2)"

ok 77 - allow overwrite with "git notes copy -f"
expecting success: 
	: > a12 &&
	git add a12 &&
	test_tick &&
	git commit -m 12th &&
	: > a13 &&
	git add a13 &&
	test_tick &&
	git commit -m 13th &&
	test_must_fail git notes copy HEAD^ HEAD
[master 7038787] 12th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a12
[master e5d4fb5] 13th
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a13

ok 78 - cannot copy note from object without notes

expecting success: 
	(echo $(git rev-parse HEAD~3) $(git rev-parse HEAD^); \
	echo $(git rev-parse HEAD~2) $(git rev-parse HEAD)) |
	git notes copy --stdin &&
	git log -2 > output &&
	test_cmp expect output &&
	test "$(git notes list HEAD)" = "$(git notes list HEAD~2)" &&
	test "$(git notes list HEAD^)" = "$(git notes list HEAD~3)"
ok 79 - git notes copy --stdin
expecting success: 
	test_commit 14th &&
	test_commit 15th &&
	(echo $(git rev-parse HEAD~3) $(git rev-parse HEAD^); \
	echo $(git rev-parse HEAD~2) $(git rev-parse HEAD)) |
	git notes copy --for-rewrite=foo &&
	git log -2 > output &&
	test_cmp expect output
[master be28d8b] 14th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 14th.t
[master 37a0d4c] 15th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 15th.t

ok 80 - git notes copy --for-rewrite (unconfigured)

expecting success: 
	git config notes.rewriteMode overwrite &&
	git config notes.rewriteRef "refs/notes/*" &&
	(echo $(git rev-parse HEAD~3) $(git rev-parse HEAD^); \
	echo $(git rev-parse HEAD~2) $(git rev-parse HEAD)) |
	git notes copy --for-rewrite=foo &&
	git log -2 > output &&
	test_cmp expect output

ok 81 - git notes copy --for-rewrite (enabled)

expecting success: 
	git config notes.rewrite.bar false &&
	echo $(git rev-parse HEAD~3) $(git rev-parse HEAD) |
	git notes copy --for-rewrite=bar &&
	git log -2 > output &&
	test_cmp expect output
ok 82 - git notes copy --for-rewrite (disabled)
expecting success: 
	git notes add -f -m"a fresh note" HEAD^ &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output
ok 83 - git notes copy --for-rewrite (overwrite)

expecting success: 
	git config notes.rewriteMode ignore &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output

ok 84 - git notes copy --for-rewrite (ignore)
expecting success: 
	git notes add -f -m"another fresh note" HEAD^ &&
	git config notes.rewriteMode concatenate &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output
ok 85 - git notes copy --for-rewrite (append)
expecting success: 
	git notes add -f -m"append 1" HEAD^ &&
	git notes add -f -m"append 2" HEAD^^ &&
	(echo $(git rev-parse HEAD^) $(git rev-parse HEAD);
	echo $(git rev-parse HEAD^^) $(git rev-parse HEAD)) |
	git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output
ok 86 - git notes copy --for-rewrite (append two to one)

expecting success: 
	git notes remove HEAD^ &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output
ok 87 - git notes copy --for-rewrite (append empty)
expecting success: 
	git notes add -f -m"replacement note 1" HEAD^ &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	GIT_NOTES_REWRITE_MODE=overwrite git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output

ok 88 - GIT_NOTES_REWRITE_MODE works
expecting success: 
	git config notes.rewriteMode overwrite &&
	git notes add -f -m"replacement note 2" HEAD^ &&
	git config --unset-all notes.rewriteRef &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	GIT_NOTES_REWRITE_REF=refs/notes/commits:refs/notes/other \
		git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output
ok 89 - GIT_NOTES_REWRITE_REF works

expecting success: 
	git config notes.rewriteRef refs/notes/other &&
	git notes add -f -m"replacement note 3" HEAD^ &&
	echo $(git rev-parse HEAD^) $(git rev-parse HEAD) |
	GIT_NOTES_REWRITE_REF= git notes copy --for-rewrite=foo &&
	git log -1 > output &&
	test_cmp expect output

ok 90 - GIT_NOTES_REWRITE_REF overrides config

expecting success: 
	test_must_fail git notes copy &&
	test_must_fail git notes copy one two three
ok 91 - git notes copy diagnoses too many or too few parameters

expecting success: 
	git config --unset core.notesRef &&
	unset GIT_NOTES_REF &&
	test "$(git notes get-ref)" = "refs/notes/commits"

ok 92 - git notes get-ref (no overrides)

expecting success: 
	git config core.notesRef refs/notes/foo &&
	test "$(git notes get-ref)" = "refs/notes/foo"

ok 93 - git notes get-ref (core.notesRef)

expecting success: 
	test "$(GIT_NOTES_REF=refs/notes/bar git notes get-ref)" = "refs/notes/bar"

ok 94 - git notes get-ref (GIT_NOTES_REF)

expecting success: 
	test "$(GIT_NOTES_REF=refs/notes/bar git notes --ref=baz get-ref)" = "refs/notes/baz"

ok 95 - git notes get-ref (--ref)

# passed all 95 test(s)
1..95
