ok 1 - setup binary merge conflict
ok 2 - diff -m indicates binary-ness
ok 3 - diff -c indicates binary-ness
ok 4 - diff --cc indicates binary-ness
ok 5 - setup non-binary with binary attribute
ok 6 - diff -m respects binary attribute
ok 7 - diff -c respects binary attribute
ok 8 - diff --cc respects binary attribute
ok 9 - setup textconv attribute
ok 10 - diff -m respects textconv attribute
ok 11 - diff -c respects textconv attribute
ok 12 - diff --cc respects textconv attribute
ok 13 - diff-tree plumbing does not respect textconv
ok 14 - diff --cc respects textconv on worktree file
# passed all 14 test(s)
1..14
