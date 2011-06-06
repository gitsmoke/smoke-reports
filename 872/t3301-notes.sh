ok 1 - cannot annotate non-existing HEAD
ok 2 - setup
ok 3 - need valid notes ref
ok 4 - refusing to add notes in refs/heads/
ok 5 - refusing to edit notes in refs/remotes/
ok 6 - handle empty notes gracefully
ok 7 - show non-existent notes entry with %N
ok 8 - create notes
ok 9 - show notes entry with %N
ok 10 - create reflog entry
ok 11 - edit existing notes
ok 12 - cannot "git notes add -m" where notes already exists
ok 13 - can overwrite existing note with "git notes add -f -m"
ok 14 - add w/no options on existing note morphs into edit
ok 15 - can overwrite existing note with "git notes add -f"
ok 16 - show notes
ok 17 - create multi-line notes (setup)
ok 18 - show multi-line notes
ok 19 - create -F notes (setup)
ok 20 - show -F notes
ok 21 - Re-adding -F notes without -f fails
ok 22 - git log --pretty=raw does not show notes
ok 23 - git log --show-notes
ok 24 - git log --no-notes
ok 25 - git format-patch does not show notes
ok 26 - git format-patch --show-notes does show notes
ok 27 - git show  does show notes
ok 28 - git show --pretty does not show notes
ok 29 - git show --pretty=raw does not show notes
ok 30 - git show --pretty=short does not show notes
ok 31 - git show --pretty=medium does not show notes
ok 32 - git show --pretty=full does not show notes
ok 33 - git show --pretty=fuller does not show notes
ok 34 - git show --pretty=format:%s does not show notes
ok 35 - git show --oneline does not show notes
ok 36 - setup alternate notes ref
ok 37 - git log --notes shows default notes
ok 38 - git log --notes=X shows only X
ok 39 - git log --notes --notes=X shows both
ok 40 - git log --no-notes resets default state
ok 41 - git log --no-notes resets ref list
ok 42 - create -m notes (setup)
ok 43 - show -m notes
ok 44 - remove note with add -f -F /dev/null (setup)
ok 45 - verify note removal with -F /dev/null
ok 46 - do not create empty note with -m "" (setup)
ok 47 - verify non-creation of note with -m ""
ok 48 - create note with combination of -m and -F
ok 49 - remove note with "git notes remove" (setup)
ok 50 - verify note removal with "git notes remove"
ok 51 - removing non-existing note should not create new commit
ok 52 - removing more than one
ok 53 - removing is atomic
ok 54 - removing with --ignore-missing
ok 55 - removing with --ignore-missing but bogus ref
ok 56 - remove reads from --stdin
ok 57 - remove --stdin is also atomic
ok 58 - removing with --stdin --ignore-missing
ok 59 - list notes with "git notes list"
ok 60 - list notes with "git notes"
ok 61 - list specific note with "git notes list <object>"
ok 62 - listing non-existing notes fails
ok 63 - append to existing note with "git notes append"
ok 64 - "git notes list" does not expand to "git notes list HEAD"
ok 65 - appending empty string does not change existing note
ok 66 - git notes append == add when there is no existing note
ok 67 - appending empty string to non-existing note does not create note
ok 68 - create other note on a different notes ref (setup)
ok 69 - Do not show note on other ref by default
ok 70 - Do show note when ref is given in GIT_NOTES_REF
ok 71 - Do show note when ref is given in core.notesRef config
ok 72 - Do not show note when core.notesRef is overridden
ok 73 - Show all notes when notes.displayRef=refs/notes/*
ok 74 - core.notesRef is implicitly in notes.displayRef
ok 75 - notes.displayRef can be given more than once
ok 76 - notes.displayRef respects order
ok 77 - GIT_NOTES_DISPLAY_REF works
ok 78 - GIT_NOTES_DISPLAY_REF overrides config
ok 79 - --show-notes=* adds to GIT_NOTES_DISPLAY_REF
ok 80 - --no-standard-notes
ok 81 - --standard-notes
ok 82 - --show-notes=ref accumulates
ok 83 - Allow notes on non-commits (trees, blobs, tags)
ok 84 - create note from other note with "git notes add -C"
ok 85 - create note from non-existing note with "git notes add -C" fails
ok 86 - create note from other note with "git notes add -c"
ok 87 - create note from non-existing note with "git notes add -c" fails
ok 88 - append to note from other note with "git notes append -C"
ok 89 - create note from other note with "git notes append -c"
ok 90 - append to note from other note with "git notes append -c"
ok 91 - copy note with "git notes copy"
ok 92 - prevent overwrite with "git notes copy"
ok 93 - allow overwrite with "git notes copy -f"
ok 94 - cannot copy note from object without notes
ok 95 - git notes copy --stdin
ok 96 - git notes copy --for-rewrite (unconfigured)
ok 97 - git notes copy --for-rewrite (enabled)
ok 98 - git notes copy --for-rewrite (disabled)
ok 99 - git notes copy --for-rewrite (overwrite)
ok 100 - git notes copy --for-rewrite (ignore)
ok 101 - git notes copy --for-rewrite (append)
ok 102 - git notes copy --for-rewrite (append two to one)
ok 103 - git notes copy --for-rewrite (append empty)
ok 104 - GIT_NOTES_REWRITE_MODE works
ok 105 - GIT_NOTES_REWRITE_REF works
ok 106 - GIT_NOTES_REWRITE_REF overrides config
ok 107 - git notes copy diagnoses too many or too few parameters
ok 108 - git notes get-ref (no overrides)
ok 109 - git notes get-ref (core.notesRef)
ok 110 - git notes get-ref (GIT_NOTES_REF)
ok 111 - git notes get-ref (--ref)
# passed all 111 test(s)
1..111
