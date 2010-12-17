ok 1 - Setup
ok 2 - --orphan creates a new orphan branch from HEAD
ok 3 - --orphan creates a new orphan branch from <start_point>
ok 4 - --orphan must be rejected with -b
ok 5 - --orphan must be rejected with -t
ok 6 - --orphan ignores branch.autosetupmerge
ok 7 - --orphan makes reflog by default
ok 8 - --orphan does not make reflog when core.logAllRefUpdates = false
ok 9 - --orphan with -l makes reflog when core.logAllRefUpdates = false
ok 10 - giving up --orphan not committed when -l and core.logAllRefUpdates = false deletes reflog
ok 11 - --orphan is rejected with an existing name
ok 12 - --orphan refuses to switch if a merge is needed
# passed all 12 test(s)
1..12
