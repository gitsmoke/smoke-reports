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
# passed all 21 test(s)
1..21
