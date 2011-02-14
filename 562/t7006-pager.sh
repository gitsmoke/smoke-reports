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
not ok - 11 no pager with --no-pager
#	
#		rm -f paginated.out ||
#		cleanup_fail &&
#	
#		test_terminal git --no-pager log &&
#		! test -e paginated.out
#	
not ok - 12 configuration can disable pager
#	
#		rm -f paginated.out &&
#		test_might_fail git config --unset pager.grep &&
#		test_terminal git grep initial &&
#		test -e paginated.out &&
#	
#		rm -f paginated.out &&
#		git config pager.grep false &&
#		test_when_finished "git config --unset pager.grep" &&
#		test_terminal git grep initial &&
#		! test -e paginated.out
#	
not ok - 13 git config uses a pager if configured to
#	
#		rm -f paginated.out &&
#		git config pager.config true &&
#		test_when_finished "git config --unset pager.config" &&
#		test_terminal git config --list &&
#		test -e paginated.out
#	
not ok - 14 configuration can enable pager (from subdir)
#	
#		rm -f paginated.out &&
#		mkdir -p subdir &&
#		git config pager.bundle true &&
#		test_when_finished "git config --unset pager.bundle" &&
#	
#		git bundle create test.bundle --all &&
#		rm -f paginated.out subdir/paginated.out &&
#		(
#			cd subdir &&
#			test_terminal git bundle unbundle ../test.bundle
#		) &&
#		{
#			test -e paginated.out ||
#			test -e subdir/paginated.out
#		}
#	
not ok - 15 tests can detect color
#	
#		rm -f colorful.log colorless.log ||
#		cleanup_fail &&
#	
#		git log --no-color >colorless.log &&
#		git log --color >colorful.log &&
#		! colorful colorless.log &&
#		colorful colorful.log
#	
not ok - 16 no color when stdout is a regular file
#	
#		rm -f colorless.log &&
#		git config color.ui auto ||
#		cleanup_fail &&
#	
#		git log >colorless.log &&
#		! colorful colorless.log
#	
not ok - 17 color when writing to a pager
#	
#		rm -f paginated.out &&
#		git config color.ui auto ||
#		cleanup_fail &&
#	
#		(
#			TERM=vt100 &&
#			export TERM &&
#			test_terminal git log
#		) &&
#		colorful paginated.out
#	
not ok - 18 color when writing to a file intended for a pager
#	
#		rm -f colorful.log &&
#		git config color.ui auto ||
#		cleanup_fail &&
#	
#		(
#			TERM=vt100 &&
#			GIT_PAGER_IN_USE=true &&
#			export TERM GIT_PAGER_IN_USE &&
#			git log >colorful.log
#		) &&
#		colorful colorful.log
#	
not ok - 19 setup: some aliases
#	
#		git config alias.aliasedlog log &&
#		git config alias.true "!true"
#	
not ok - 20 git log - default pager is used by default
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
#				test_terminal  git log
#			) &&
#			test -e default_pager_used
#		
not ok - 21 git log - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git log &&
#			test -e PAGER_used
#		
not ok - 22 git log - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git log &&
#			test -e core.pager_used
#		
not ok - 23 git log - core.pager overrides PAGER from subdirectory
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
#				test_terminal  git log
#			) &&
#			test -e core.pager_used
#		
not ok - 24 git log - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git log &&
#			test -e GIT_PAGER_used
#		
not ok - 25 git -p log - default pager is used by default
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
#				test_terminal  git -p log
#			) &&
#			test -e default_pager_used
#		
not ok - 26 git -p log - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git -p log &&
#			test -e PAGER_used
#		
not ok - 27 git -p log - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git -p log &&
#			test -e core.pager_used
#		
not ok - 28 git -p log - core.pager overrides PAGER from subdirectory
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
#				test_terminal  git -p log
#			) &&
#			test -e core.pager_used
#		
not ok - 29 git -p log - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git -p log &&
#			test -e GIT_PAGER_used
#		
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
not ok - 40 git -p true - default pager is used by default
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
#				test_terminal  git -p true
#			) &&
#			test -e default_pager_used
#		
not ok - 41 git -p true - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git -p true &&
#			test -e PAGER_used
#		
not ok - 42 git -p true - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git -p true &&
#			test -e core.pager_used
#		
not ok 43 - git -p true - core.pager overrides PAGER from subdirectory # TODO known breakage
not ok - 44 git -p true - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git -p true &&
#			test -e GIT_PAGER_used
#		
not ok - 45 git -p request-pull - default pager is used by default
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
#				test_must_fail test_terminal  git -p request-pull
#			) &&
#			test -e default_pager_used
#		
not ok - 46 git -p request-pull - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_must_fail test_terminal  git -p request-pull &&
#			test -e PAGER_used
#		
not ok - 47 git -p request-pull - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_must_fail test_terminal  git -p request-pull &&
#			test -e core.pager_used
#		
not ok 48 - git -p request-pull - core.pager overrides PAGER from subdirectory # TODO known breakage
not ok - 49 git -p request-pull - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_must_fail test_terminal  git -p request-pull &&
#			test -e GIT_PAGER_used
#		
not ok - 50 git -p - default pager is used by default
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
#				test_must_fail test_terminal  git -p
#			) &&
#			test -e default_pager_used
#		
not ok - 51 git -p - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_must_fail test_terminal  git -p &&
#			test -e PAGER_used
#		
not ok 52 - git -p - repository-local core.pager setting is not used # TODO known breakage
not ok - 53 git -p - core.pager is not used from subdirectory
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
#				test_must_fail test_terminal  git -p
#			) &&
#			! test -e core.pager_used
#		
not ok - 54 git -p - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_must_fail test_terminal  git -p &&
#			test -e GIT_PAGER_used
#		
ok 55 - no pager for 'git -p nonsense' # TODO known breakage
not ok - 56 git shortlog - default pager is used by default
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
#				test_terminal  git shortlog
#			) &&
#			test -e default_pager_used
#		
not ok - 57 git shortlog - PAGER overrides default pager
#	
#			sane_unset GIT_PAGER &&
#			test_might_fail git config --unset core.pager &&
#			rm -f PAGER_used ||
#			cleanup_fail &&
#	
#			PAGER='wc >PAGER_used' &&
#			export PAGER &&
#			test_terminal  git shortlog &&
#			test -e PAGER_used
#		
not ok - 58 git shortlog - repository-local core.pager setting overrides PAGER
#	
#			sane_unset GIT_PAGER &&
#			rm -f core.pager_used ||
#			cleanup_fail &&
#	
#			PAGER=wc &&
#			export PAGER &&
#			git config core.pager 'wc >core.pager_used' &&
#			test_terminal  git shortlog &&
#			test -e core.pager_used
#		
not ok - 59 git shortlog - core.pager overrides PAGER from subdirectory
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
#				test_terminal  git shortlog
#			) &&
#			test -e core.pager_used
#		
not ok - 60 git shortlog - GIT_PAGER overrides core.pager
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			git config core.pager wc &&
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git shortlog &&
#			test -e GIT_PAGER_used
#		
not ok - 61 setup: configure shortlog not to paginate
#	
#		git config pager.shortlog false
#	
not ok - 62 no pager for 'git shortlog'
#	
#			rm -f GIT_PAGER_used ||
#			cleanup_fail &&
#	
#			GIT_PAGER='wc >GIT_PAGER_used' &&
#			export GIT_PAGER &&
#			test_terminal  git shortlog &&
#			! test -e GIT_PAGER_used
#		
not ok - 63 git shortlog - core.pager is not used from subdirectory
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
#				test_terminal  git shortlog
#			) &&
#			! test -e core.pager_used
#		
not ok - 64 git -p shortlog - default pager is used by default
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
#				test_terminal  git -p shortlog
#			) &&
#			test -e default_pager_used
#		
not ok - 65 git -p shortlog - core.pager overrides PAGER from subdirectory
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
#				test_terminal  git -p shortlog
#			) &&
#			test -e core.pager_used
#		
not ok - 66 git -p apply </dev/null - core.pager overrides PAGER from subdirectory
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
#				test_must_fail test_terminal  git -p apply </dev/null
#			) &&
#			test -e core.pager_used
#		
not ok - 67 command-specific pager
#	
#		unset PAGER GIT_PAGER;
#		echo "foo:initial" >expect &&
#		>actual &&
#		git config --unset core.pager &&
#		git config pager.log "sed s/^/foo:/ >actual" &&
#		test_terminal git log --format=%s -1 &&
#		test_cmp expect actual
#	
not ok - 68 command-specific pager overrides core.pager
#	
#		unset PAGER GIT_PAGER;
#		echo "foo:initial" >expect &&
#		>actual &&
#		git config core.pager "exit 1"
#		git config pager.log "sed s/^/foo:/ >actual" &&
#		test_terminal git log --format=%s -1 &&
#		test_cmp expect actual
#	
not ok - 69 command-specific pager overridden by environment
#	
#		GIT_PAGER="sed s/^/foo:/ >actual" && export GIT_PAGER &&
#		>actual &&
#		echo "foo:initial" >expect &&
#		git config pager.log "exit 1" &&
#		test_terminal git log --format=%s -1 &&
#		test_cmp expect actual
#	
# fixed 1 known breakage(s)
# still have 5 known breakage(s)
# failed 54 among remaining 64 test(s)
1..69
