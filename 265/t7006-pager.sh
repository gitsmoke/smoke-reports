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
not ok - 30 git aliasedlog - default pager is used by default
#	
#			sane_unset PAGER GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f default_pager_used ||
#			cleanup_fail &&
#	
#			cat >$less <<-\EOF &&
#			#!/bin/sh
#			wc >default_pager_used
#			EOF
#			chmod +x $less &&
#			(
#				PATH=.:$PATH &&
#				export PATH &&
#				test_terminal  git aliasedlog
#			) &&
#			test -e default_pager_used
#		
not ok - 31 git aliasedlog - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git aliasedlog &&
#			test -e PAGER_used
#		
not ok - 32 git aliasedlog - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git aliasedlog &&
#			test -e core.pager_used
#		
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
not ok - 34 git aliasedlog - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git aliasedlog &&
#			test -e GIT_PAGER_used
#		
not ok - 35 git -p aliasedlog - default pager is used by default
#	
#			sane_unset PAGER GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f default_pager_used ||
#			cleanup_fail &&
#	
#			cat >$less <<-\EOF &&
#			#!/bin/sh
#			wc >default_pager_used
#			EOF
#			chmod +x $less &&
#			(
#				PATH=.:$PATH &&
#				export PATH &&
#				test_terminal  git -p aliasedlog
#			) &&
#			test -e default_pager_used
#		
not ok - 36 git -p aliasedlog - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git -p aliasedlog &&
#			test -e PAGER_used
#		
not ok - 37 git -p aliasedlog - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git -p aliasedlog &&
#			test -e core.pager_used
#		
not ok 38 - git -p aliasedlog - core.pager overrides PAGER from subdirectory # TODO known breakage
not ok - 39 git -p aliasedlog - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git -p aliasedlog &&
#			test -e GIT_PAGER_used
#		
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
# failed 9 among remaining 60 test(s)
1..66
