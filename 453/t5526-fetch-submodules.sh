ok 1 - setup
not ok - 2 fetch --recurse-submodules recurses into submodules
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			git fetch --recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
ok 3 - fetch alone only fetches superproject
not ok - 4 fetch --no-recurse-submodules only fetches superproject
#	
#		(
#			cd downstream &&
#			git fetch --no-recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		! test -s actual.out &&
#		! test -s actual.err
#	
not ok - 5 using fetchRecurseSubmodules=true in .gitmodules recurses into submodules
#	
#		(
#			cd downstream &&
#			git config -f .gitmodules submodule.submodule.fetchRecurseSubmodules true &&
#			git fetch >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
not ok - 6 --no-recurse-submodules overrides .gitmodules config
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			git fetch --no-recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		! test -s actual.out &&
#		! test -s actual.err
#	
ok 7 - using fetchRecurseSubmodules=false in .git/config overrides setting in .gitmodules
not ok - 8 --recurse-submodules overrides fetchRecurseSubmodules setting from .git/config
#	
#		(
#			cd downstream &&
#			git fetch --recurse-submodules >../actual.out 2>../actual.err &&
#			git config -f --unset .gitmodules submodule.submodule.fetchRecurseSubmodules true &&
#			git config --unset submodule.submodule.fetchRecurseSubmodules
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
not ok - 9 --quiet propagates to submodules
#	
#		(
#			cd downstream &&
#			git fetch --recurse-submodules --quiet >../actual.out 2>../actual.err
#		) &&
#		! test -s actual.out &&
#		! test -s actual.err
#	
not ok - 10 --dry-run propagates to submodules
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			git fetch --recurse-submodules --dry-run >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err &&
#		(
#			cd downstream &&
#			git fetch --recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
not ok - 11 recurseSubmodules=true propagates into submodules
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			git config fetch.recurseSubmodules true
#			git fetch >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
not ok - 12 --recurse-submodules overrides config in submodule
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			(
#				cd submodule &&
#				git config fetch.recurseSubmodules false
#			) &&
#			git fetch --recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		test_cmp expect.out actual.out &&
#		test_cmp expect.err actual.err
#	
not ok - 13 --no-recurse-submodules overrides config setting
#	
#		add_upstream_commit &&
#		(
#			cd downstream &&
#			git config fetch.recurseSubmodules true
#			git fetch --no-recurse-submodules >../actual.out 2>../actual.err
#		) &&
#		! test -s actual.out &&
#		! test -s actual.err
#	
# failed 10 among 13 test(s)
1..13
