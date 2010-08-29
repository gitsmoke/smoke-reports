ok 1 - prepare a trivial repository
ok 2 - git branch --help should not have created a bogus branch
ok 3 - git branch abc should create a branch
ok 4 - git branch a/b/c should create a branch
ok 5 - git branch -l d/e/f should create a branch and a log
ok 6 - git branch -d d/e/f should delete a branch and a log
ok 7 - git branch j/k should work after branch j has been deleted
ok 8 - git branch l should work after branch l/m has been deleted
ok 9 - git branch -m m m/m should work
ok 10 - git branch -m n/n n should work
ok 11 - git branch -m o/o o should fail when o/p exists
ok 12 - git branch -m q r/q should fail when r exists
ok 13 - git branch -m q q2 without config should succeed
ok 14 - git branch -m s/s s should work when s/t is deleted
ok 15 - config information was renamed, too
ok 16 - renaming a symref is not allowed
ok 17 # skip git branch -m u v should fail when the reflog for u is a symlink (missing SYMLINKS of SYMLINKS)
ok 18 - test tracking setup via --track
ok 19 - test tracking setup (non-wildcard, matching)
ok 20 - test tracking setup (non-wildcard, not matching)
ok 21 - test tracking setup via config
ok 22 - test overriding tracking setup via --no-track
ok 23 - no tracking without .fetch entries
ok 24 - test tracking setup via --track but deeper
ok 25 - test deleting branch deletes branch config
ok 26 - test deleting branch without config
ok 27 - test --track without .fetch entries
ok 28 - branch from non-branch HEAD w/autosetupmerge=always
ok 29 - branch from non-branch HEAD w/--track causes failure
ok 30 - git checkout -b g/h/i -l should create a branch and a log
ok 31 - checkout -b makes reflog by default
ok 32 - checkout -b does not make reflog when core.logAllRefUpdates = false
ok 33 - checkout -b with -l makes reflog when core.logAllRefUpdates = false
ok 34 - avoid ambiguous track
ok 35 - autosetuprebase local on a tracked local branch
ok 36 - autosetuprebase always on a tracked local branch
ok 37 - autosetuprebase remote on a tracked local branch
ok 38 - autosetuprebase never on a tracked local branch
ok 39 - autosetuprebase local on a tracked remote branch
ok 40 - autosetuprebase never on a tracked remote branch
ok 41 - autosetuprebase remote on a tracked remote branch
ok 42 - autosetuprebase always on a tracked remote branch
ok 43 - autosetuprebase unconfigured on a tracked remote branch
ok 44 - autosetuprebase unconfigured on a tracked local branch
ok 45 - autosetuprebase unconfigured on untracked local branch
ok 46 - autosetuprebase unconfigured on untracked remote branch
ok 47 - autosetuprebase never on an untracked local branch
ok 48 - autosetuprebase local on an untracked local branch
ok 49 - autosetuprebase remote on an untracked local branch
ok 50 - autosetuprebase always on an untracked local branch
ok 51 - autosetuprebase never on an untracked remote branch
ok 52 - autosetuprebase local on an untracked remote branch
ok 53 - autosetuprebase remote on an untracked remote branch
ok 54 - autosetuprebase always on an untracked remote branch
ok 55 - detect misconfigured autosetuprebase (bad value)
ok 56 - detect misconfigured autosetuprebase (no value)
ok 57 - attempt to delete a branch without base and unmerged to HEAD
ok 58 - attempt to delete a branch merged to its base
ok 59 - attempt to delete a branch merged to its base
# passed all 59 test(s)
1..59
