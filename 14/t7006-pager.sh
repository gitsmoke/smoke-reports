ok 1 - determine default pager
ok 2 - set up terminal for tests
ok 3 - setup
ok 4 - some commands use a pager
ok 5 - some commands do not use a pager
ok 6 - no pager when stdout is a pipe
ok 7 - no pager when stdout is a regular file
ok 8 - git --paginate rev-list uses a pager
ok 9 - no pager even with --paginate when stdout is a pipe
ok 10 - no pager with --no-pager
ok 11 - tests can detect color
ok 12 - no color when stdout is a regular file
ok 13 - color when writing to a pager
ok 14 - color when writing to a file intended for a pager
ok 15 - setup: some aliases
ok 16 - git log - default pager is used by default
ok 17 - git log - PAGER overrides default pager
ok 18 - git log - repository-local core.pager setting overrides PAGER
ok 19 - git log - core.pager overrides PAGER from subdirectory
ok 20 - git log - GIT_PAGER overrides core.pager
ok 21 - git -p log - default pager is used by default
ok 22 - git -p log - PAGER overrides default pager
ok 23 - git -p log - repository-local core.pager setting overrides PAGER
ok 24 - git -p log - core.pager overrides PAGER from subdirectory
ok 25 - git -p log - GIT_PAGER overrides core.pager
ok 26 - git aliasedlog - default pager is used by default
ok 27 - git aliasedlog - PAGER overrides default pager
ok 28 - git aliasedlog - repository-local core.pager setting overrides PAGER
ok 29 - git aliasedlog - core.pager overrides PAGER from subdirectory
ok 30 - git aliasedlog - GIT_PAGER overrides core.pager
ok 31 - git -p aliasedlog - default pager is used by default
ok 32 - git -p aliasedlog - PAGER overrides default pager
ok 33 - git -p aliasedlog - repository-local core.pager setting overrides PAGER
not ok 34 - git -p aliasedlog - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 35 - git -p aliasedlog - GIT_PAGER overrides core.pager
ok 36 - git -p true - default pager is used by default
ok 37 - git -p true - PAGER overrides default pager
ok 38 - git -p true - repository-local core.pager setting overrides PAGER
not ok 39 - git -p true - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 40 - git -p true - GIT_PAGER overrides core.pager
ok 41 - git -p request-pull - default pager is used by default
ok 42 - git -p request-pull - PAGER overrides default pager
ok 43 - git -p request-pull - repository-local core.pager setting overrides PAGER
not ok 44 - git -p request-pull - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 45 - git -p request-pull - GIT_PAGER overrides core.pager
ok 46 - git -p - default pager is used by default
ok 47 - git -p - PAGER overrides default pager
not ok 48 - git -p - repository-local core.pager setting is not used # TODO known breakage
ok 49 - git -p - core.pager is not used from subdirectory
ok 50 - git -p - GIT_PAGER overrides core.pager
not ok 51 - no pager for 'git -p nonsense' # TODO known breakage
# still have 5 known breakage(s)
# passed all remaining 46 test(s)
1..51
