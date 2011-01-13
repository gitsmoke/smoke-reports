ok 1 - Test of git add
ok 2 - Post-check that foo is in the index
ok 3 - Test that "git add -- -q" works
ok 4 - git add: Test that executable bit is not used if core.filemode=0
ok 5 - git add: filemode=0 should not get confused by symlink
ok 6 - git update-index --add: Test that executable bit is not used...
ok 7 - git add: filemode=0 should not get confused by symlink
ok 8 - git update-index --add: Test that executable bit is not used...
ok 9 - .gitignore test setup
ok 10 - .gitignore is honored
ok 11 - error out when attempting to add ignored ones without -f
ok 12 - error out when attempting to add ignored ones without -f
ok 13 - add ignored ones with -f
ok 14 - add ignored ones with -f
ok 15 - add ignored ones with -f
ok 16 - .gitignore with subdirectory
ok 17 - check correct prefix detection
ok 18 - git add with filemode=0, symlinks=0, and unmerged entries
ok 19 - git add with filemode=0, symlinks=0 prefers stage 2 over stage 1
ok 20 - git add --refresh
ok 21 # skip git add should fail atomically upon an unreadable file (missing SANITY of POSIXPERM,SANITY)
ok 22 # skip git add --ignore-errors (missing SANITY of POSIXPERM,SANITY)
ok 23 # skip git add (add.ignore-errors) (missing SANITY of POSIXPERM,SANITY)
ok 24 # skip git add (add.ignore-errors = false) (missing SANITY of POSIXPERM,SANITY)
ok 25 # skip --no-ignore-errors overrides config (missing SANITY of POSIXPERM,SANITY)
ok 26 - git add 'fo\[ou\]bar' ignores foobar
ok 27 - git add to resolve conflicts on otherwise ignored path
ok 28 - "add non-existent" should fail
ok 29 - git add --dry-run of existing changed file
ok 30 - git add --dry-run of non-existing file
ok 31 - git add --dry-run of an existing file output
ok 32 - git add --dry-run --ignore-missing of non-existing file
ok 33 - git add --dry-run --ignore-missing of non-existing file output
# passed all 33 test(s)
1..33
