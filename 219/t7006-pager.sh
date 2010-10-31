ok 1 - determine default pager
ok 2 - set up terminal for tests
ok 3 - setup
ok 4 - some commands use a pager
not ok 5 - pager runs from subdir # TODO known breakage
ok 6 - some commands do not use a pager
ok 7 - no pager when stdout is a pipe
ok 8 - no pager when stdout is a regular file
ok 9 - git --paginate rev-list uses a pager
ok 10 - no pager even with --paginate when stdout is a pipe
ok 11 - no pager with --no-pager
ok 12 - configuration can disable pager
ok 13 - git config uses a pager if configured to
ok 14 - configuration can enable pager (from subdir)
ok 15 - tests can detect color
ok 16 - no color when stdout is a regular file
ok 17 - color when writing to a pager
ok 18 - color when writing to a file intended for a pager
ok 19 - setup: some aliases
ok 20 - git log - default pager is used by default
ok 21 - git log - PAGER overrides default pager
ok 22 - git log - repository-local core.pager setting overrides PAGER
ok 23 - git log - core.pager overrides PAGER from subdirectory
ok 24 - git log - GIT_PAGER overrides core.pager
ok 25 - git -p log - default pager is used by default
ok 26 - git -p log - PAGER overrides default pager
ok 27 - git -p log - repository-local core.pager setting overrides PAGER
ok 28 - git -p log - core.pager overrides PAGER from subdirectory
ok 29 - git -p log - GIT_PAGER overrides core.pager
ok 30 - git aliasedlog - default pager is used by default
ok 31 - git aliasedlog - PAGER overrides default pager
ok 32 - git aliasedlog - repository-local core.pager setting overrides PAGER
not ok - 33 git aliasedlog - core.pager overrides PAGER from subdirectory
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used &&
#			rm -fr sub ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			stampname=$(pwd)/core.pager_used &&
#			export PAGER stampname &&
#			git config core.pager 'wc >"$stampname"' &&
#			mkdir sub &&
#			(
#				cd sub &&
#				test_terminal  git aliasedlog
#			) &&
#			test -e core.pager_used
#		
ok 34 - git aliasedlog - GIT_PAGER overrides core.pager
ok 35 - git -p aliasedlog - default pager is used by default
ok 36 - git -p aliasedlog - PAGER overrides default pager
ok 37 - git -p aliasedlog - repository-local core.pager setting overrides PAGER
not ok 38 - git -p aliasedlog - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 39 - git -p aliasedlog - GIT_PAGER overrides core.pager
ok 40 - git -p true - default pager is used by default
ok 41 - git -p true - PAGER overrides default pager
ok 42 - git -p true - repository-local core.pager setting overrides PAGER
not ok 43 - git -p true - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 44 - git -p true - GIT_PAGER overrides core.pager
ok 45 - git -p request-pull - default pager is used by default
ok 46 - git -p request-pull - PAGER overrides default pager
ok 47 - git -p request-pull - repository-local core.pager setting overrides PAGER
not ok 48 - git -p request-pull - core.pager overrides PAGER from subdirectory # TODO known breakage
ok 49 - git -p request-pull - GIT_PAGER overrides core.pager
ok 50 - git -p - default pager is used by default
ok 51 - git -p - PAGER overrides default pager
not ok 52 - git -p - repository-local core.pager setting is not used # TODO known breakage
ok 53 - git -p - core.pager is not used from subdirectory
ok 54 - git -p - GIT_PAGER overrides core.pager
not ok 55 - no pager for 'git -p nonsense' # TODO known breakage
ok 56 - git shortlog - default pager is used by default
ok 57 - git shortlog - PAGER overrides default pager
ok 58 - git shortlog - repository-local core.pager setting overrides PAGER
ok 59 - git shortlog - core.pager overrides PAGER from subdirectory
ok 60 - git shortlog - GIT_PAGER overrides core.pager
ok 61 - setup: configure shortlog not to paginate
ok 62 - no pager for 'git shortlog'
ok 63 - git shortlog - core.pager is not used from subdirectory
ok 64 - git -p shortlog - default pager is used by default
ok 65 - git -p shortlog - core.pager overrides PAGER from subdirectory
ok 66 - git -p apply </dev/null - core.pager overrides PAGER from subdirectory
# still have 6 known breakage(s)
# failed 1 among remaining 60 test(s)
1..66
