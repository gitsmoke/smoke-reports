ok 1 - setup
ok 2 - fetch --recurse-submodules recurses into submodules
ok 3 - fetch alone only fetches superproject
ok 4 - fetch --no-recurse-submodules only fetches superproject
ok 5 - using fetchRecurseSubmodules=true in .gitmodules recurses into submodules
ok 6 - --no-recurse-submodules overrides .gitmodules config
ok 7 - using fetchRecurseSubmodules=false in .git/config overrides setting in .gitmodules
ok 8 - --recurse-submodules overrides fetchRecurseSubmodules setting from .git/config
ok 9 - --quiet propagates to submodules
ok 10 - --dry-run propagates to submodules
ok 11 - recurseSubmodules=true propagates into submodules
ok 12 - --recurse-submodules overrides config in submodule
ok 13 - --no-recurse-submodules overrides config setting
ok 14 - Recursion doesn't happen when no new commits are fetched in the superproject
ok 15 - Recursion stops when no new submodule commits are fetched
ok 16 - Recursion doesn't happen when new superproject commits don't change any submodules
ok 17 - Recursion picks up config in submodule
ok 18 - Recursion picks up all submodules when necessary
ok 19 - '--recurse-submodules=on-demand' doesn't recurse when no new commits are fetched in the superproject (and ignores config)
ok 20 - '--recurse-submodules=on-demand' recurses as deep as necessary (and ignores config)
ok 21 - '--recurse-submodules=on-demand' stops when no new submodule commits are found in the superproject (and ignores config)
ok 22 - 'fetch.recurseSubmodules=on-demand' overrides global config
ok 23 - 'submodule.<sub>.fetchRecurseSubmodules=on-demand' overrides fetch.recurseSubmodules
ok 24 - don't fetch submodule when newly recorded commits are already present
# passed all 24 test(s)
1..24
