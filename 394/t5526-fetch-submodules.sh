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
# passed all 13 test(s)
1..13
