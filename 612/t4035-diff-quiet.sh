ok 1 - setup
ok 2 - git diff-tree HEAD^ HEAD
ok 3 - git diff-tree HEAD^ HEAD -- a
ok 4 - git diff-tree HEAD^ HEAD -- b
ok 5 - echo HEAD | git diff-tree --stdin
ok 6 - git diff-tree HEAD HEAD
ok 7 - git diff-files
ok 8 - git diff-index --cached HEAD
ok 9 - git diff-index --cached HEAD^
ok 10 - git diff-index --cached HEAD^
ok 11 - git diff-tree -Stext HEAD^ HEAD -- b
ok 12 - git diff-tree -Snot-found HEAD^ HEAD -- b
ok 13 - git diff-files
ok 14 - git diff-index --cached HEAD
# passed all 14 test(s)
1..14
