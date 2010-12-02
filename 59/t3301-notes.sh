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
ok 33 - create -m notes (setup)
ok 34 - show -m notes
ok 35 - remove note with add -f -F /dev/null (setup)
ok 36 - verify note removal with -F /dev/null
ok 37 - do not create empty note with -m "" (setup)
ok 38 - verify non-creation of note with -m ""
ok 39 - create note with combination of -m and -F
ok 40 - remove note with "git notes remove" (setup)
ok 41 - verify note removal with "git notes remove"
ok 42 - removing non-existing note should not create new commit
ok 43 - list notes with "git notes list"
ok 44 - list notes with "git notes"
ok 45 - list specific note with "git notes list <object>"
ok 46 - listing non-existing notes fails
ok 47 - append to existing note with "git notes append"
ok 48 - "git notes list" does not expand to "git notes list HEAD"
ok 49 - appending empty string does not change existing note
ok 50 - git notes append == add when there is no existing note
ok 51 - appending empty string to non-existing note does not create note
ok 52 - create other note on a different notes ref (setup)
ok 53 - Do not show note on other ref by default
ok 54 - Do show note when ref is given in GIT_NOTES_REF
ok 55 - Do show note when ref is given in core.notesRef config
ok 56 - Do not show note when core.notesRef is overridden
ok 57 - Show all notes when notes.displayRef=refs/notes/*
ok 58 - core.notesRef is implicitly in notes.displayRef
ok 59 - notes.displayRef can be given more than once
ok 60 - notes.displayRef respects order
ok 61 - GIT_NOTES_DISPLAY_REF works
ok 62 - GIT_NOTES_DISPLAY_REF overrides config
ok 63 - --show-notes=* adds to GIT_NOTES_DISPLAY_REF
ok 64 - --no-standard-notes
ok 65 - --standard-notes
ok 66 - --show-notes=ref accumulates
ok 67 - Allow notes on non-commits (trees, blobs, tags)
ok 68 - create note from other note with "git notes add -C"
ok 69 - create note from non-existing note with "git notes add -C" fails
ok 70 - create note from other note with "git notes add -c"
ok 71 - create note from non-existing note with "git notes add -c" fails
ok 72 - append to note from other note with "git notes append -C"
ok 73 - create note from other note with "git notes append -c"
ok 74 - append to note from other note with "git notes append -c"
ok 75 - copy note with "git notes copy"
ok 76 - prevent overwrite with "git notes copy"
ok 77 - allow overwrite with "git notes copy -f"
ok 78 - cannot copy note from object without notes
ok 79 - git notes copy --stdin
ok 80 - git notes copy --for-rewrite (unconfigured)
ok 81 - git notes copy --for-rewrite (enabled)
ok 82 - git notes copy --for-rewrite (disabled)
ok 83 - git notes copy --for-rewrite (overwrite)
ok 84 - git notes copy --for-rewrite (ignore)
ok 85 - git notes copy --for-rewrite (append)
ok 86 - git notes copy --for-rewrite (append two to one)
ok 87 - git notes copy --for-rewrite (append empty)
ok 88 - GIT_NOTES_REWRITE_MODE works
ok 89 - GIT_NOTES_REWRITE_REF works
ok 90 - GIT_NOTES_REWRITE_REF overrides config
ok 91 - git notes copy diagnoses too many or too few parameters
# passed all 91 test(s)
1..91
