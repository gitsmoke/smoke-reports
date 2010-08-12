ok 1 - determine default pager
ok 2 - set up terminal for tests
# no usable terminal, so skipping some tests
ok 3 - setup
ok 4 # skip some commands use a pager
ok 5 # skip some commands do not use a pager
ok 6 - no pager when stdout is a pipe
ok 7 - no pager when stdout is a regular file
ok 8 # skip git --paginate rev-list uses a pager
ok 9 - no pager even with --paginate when stdout is a pipe
ok 10 # skip no pager with --no-pager
ok 11 - tests can detect color
ok 12 - no color when stdout is a regular file
ok 13 # skip color when writing to a pager
ok 14 - color when writing to a file intended for a pager
ok 15 - setup: some aliases
ok 16 # skip git log - default pager is used by default
ok 17 # skip git log - PAGER overrides default pager
ok 18 # skip git log - repository-local core.pager setting overrides PAGER
ok 19 # skip git log - core.pager overrides PAGER from subdirectory
ok 20 # skip git log - GIT_PAGER overrides core.pager
ok 21 # skip git -p log - default pager is used by default
ok 22 # skip git -p log - PAGER overrides default pager
ok 23 # skip git -p log - repository-local core.pager setting overrides PAGER
ok 24 # skip git -p log - core.pager overrides PAGER from subdirectory
ok 25 # skip git -p log - GIT_PAGER overrides core.pager
ok 26 # skip git aliasedlog - default pager is used by default
ok 27 # skip git aliasedlog - PAGER overrides default pager
ok 28 # skip git aliasedlog - repository-local core.pager setting overrides PAGER
ok 29 # skip git aliasedlog - core.pager overrides PAGER from subdirectory
ok 30 # skip git aliasedlog - GIT_PAGER overrides core.pager
ok 31 # skip git -p aliasedlog - default pager is used by default
ok 32 # skip git -p aliasedlog - PAGER overrides default pager
ok 33 # skip git -p aliasedlog - repository-local core.pager setting overrides PAGER
ok 34 # skip git -p aliasedlog - core.pager overrides PAGER from subdirectory
ok 35 # skip git -p aliasedlog - GIT_PAGER overrides core.pager
ok 36 # skip git -p true - default pager is used by default
ok 37 # skip git -p true - PAGER overrides default pager
ok 38 # skip git -p true - repository-local core.pager setting overrides PAGER
ok 39 # skip git -p true - core.pager overrides PAGER from subdirectory
ok 40 # skip git -p true - GIT_PAGER overrides core.pager
ok 41 # skip git -p request-pull - default pager is used by default
ok 42 # skip git -p request-pull - PAGER overrides default pager
ok 43 # skip git -p request-pull - repository-local core.pager setting overrides PAGER
ok 44 # skip git -p request-pull - core.pager overrides PAGER from subdirectory
ok 45 # skip git -p request-pull - GIT_PAGER overrides core.pager
ok 46 # skip git -p - default pager is used by default
ok 47 # skip git -p - PAGER overrides default pager
ok 48 # skip git -p - repository-local core.pager setting is not used
ok 49 # skip git -p - core.pager is not used from subdirectory
ok 50 # skip git -p - GIT_PAGER overrides core.pager
ok 51 # skip no pager for 'git -p nonsense'
# passed all 51 test(s)
1..51
