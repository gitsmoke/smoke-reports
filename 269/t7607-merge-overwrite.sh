ok 1 - setup
ok 2 - will not overwrite untracked file
ok 3 - will overwrite tracked file
ok 4 - will not overwrite new file
ok 5 - will not overwrite staged changes
ok 6 - will not overwrite removed file
ok 7 - will not overwrite re-added file
ok 8 - will not overwrite removed file with staged changes
ok 9 - will not overwrite untracked subtree
ok 10 - will not overwrite untracked file in leading path
not ok 11 - will not overwrite untracked symlink in leading path # TODO known breakage
ok 12 - will not be confused by symlink in leading path
ok 13 - will not overwrite untracked file on unborn branch
# still have 1 known breakage(s)
# passed all remaining 12 test(s)
1..13
