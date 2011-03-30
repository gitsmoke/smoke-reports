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
ok 12 - cannot add note where one exists
ok 13 - can overwrite existing note with "git notes add -f"
ok 14 - show notes
ok 15 - create multi-line notes (setup)
ok 16 - show multi-line notes
ok 17 - create -F notes (setup)
ok 18 - show -F notes
ok 19 - git log --pretty=raw does not show notes
ok 20 - git log --show-notes
ok 21 - git log --no-notes
ok 22 - git format-patch does not show notes
ok 23 - git format-patch --show-notes does show notes
ok 24 - git show  does show notes
ok 25 - git show --pretty does not show notes
ok 26 - git show --pretty=raw does not show notes
ok 27 - git show --pretty=short does not show notes
ok 28 - git show --pretty=medium does not show notes
ok 29 - git show --pretty=full does not show notes
ok 30 - git show --pretty=fuller does not show notes
ok 31 - git show --pretty=format:%s does not show notes
ok 32 - git show --oneline does not show notes
ok 33 - setup alternate notes ref
ok 34 - git log --notes shows default notes
ok 35 - git log --notes=X shows only X
ok 36 - git log --notes --notes=X shows both
ok 37 - git log --no-notes resets default state
ok 38 - git log --no-notes resets ref list
ok 39 - create -m notes (setup)
ok 40 - show -m notes
ok 41 - remove note with add -f -F /dev/null (setup)
ok 42 - verify note removal with -F /dev/null
ok 43 - do not create empty note with -m "" (setup)
ok 44 - verify non-creation of note with -m ""
ok 45 - create note with combination of -m and -F
ok 46 - remove note with "git notes remove" (setup)
ok 47 - verify note removal with "git notes remove"
ok 48 - removing non-existing note should not create new commit
ok 49 - list notes with "git notes list"
ok 50 - list notes with "git notes"
ok 51 - list specific note with "git notes list <object>"
ok 52 - listing non-existing notes fails
ok 53 - append to existing note with "git notes append"
ok 54 - "git notes list" does not expand to "git notes list HEAD"
ok 55 - appending empty string does not change existing note
ok 56 - git notes append == add when there is no existing note
ok 57 - appending empty string to non-existing note does not create note
ok 58 - create other note on a different notes ref (setup)
ok 59 - Do not show note on other ref by default
ok 60 - Do show note when ref is given in GIT_NOTES_REF
ok 61 - Do show note when ref is given in core.notesRef config
ok 62 - Do not show note when core.notesRef is overridden
ok 63 - Show all notes when notes.displayRef=refs/notes/*
ok 64 - core.notesRef is implicitly in notes.displayRef
ok 65 - notes.displayRef can be given more than once
ok 66 - notes.displayRef respects order
ok 67 - GIT_NOTES_DISPLAY_REF works
ok 68 - GIT_NOTES_DISPLAY_REF overrides config
ok 69 - --show-notes=* adds to GIT_NOTES_DISPLAY_REF
ok 70 - --no-standard-notes
ok 71 - --standard-notes
ok 72 - --show-notes=ref accumulates
ok 73 - Allow notes on non-commits (trees, blobs, tags)
ok 74 - create note from other note with "git notes add -C"
ok 75 - create note from non-existing note with "git notes add -C" fails
ok 76 - create note from other note with "git notes add -c"
ok 77 - create note from non-existing note with "git notes add -c" fails
ok 78 - append to note from other note with "git notes append -C"
ok 79 - create note from other note with "git notes append -c"
ok 80 - append to note from other note with "git notes append -c"
ok 81 - copy note with "git notes copy"
ok 82 - prevent overwrite with "git notes copy"
ok 83 - allow overwrite with "git notes copy -f"
ok 84 - cannot copy note from object without notes
ok 85 - git notes copy --stdin
ok 86 - git notes copy --for-rewrite (unconfigured)
ok 87 - git notes copy --for-rewrite (enabled)
ok 88 - git notes copy --for-rewrite (disabled)
ok 89 - git notes copy --for-rewrite (overwrite)
ok 90 - git notes copy --for-rewrite (ignore)
ok 91 - git notes copy --for-rewrite (append)
ok 92 - git notes copy --for-rewrite (append two to one)
ok 93 - git notes copy --for-rewrite (append empty)
ok 94 - GIT_NOTES_REWRITE_MODE works
ok 95 - GIT_NOTES_REWRITE_REF works
ok 96 - GIT_NOTES_REWRITE_REF overrides config
ok 97 - git notes copy diagnoses too many or too few parameters
ok 98 - git notes get-ref (no overrides)
ok 99 - git notes get-ref (core.notesRef)
ok 100 - git notes get-ref (GIT_NOTES_REF)
ok 101 - git notes get-ref (--ref)
# passed all 101 test(s)
1..101
