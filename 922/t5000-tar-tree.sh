ok 1 - populate workdir
ok 2 - add ignored file
ok 3 - add files to repository
ok 4 - create bare clone
ok 5 - remove ignored file
ok 6 - git archive
ok 7 - git tar-tree
ok 8 - git archive vs. git tar-tree
ok 9 - git archive in a bare repo
ok 10 - git archive vs. the same in a bare repo
ok 11 - git archive with --output
ok 12 - git archive --remote
ok 13 - validate file modification time
ok 14 - git get-tar-commit-id
ok 15 - extract tar archive
ok 16 - validate filenames
ok 17 - validate file contents
ok 18 - git tar-tree with prefix
ok 19 - extract tar archive with prefix
ok 20 - validate filenames with prefix
ok 21 - validate file contents with prefix
ok 22 - create archives with substfiles
ok 23 - extract substfiles
ok 24 - validate substfile contents
ok 25 - extract substfiles from archive with prefix
ok 26 - validate substfile contents from archive with prefix
ok 27 - git archive --format=zip
ok 28 - git archive --format=zip in a bare repo
ok 29 - git archive --format=zip vs. the same in a bare repo
ok 30 - git archive --format=zip with --output
ok 31 - git archive with --output, inferring format
ok 32 - git archive with --output, override inferred format
ok 33 - extract ZIP archive
ok 34 - validate filenames
ok 35 - validate file contents
ok 36 - git archive --format=zip with prefix
ok 37 - extract ZIP archive with prefix
ok 38 - validate filenames with prefix
ok 39 - validate file contents with prefix
ok 40 - git archive --list outside of a git repo
ok 41 - git-archive --prefix=olde-
ok 42 - setup tar filters
ok 43 - archive --list mentions user filter
ok 44 - archive --list shows only enabled remote filters
ok 45 - invoke tar filter by format
ok 46 - invoke tar filter by extension
ok 47 - default output format remains tar
ok 48 - extension matching requires dot
ok 49 - only enabled filters are available remotely
ok 50 - git archive --format=tgz
ok 51 - git archive --format=tar.gz
ok 52 - infer tgz from .tgz filename
ok 53 - infer tgz from .tar.gz filename
ok 54 - extract tgz file
ok 55 - remote tar.gz is allowed by default
ok 56 - remote tar.gz can be disabled
# passed all 56 test(s)
1..56
