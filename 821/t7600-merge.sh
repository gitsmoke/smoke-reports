ok 1 - setup
ok 2 - test option parsing
ok 3 - merge -h with invalid index
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
ok 20 - merge c1 with c2 (log in config)
ok 21 - merge c1 with c2 (log in config gets overridden)
ok 22 - merge c1 with c2 (squash in config)
ok 23 - override config option -n with --summary
ok 24 - override config option -n with --stat
ok 25 - override config option --stat
ok 26 - merge c1 with c2 (override --no-commit)
ok 27 - merge c1 with c2 (override --squash)
ok 28 - merge c0 with c1 (no-ff)
ok 29 - combining --squash and --no-ff is refused
ok 30 - combining --ff-only and --no-ff is refused
ok 31 - merge c0 with c1 (ff overrides no-ff)
ok 32 - merge log message
ok 33 - merge c1 with c0, c2, c0, and c1
ok 34 - merge c1 with c0, c2, c0, and c1
ok 35 - merge c1 with c1 and c2
ok 36 - merge fast-forward in a dirty tree
ok 37 - in-index merge
ok 38 - refresh the index before merging
ok 39 - merge early part of c2
ok 40 - merge --no-ff --no-commit && commit
ok 41 - amending no-ff merge commit
# passed all 41 test(s)
1..41
