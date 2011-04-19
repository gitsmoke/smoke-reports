ok 1 - load svn dump
ok 2 - all svn merges became git merge commits
ok 3 - cherry picks did not become git merge commits
ok 4 - svn non-merge merge commits did not become git merge commits
ok 5 - commit made to merged branch is reachable from the merge
ok 6 - merging two branches in one commit is detected correctly
not ok 7 - everything got merged in the end # TODO known breakage
# still have 1 known breakage(s)
# passed all remaining 6 test(s)
1..7
