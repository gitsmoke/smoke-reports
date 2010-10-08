ok 1 - determine default pager
ok 2 - set up terminal for tests
# no usable terminal, so skipping some tests
ok 3 - setup
ok 4 # skip some commands use a pager (missing TTY)
ok 5 # skip pager runs from subdir (missing TTY)
ok 6 # skip some commands do not use a pager (missing TTY)
ok 7 - no pager when stdout is a pipe
ok 8 - no pager when stdout is a regular file
ok 9 # skip git --paginate rev-list uses a pager (missing TTY)
ok 10 - no pager even with --paginate when stdout is a pipe
ok 11 # skip no pager with --no-pager (missing TTY)
ok 12 # skip configuration can disable pager (missing TTY)
ok 13 # skip git config uses a pager if configured to (missing TTY)
ok 14 # skip configuration can enable pager (from subdir) (missing TTY)
ok 15 - tests can detect color
ok 16 - no color when stdout is a regular file
ok 17 # skip color when writing to a pager (missing TTY)
ok 18 - color when writing to a file intended for a pager
ok 19 - setup: some aliases
ok 20 # skip git log - default pager is used by default (missing SIMPLEPAGERTTY)
ok 21 # skip git log - PAGER overrides default pager (missing TTY)
ok 22 # skip git log - repository-local core.pager setting overrides PAGER (missing TTY)
ok 23 # skip git log - core.pager overrides PAGER from subdirectory (missing TTY)
ok 24 # skip git log - GIT_PAGER overrides core.pager (missing TTY)
ok 25 # skip git -p log - default pager is used by default (missing SIMPLEPAGERTTY)
ok 26 # skip git -p log - PAGER overrides default pager (missing TTY)
ok 27 # skip git -p log - repository-local core.pager setting overrides PAGER (missing TTY)
ok 28 # skip git -p log - core.pager overrides PAGER from subdirectory (missing TTY)
ok 29 # skip git -p log - GIT_PAGER overrides core.pager (missing TTY)
ok 30 # skip git aliasedlog - default pager is used by default (missing SIMPLEPAGERTTY)
ok 31 # skip git aliasedlog - PAGER overrides default pager (missing TTY)
ok 32 # skip git aliasedlog - repository-local core.pager setting overrides PAGER (missing TTY)
ok 33 # skip git aliasedlog - core.pager overrides PAGER from subdirectory (missing TTY)
ok 34 # skip git aliasedlog - GIT_PAGER overrides core.pager (missing TTY)
ok 35 # skip git -p aliasedlog - default pager is used by default (missing SIMPLEPAGERTTY)
ok 36 # skip git -p aliasedlog - PAGER overrides default pager (missing TTY)
ok 37 # skip git -p aliasedlog - repository-local core.pager setting overrides PAGER (missing TTY)
ok 38 # skip git -p aliasedlog - core.pager overrides PAGER from subdirectory (missing TTY)
ok 39 # skip git -p aliasedlog - GIT_PAGER overrides core.pager (missing TTY)
ok 40 # skip git -p true - default pager is used by default (missing SIMPLEPAGERTTY)
ok 41 # skip git -p true - PAGER overrides default pager (missing TTY)
ok 42 # skip git -p true - repository-local core.pager setting overrides PAGER (missing TTY)
ok 43 # skip git -p true - core.pager overrides PAGER from subdirectory (missing TTY)
ok 44 # skip git -p true - GIT_PAGER overrides core.pager (missing TTY)
ok 45 # skip git -p request-pull - default pager is used by default (missing SIMPLEPAGERTTY)
ok 46 # skip git -p request-pull - PAGER overrides default pager (missing TTY)
ok 47 # skip git -p request-pull - repository-local core.pager setting overrides PAGER (missing TTY)
ok 48 # skip git -p request-pull - core.pager overrides PAGER from subdirectory (missing TTY)
ok 49 # skip git -p request-pull - GIT_PAGER overrides core.pager (missing TTY)
ok 50 # skip git -p - default pager is used by default (missing SIMPLEPAGERTTY)
ok 51 # skip git -p - PAGER overrides default pager (missing TTY)
ok 52 # skip git -p - repository-local core.pager setting is not used (missing TTY)
ok 53 # skip git -p - core.pager is not used from subdirectory (missing TTY)
ok 54 # skip git -p - GIT_PAGER overrides core.pager (missing TTY)
ok 55 # skip no pager for 'git -p nonsense' (missing TTY)
ok 56 # skip git shortlog - default pager is used by default (missing SIMPLEPAGERTTY)
ok 57 # skip git shortlog - PAGER overrides default pager (missing TTY)
ok 58 # skip git shortlog - repository-local core.pager setting overrides PAGER (missing TTY)
ok 59 # skip git shortlog - core.pager overrides PAGER from subdirectory (missing TTY)
ok 60 # skip git shortlog - GIT_PAGER overrides core.pager (missing TTY)
ok 61 - setup: configure shortlog not to paginate
ok 62 # skip no pager for 'git shortlog' (missing TTY)
ok 63 # skip git shortlog - core.pager is not used from subdirectory (missing TTY)
ok 64 # skip git -p shortlog - default pager is used by default (missing SIMPLEPAGERTTY)
ok 65 # skip git -p shortlog - core.pager overrides PAGER from subdirectory (missing TTY)
ok 66 # skip git -p apply </dev/null - core.pager overrides PAGER from subdirectory (missing TTY)
# passed all 66 test(s)
1..66
