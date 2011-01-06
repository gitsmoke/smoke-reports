Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7006-pager/.git/
expecting success: 
	test_might_fail git config --unset core.pager &&
	less=$(
		unset PAGER GIT_PAGER;
		git var GIT_PAGER
	) &&
	test -n "$less"


ok 1 - determine default pager

expecting success: 
	if
		test_have_prereq PERL &&
		"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl \
			sh -c "test -t 1 && test -t 2"
	then
		test_set_prereq TTY &&
		test_terminal () {
			if ! test_declared_prereq TTY
			then
				echo >&4 "test_terminal: need to declare TTY prerequisite"
				return 127
			fi
			"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl "$@"
		}
	fi

ok 2 - set up terminal for tests

expecting success: 
	sane_unset GIT_PAGER GIT_PAGER_IN_USE &&
	test_might_fail git config --unset core.pager &&

	PAGER="cat >paginated.out" &&
	export PAGER &&

	test_commit initial
[master (root-commit) 24b24cf] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 initial.t

ok 3 - setup

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	test_terminal git log &&
	test -e paginated.out

ok 4 - some commands use a pager

checking known breakage: 
	echo subdir/paginated.out >expected &&
	mkdir -p subdir &&
	rm -f paginated.out subdir/paginated.out &&
	(
		cd subdir &&
		test_terminal git log
	) &&
	{
		ls paginated.out subdir/paginated.out ||
		:
	} >actual &&
	test_cmp expected actual
--- expected	2011-01-06 04:03:10.000000000 +0000
+++ actual	2011-01-06 04:03:10.000000000 +0000
@@ -1 +1 @@
-subdir/paginated.out
+paginated.out

not ok 5 - pager runs from subdir # TODO known breakage

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	test_terminal git rev-list HEAD &&
	! test -e paginated.out
24b24cf8a829f5b8c30dfc018b0a459a2ccaf380

ok 6 - some commands do not use a pager

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	git log | cat &&
	! test -e paginated.out

commit 24b24cf8a829f5b8c30dfc018b0a459a2ccaf380
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

ok 7 - no pager when stdout is a pipe

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	git log >file &&
	! test -e paginated.out


ok 8 - no pager when stdout is a regular file

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	test_terminal git --paginate rev-list HEAD &&
	test -e paginated.out
ok 9 - git --paginate rev-list uses a pager

expecting success: 
	rm -f file paginated.out ||
	cleanup_fail &&

	git --paginate log | cat &&
	! test -e paginated.out
commit 24b24cf8a829f5b8c30dfc018b0a459a2ccaf380
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

ok 10 - no pager even with --paginate when stdout is a pipe

expecting success: 
	rm -f paginated.out ||
	cleanup_fail &&

	test_terminal git --no-pager log &&
	! test -e paginated.out

commit 24b24cf8a829f5b8c30dfc018b0a459a2ccaf380
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

ok 11 - no pager with --no-pager

expecting success: 
	rm -f paginated.out &&
	test_might_fail git config --unset pager.grep &&
	test_terminal git grep initial &&
	test -e paginated.out &&

	rm -f paginated.out &&
	git config pager.grep false &&
	test_when_finished "git config --unset pager.grep" &&
	test_terminal git grep initial &&
	! test -e paginated.out
initial.t:initial
ok 12 - configuration can disable pager
expecting success: 
	rm -f paginated.out &&
	git config pager.config true &&
	test_when_finished "git config --unset pager.config" &&
	test_terminal git config --list &&
	test -e paginated.out

ok 13 - git config uses a pager if configured to

expecting success: 
	rm -f paginated.out &&
	mkdir -p subdir &&
	git config pager.bundle true &&
	test_when_finished "git config --unset pager.bundle" &&

	git bundle create test.bundle --all &&
	rm -f paginated.out subdir/paginated.out &&
	(
		cd subdir &&
		test_terminal git bundle unbundle ../test.bundle
	) &&
	{
		test -e paginated.out ||
		test -e subdir/paginated.out
	}

ok 14 - configuration can enable pager (from subdir)

expecting success: 
	rm -f colorful.log colorless.log ||
	cleanup_fail &&

	git log --no-color >colorless.log &&
	git log --color >colorful.log &&
	! colorful colorless.log &&
	colorful colorful.log


ok 15 - tests can detect color

expecting success: 
	rm -f colorless.log &&
	git config color.ui auto ||
	cleanup_fail &&

	git log >colorless.log &&
	! colorful colorless.log


ok 16 - no color when stdout is a regular file

expecting success: 
	rm -f paginated.out &&
	git config color.ui auto ||
	cleanup_fail &&

	(
		TERM=vt100 &&
		export TERM &&
		test_terminal git log
	) &&
	colorful paginated.out


ok 17 - color when writing to a pager

expecting success: 
	rm -f colorful.log &&
	git config color.ui auto ||
	cleanup_fail &&

	(
		TERM=vt100 &&
		GIT_PAGER_IN_USE=true &&
		export TERM GIT_PAGER_IN_USE &&
		git log >colorful.log
	) &&
	colorful colorful.log


ok 18 - color when writing to a file intended for a pager

expecting success: 
	git config alias.aliasedlog log &&
	git config alias.true "!true"


ok 19 - setup: some aliases

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git log
		) &&
		test -e default_pager_used
	

ok 20 - git log - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git log &&
		test -e PAGER_used
	

ok 21 - git log - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git log &&
		test -e core.pager_used
	

ok 22 - git log - repository-local core.pager setting overrides PAGER

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git log
		) &&
		test -e core.pager_used
	

ok 23 - git log - core.pager overrides PAGER from subdirectory

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git log &&
		test -e GIT_PAGER_used
	

ok 24 - git log - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git -p log
		) &&
		test -e default_pager_used
	

ok 25 - git -p log - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git -p log &&
		test -e PAGER_used
	

ok 26 - git -p log - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git -p log &&
		test -e core.pager_used
	

ok 27 - git -p log - repository-local core.pager setting overrides PAGER

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git -p log
		) &&
		test -e core.pager_used
	

ok 28 - git -p log - core.pager overrides PAGER from subdirectory

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git -p log &&
		test -e GIT_PAGER_used
	

ok 29 - git -p log - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git aliasedlog
		) &&
		test -e default_pager_used
	

ok 30 - git aliasedlog - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git aliasedlog &&
		test -e PAGER_used
	

ok 31 - git aliasedlog - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git aliasedlog &&
		test -e core.pager_used
	

ok 32 - git aliasedlog - repository-local core.pager setting overrides PAGER

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git aliasedlog
		) &&
		test -e core.pager_used
	

ok 33 - git aliasedlog - core.pager overrides PAGER from subdirectory

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git aliasedlog &&
		test -e GIT_PAGER_used
	

ok 34 - git aliasedlog - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git -p aliasedlog
		) &&
		test -e default_pager_used
	

ok 35 - git -p aliasedlog - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git -p aliasedlog &&
		test -e PAGER_used
	

ok 36 - git -p aliasedlog - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git -p aliasedlog &&
		test -e core.pager_used
	

ok 37 - git -p aliasedlog - repository-local core.pager setting overrides PAGER

checking known breakage: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git -p aliasedlog
		) &&
		test -e core.pager_used
	
       5      15     137

not ok 38 - git -p aliasedlog - core.pager overrides PAGER from subdirectory # TODO known breakage

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git -p aliasedlog &&
		test -e GIT_PAGER_used
	

ok 39 - git -p aliasedlog - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git -p true
		) &&
		test -e default_pager_used
	

ok 40 - git -p true - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git -p true &&
		test -e PAGER_used
	

ok 41 - git -p true - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git -p true &&
		test -e core.pager_used
	

ok 42 - git -p true - repository-local core.pager setting overrides PAGER

checking known breakage: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git -p true
		) &&
		test -e core.pager_used
	
       0       0       0

not ok 43 - git -p true - core.pager overrides PAGER from subdirectory # TODO known breakage

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git -p true &&
		test -e GIT_PAGER_used
	

ok 44 - git -p true - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_must_fail test_terminal  git -p request-pull
		) &&
		test -e default_pager_used
	

ok 45 - git -p request-pull - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_must_fail test_terminal  git -p request-pull &&
		test -e PAGER_used
	

ok 46 - git -p request-pull - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_must_fail test_terminal  git -p request-pull &&
		test -e core.pager_used
	

ok 47 - git -p request-pull - repository-local core.pager setting overrides PAGER

checking known breakage: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_must_fail test_terminal  git -p request-pull
		) &&
		test -e core.pager_used
	
       4      13     102

not ok 48 - git -p request-pull - core.pager overrides PAGER from subdirectory # TODO known breakage

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_must_fail test_terminal  git -p request-pull &&
		test -e GIT_PAGER_used
	

ok 49 - git -p request-pull - GIT_PAGER overrides core.pager

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_must_fail test_terminal  git -p
		) &&
		test -e default_pager_used
	

ok 50 - git -p - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_must_fail test_terminal  git -p &&
		test -e PAGER_used
	

ok 51 - git -p - PAGER overrides default pager

checking known breakage: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_must_fail test_terminal  git -p &&
		! test -e core.pager_used
	

not ok 52 - git -p - repository-local core.pager setting is not used # TODO known breakage

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_must_fail test_terminal  git -p
		) &&
		! test -e core.pager_used
	
      30     211    1592

ok 53 - git -p - core.pager is not used from subdirectory

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_must_fail test_terminal  git -p &&
		test -e GIT_PAGER_used
	

ok 54 - git -p - GIT_PAGER overrides core.pager

checking known breakage: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_must_fail test_terminal  git -p nonsense &&
		! test -e GIT_PAGER_used
	

not ok 55 - no pager for 'git -p nonsense' # TODO known breakage

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git shortlog
		) &&
		test -e default_pager_used
	

ok 56 - git shortlog - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f PAGER_used ||
		cleanup_fail &&

		PAGER='wc >PAGER_used' &&
		export PAGER &&
		test_terminal  git shortlog &&
		test -e PAGER_used
	

ok 57 - git shortlog - PAGER overrides default pager

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used ||
		cleanup_fail &&

		PAGER=wc &&
		export PAGER &&
		git config core.pager 'wc >core.pager_used' &&
		test_terminal  git shortlog &&
		test -e core.pager_used
	

ok 58 - git shortlog - repository-local core.pager setting overrides PAGER

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git shortlog
		) &&
		test -e core.pager_used
	

ok 59 - git shortlog - core.pager overrides PAGER from subdirectory

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		git config core.pager wc &&
		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git shortlog &&
		test -e GIT_PAGER_used
	

ok 60 - git shortlog - GIT_PAGER overrides core.pager

expecting success: 
	git config pager.shortlog false


ok 61 - setup: configure shortlog not to paginate

expecting success: 
		rm -f GIT_PAGER_used ||
		cleanup_fail &&

		GIT_PAGER='wc >GIT_PAGER_used' &&
		export GIT_PAGER &&
		test_terminal  git shortlog &&
		! test -e GIT_PAGER_used
	

ok 62 - no pager for 'git shortlog'

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git shortlog
		) &&
		! test -e core.pager_used
	

ok 63 - git shortlog - core.pager is not used from subdirectory

expecting success: 
		sane_unset PAGER GIT_PAGER &&
		test_might_fail git config --unset core.pager &&
		rm -f default_pager_used ||
		cleanup_fail &&

		cat >$less <<-\EOF &&
		#!/bin/sh
		wc >default_pager_used
		EOF
		chmod +x $less &&
		(
			PATH=.:$PATH &&
			export PATH &&
			test_terminal  git -p shortlog
		) &&
		test -e default_pager_used
	

ok 64 - git -p shortlog - default pager is used by default

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_terminal  git -p shortlog
		) &&
		test -e core.pager_used
	

ok 65 - git -p shortlog - core.pager overrides PAGER from subdirectory

expecting success: 
		sane_unset GIT_PAGER &&
		rm -f core.pager_used &&
		rm -fr sub ||
		cleanup_fail &&

		PAGER=wc &&
		stampname=$(pwd)/core.pager_used &&
		export PAGER stampname &&
		git config core.pager 'wc >"$stampname"' &&
		mkdir sub &&
		(
			cd sub &&
			test_must_fail test_terminal  git -p apply </dev/null
		) &&
		test -e core.pager_used
	

ok 66 - git -p apply </dev/null - core.pager overrides PAGER from subdirectory

expecting success: 
	unset PAGER GIT_PAGER;
	echo "foo:initial" >expect &&
	>actual &&
	git config --unset core.pager &&
	git config pager.log "sed s/^/foo:/ >actual" &&
	test_terminal git log --format=%s -1 &&
	test_cmp expect actual

ok 67 - command-specific pager

expecting success: 
	unset PAGER GIT_PAGER;
	echo "foo:initial" >expect &&
	>actual &&
	git config core.pager "exit 1"
	git config pager.log "sed s/^/foo:/ >actual" &&
	test_terminal git log --format=%s -1 &&
	test_cmp expect actual

ok 68 - command-specific pager overrides core.pager

expecting success: 
	GIT_PAGER="sed s/^/foo:/ >actual" && export GIT_PAGER &&
	>actual &&
	echo "foo:initial" >expect &&
	git config pager.log "exit 1" &&
	test_terminal git log --format=%s -1 &&
	test_cmp expect actual


ok 69 - command-specific pager overridden by environment

# still have 6 known breakage(s)
# passed all remaining 63 test(s)
1..69
