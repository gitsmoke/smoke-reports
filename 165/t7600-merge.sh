ok 1 - set up test data and helpers
ok 2 - setup
ok 3 - test option parsing
ok 4 - reject non-strategy with a git-merge-foo name
ok 5 - merge c0 with c1
ok 6 - merge c0 with c1 with --ff-only
ok 7 - merge from unborn branch
ok 8 - merge c1 with c2
ok 9 - merge c1 with c2 and c3
ok 10 - failing merges with --ff-only
ok 11 - merge c0 with c1 (no-commit)
ok 12 - merge c1 with c2 (no-commit)
ok 13 - merge c1 with c2 and c3 (no-commit)
ok 14 - merge c0 with c1 (squash)
ok 15 - merge c0 with c1 (squash, ff-only)
ok 16 - merge c1 with c2 (squash)
ok 17 - unsuccesful merge of c1 with c2 (squash, ff-only)
ok 18 - merge c1 with c2 and c3 (squash)
ok 19 - merge c1 with c2 (no-commit in config)
ok 20 - merge c1 with c2 (squash in config)
ok 21 - override config option -n with --summary
ok 22 - override config option -n with --stat
ok 23 - override config option --stat
ok 24 - merge c1 with c2 (override --no-commit)
ok 25 - merge c1 with c2 (override --squash)
ok 26 - merge c0 with c1 (no-ff)
ok 27 - combining --squash and --no-ff is refused
ok 28 - combining --ff-only and --no-ff is refused
ok 29 - merge c0 with c1 (ff overrides no-ff)
ok 30 - merge log message
ok 31 - merge c1 with c0, c2, c0, and c1
ok 32 - merge c1 with c0, c2, c0, and c1
ok 33 - merge c1 with c1 and c2
ok 34 - merge fast-forward in a dirty tree
ok 35 - in-index merge
ok 36 - refresh the index before merging
ok 37 - merge early part of c2
ok 38 - merge --no-ff --no-commit && commit
ok 39 - amending no-ff merge commit
# passed all 39 test(s)
1..39
