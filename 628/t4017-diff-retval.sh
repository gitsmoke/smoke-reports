ok 1 - setup
ok 2 - git diff --quiet -w  HEAD^^ HEAD^
ok 3 - git diff --quiet HEAD^^ HEAD^
ok 4 - git diff --quiet -w  HEAD^ HEAD
ok 5 - git diff-tree HEAD^ HEAD
ok 6 - git diff-tree HEAD^ HEAD -- a
ok 7 - git diff-tree HEAD^ HEAD -- b
ok 8 - echo HEAD | git diff-tree --stdin
ok 9 - git diff-tree HEAD HEAD
ok 10 - git diff-files
ok 11 - git diff-index --cached HEAD
ok 12 - git diff-index --cached HEAD^
ok 13 - git diff-index --cached HEAD^
ok 14 - git diff-tree -Stext HEAD^ HEAD -- b
ok 15 - git diff-tree -Snot-found HEAD^ HEAD -- b
ok 16 - git diff-files
ok 17 - git diff-index --cached HEAD
ok 18 - --check --exit-code returns 0 for no difference
ok 19 - --check --exit-code returns 1 for a clean difference
ok 20 - --check --exit-code returns 3 for a dirty difference
ok 21 - --check with --no-pager returns 2 for dirty difference
ok 22 - check should test not just the last line
ok 23 - check detects leftover conflict markers
ok 24 - check honors conflict marker length
# passed all 24 test(s)
1..24
