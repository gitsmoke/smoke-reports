ok 1 - prepare a trivial repository
ok 2 - git branch --help should not have created a bogus branch
ok 3 - branch -h in broken repository
ok 4 - git branch abc should create a branch
ok 5 - git branch a/b/c should create a branch
ok 6 - git branch -l d/e/f should create a branch and a log
ok 7 - git branch -d d/e/f should delete a branch and a log
ok 8 - git branch j/k should work after branch j has been deleted
ok 9 - git branch l should work after branch l/m has been deleted
ok 10 - git branch -m m m/m should work
ok 11 - git branch -m n/n n should work
ok 12 - git branch -m o/o o should fail when o/p exists
ok 13 - git branch -m q r/q should fail when r exists
ok 14 - git branch -m q q2 without config should succeed
ok 15 - git branch -m s/s s should work when s/t is deleted
ok 16 - config information was renamed, too
ok 17 - renaming a symref is not allowed
ok 18 - git branch -m u v should fail when the reflog for u is a symlink
ok 19 - test tracking setup via --track
ok 20 - test tracking setup (non-wildcard, matching)
ok 21 - test tracking setup (non-wildcard, not matching)
ok 22 - test tracking setup via config
ok 23 - test overriding tracking setup via --no-track
ok 24 - no tracking without .fetch entries
ok 25 - test tracking setup via --track but deeper
ok 26 - test deleting branch deletes branch config
ok 27 - test deleting branch without config
ok 28 - test --track without .fetch entries
ok 29 - branch from non-branch HEAD w/autosetupmerge=always
ok 30 - branch from non-branch HEAD w/--track causes failure
ok 31 - branch from tag w/--track causes failure
ok 32 - git checkout -b g/h/i -l should create a branch and a log
ok 33 - checkout -b makes reflog by default
ok 34 - checkout -b does not make reflog when core.logAllRefUpdates = false
ok 35 - checkout -b with -l makes reflog when core.logAllRefUpdates = false
ok 36 - avoid ambiguous track
ok 37 - autosetuprebase local on a tracked local branch
ok 38 - autosetuprebase always on a tracked local branch
ok 39 - autosetuprebase remote on a tracked local branch
ok 40 - autosetuprebase never on a tracked local branch
ok 41 - autosetuprebase local on a tracked remote branch
ok 42 - autosetuprebase never on a tracked remote branch
ok 43 - autosetuprebase remote on a tracked remote branch
ok 44 - autosetuprebase always on a tracked remote branch
ok 45 - autosetuprebase unconfigured on a tracked remote branch
ok 46 - autosetuprebase unconfigured on a tracked local branch
ok 47 - autosetuprebase unconfigured on untracked local branch
ok 48 - autosetuprebase unconfigured on untracked remote branch
ok 49 - autosetuprebase never on an untracked local branch
ok 50 - autosetuprebase local on an untracked local branch
ok 51 - autosetuprebase remote on an untracked local branch
ok 52 - autosetuprebase always on an untracked local branch
ok 53 - autosetuprebase never on an untracked remote branch
ok 54 - autosetuprebase local on an untracked remote branch
ok 55 - autosetuprebase remote on an untracked remote branch
ok 56 - autosetuprebase always on an untracked remote branch
ok 57 - autosetuprebase always on detached HEAD
ok 58 - detect misconfigured autosetuprebase (bad value)
ok 59 - detect misconfigured autosetuprebase (no value)
ok 60 - attempt to delete a branch without base and unmerged to HEAD
ok 61 - attempt to delete a branch merged to its base
ok 62 - attempt to delete a branch merged to its base
# passed all 62 test(s)
1..62
