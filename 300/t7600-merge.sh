ok 1 - set up test data and helpers
ok 2 - setup
ok 3 - test option parsing
ok 4 - merge -h with invalid index
ok 5 - reject non-strategy with a git-merge-foo name
ok 6 - merge c0 with c1
ok 7 - merge c0 with c1 with --ff-only
ok 8 - merge from unborn branch
ok 9 - merge c1 with c2
ok 10 - merge c1 with c2 and c3
ok 11 - failing merges with --ff-only
ok 12 - merge c0 with c1 (no-commit)
ok 13 - merge c1 with c2 (no-commit)
ok 14 - merge c1 with c2 and c3 (no-commit)
ok 15 - merge c0 with c1 (squash)
ok 16 - merge c0 with c1 (squash, ff-only)
ok 17 - merge c1 with c2 (squash)
ok 18 - unsuccesful merge of c1 with c2 (squash, ff-only)
ok 19 - merge c1 with c2 and c3 (squash)
ok 20 - merge c1 with c2 (no-commit in config)
ok 21 - merge c1 with c2 (squash in config)
ok 22 - override config option -n with --summary
ok 23 - override config option -n with --stat
ok 24 - override config option --stat
ok 25 - merge c1 with c2 (override --no-commit)
ok 26 - merge c1 with c2 (override --squash)
ok 27 - merge c0 with c1 (no-ff)
ok 28 - combining --squash and --no-ff is refused
ok 29 - combining --ff-only and --no-ff is refused
ok 30 - merge c0 with c1 (ff overrides no-ff)
ok 31 - merge log message
ok 32 - merge c1 with c0, c2, c0, and c1
ok 33 - merge c1 with c0, c2, c0, and c1
ok 34 - merge c1 with c1 and c2
ok 35 - merge fast-forward in a dirty tree
ok 36 - in-index merge
ok 37 - refresh the index before merging
ok 38 - merge early part of c2
ok 39 - merge --no-ff --no-commit && commit
ok 40 - amending no-ff merge commit
# passed all 40 test(s)
1..40
