ok 1 - setup
ok 2 - fetch --recurse-submodules recurses into submodules
ok 3 - fetch --recurse-submodules recurses into submodules: output
ok 4 - fetch alone only fetches superproject
ok 5 - fetch --no-recurse-submodules only fetches superproject
ok 6 - using fetchRecurseSubmodules=true in .gitmodules recurses into submodules
ok 7 - using fetchRecurseSubmodules=true in .gitmodules recurses into submodules
ok 8 - --no-recurse-submodules overrides .gitmodules config
ok 9 - using fetchRecurseSubmodules=false in .git/config overrides setting in .gitmodules
ok 10 - --recurse-submodules overrides fetchRecurseSubmodules setting from .git/config
ok 11 - --recurse-submodules overrides fetchRecurseSubmodules setting from .git/config: output
ok 12 - --quiet propagates to submodules
ok 13 - --dry-run propagates to submodules
ok 14 - --dry-run propagates to submodules: output
ok 15 - Without --dry-run propagates to submodules
ok 16 - Without --dry-run propagates to submodules: output
ok 17 - recurseSubmodules=true propagates into submodules
ok 18 - recurseSubmodules=true propagates into submodules: output
ok 19 - --recurse-submodules overrides config in submodule
ok 20 - --recurse-submodules overrides config in submodule: output
ok 21 - --no-recurse-submodules overrides config setting
ok 22 - Recursion doesn't happen when no new commits are fetched in the superproject
ok 23 - Recursion stops when no new submodule commits are fetched
ok 24 - Recursion doesn't happen when new superproject commits don't change any submodules
ok 25 - Recursion picks up config in submodule
ok 26 - Recursion picks up all submodules when necessary
ok 27 - '--recurse-submodules=on-demand' doesn't recurse when no new commits are fetched in the superproject (and ignores config)
ok 28 - '--recurse-submodules=on-demand' recurses as deep as necessary (and ignores config)
ok 29 - '--recurse-submodules=on-demand' stops when no new submodule commits are found in the superproject (and ignores config)
ok 30 - 'fetch.recurseSubmodules=on-demand' overrides global config
ok 31 - 'submodule.<sub>.fetchRecurseSubmodules=on-demand' overrides fetch.recurseSubmodules
ok 32 - don't fetch submodule when newly recorded commits are already present
# passed all 32 test(s)
1..32
