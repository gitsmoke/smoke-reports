ok 1 - plain
ok 2 - plain nested in bare
ok 3 - plain through aliased command, outside any git repo
not ok 4 - plain nested through aliased command # TODO known breakage
not ok 5 - plain nested in bare through aliased command # TODO known breakage
ok 6 - plain with GIT_WORK_TREE
ok 7 - plain bare
ok 8 - plain bare with GIT_WORK_TREE
ok 9 - GIT_DIR bare
ok 10 - init --bare
ok 11 - GIT_DIR non-bare
ok 12 - GIT_DIR & GIT_WORK_TREE (1)
ok 13 - GIT_DIR & GIT_WORK_TREE (2)
ok 14 - reinit
ok 15 - init with --template
ok 16 - init with --template (blank)
ok 17 - init with init.templatedir set
ok 18 - init --bare/--shared overrides system/global config
ok 19 - init honors global core.sharedRepository
ok 20 - init rejects insanely long --template
ok 21 - init creates a new directory
ok 22 - init creates a new bare directory
ok 23 - init recreates a directory
ok 24 - init recreates a new bare directory
ok 25 - init creates a new deep directory
ok 26 - init creates a new deep directory (umask vs. shared)
ok 27 - init notices EEXIST (1)
ok 28 - init notices EEXIST (2)
ok 29 # skip init notices EPERM (missing SANITY of POSIXPERM,SANITY)
ok 30 - init creates a new bare directory with global --bare
ok 31 - init prefers command line to GIT_DIR
# still have 2 known breakage(s)
# passed all remaining 29 test(s)
1..31
