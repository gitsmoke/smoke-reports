ok 1 - plain
ok 2 - plain with GIT_WORK_TREE
ok 3 - plain bare
ok 4 - plain bare with GIT_WORK_TREE
ok 5 - GIT_DIR bare
ok 6 - init --bare
ok 7 - GIT_DIR non-bare
ok 8 - GIT_DIR & GIT_WORK_TREE (1)
ok 9 - GIT_DIR & GIT_WORK_TREE (2)
ok 10 - reinit
ok 11 - init with --template
ok 12 - init with --template (blank)
ok 13 - init with init.templatedir set
ok 14 - init --bare/--shared overrides system/global config
ok 15 - init honors global core.sharedRepository
ok 16 - init rejects insanely long --template
ok 17 - init creates a new directory
ok 18 - init creates a new bare directory
ok 19 - init recreates a directory
ok 20 - init recreates a new bare directory
ok 21 - init creates a new deep directory
ok 22 - init creates a new deep directory (umask vs. shared)
ok 23 - init notices EEXIST (1)
ok 24 - init notices EEXIST (2)
ok 25 # skip init notices EPERM (missing SANITY of POSIXPERM,SANITY)
ok 26 - init creates a new bare directory with global --bare
ok 27 - init prefers command line to GIT_DIR
# passed all 27 test(s)
1..27
