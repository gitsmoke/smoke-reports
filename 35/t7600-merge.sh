ok 1 - setup
ok 2 - test option parsing
ok 3 - reject non-strategy with a git-merge-foo name
ok 4 - merge c0 with c1
ok 5 - merge c0 with c1 with --ff-only
ok 6 - merge c1 with c2
ok 7 - merge c1 with c2 and c3
ok 8 - failing merges with --ff-only
ok 9 - merge c0 with c1 (no-commit)
ok 10 - merge c1 with c2 (no-commit)
ok 11 - merge c1 with c2 and c3 (no-commit)
ok 12 - merge c0 with c1 (squash)
ok 13 - merge c0 with c1 (squash, ff-only)
ok 14 - merge c1 with c2 (squash)
ok 15 - unsuccesful merge of c1 with c2 (squash, ff-only)
ok 16 - merge c1 with c2 and c3 (squash)
ok 17 - merge c1 with c2 (no-commit in config)
ok 18 - merge c1 with c2 (squash in config)
ok 19 - override config option -n with --summary
ok 20 - override config option -n with --stat
ok 21 - override config option --stat
ok 22 - merge c1 with c2 (override --no-commit)
ok 23 - merge c1 with c2 (override --squash)
ok 24 - merge c0 with c1 (no-ff)
ok 25 - combining --squash and --no-ff is refused
ok 26 - combining --ff-only and --no-ff is refused
ok 27 - merge c0 with c1 (ff overrides no-ff)
ok 28 - merge log message
ok 29 - merge c1 with c0, c2, c0, and c1
ok 30 - merge c1 with c0, c2, c0, and c1
ok 31 - merge c1 with c1 and c2
ok 32 - merge fast-forward in a dirty tree
ok 33 - in-index merge
ok 34 - refresh the index before merging
ok 35 - merge early part of c2
ok 36 - merge --no-ff --no-commit && commit
ok 37 - amending no-ff merge commit
# passed all 37 test(s)
1..37
