Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/.git/
expecting success: 
	(
		sane_unset GIT_DIR GIT_WORK_TREE &&
		mkdir plain &&
		cd plain &&
		git init
	) &&
	check_config plain/.git false unset
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/plain/.git/

ok 1 - plain
expecting success: 
	if (
		sane_unset GIT_DIR &&
		mkdir plain-wt &&
		cd plain-wt &&
		GIT_WORK_TREE=$(pwd) git init
	)
	then
		echo Should have failed -- GIT_WORK_TREE should not be used
		false
	fi

ok 2 - plain with GIT_WORK_TREE

expecting success: 
	(
		sane_unset GIT_DIR GIT_WORK_TREE GIT_CONFIG &&
		mkdir plain-bare-1 &&
		cd plain-bare-1 &&
		git --bare init
	) &&
	check_config plain-bare-1 true unset
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/plain-bare-1/
ok 3 - plain bare
expecting success: 
	if (
		sane_unset GIT_DIR GIT_CONFIG &&
		mkdir plain-bare-2 &&
		cd plain-bare-2 &&
		GIT_WORK_TREE=$(pwd) git --bare init
	)
	then
		echo Should have failed -- GIT_WORK_TREE should not be used
		false
	fi

ok 4 - plain bare with GIT_WORK_TREE

expecting success: 

	(
		sane_unset GIT_CONFIG &&
		mkdir git-dir-bare.git &&
		GIT_DIR=git-dir-bare.git git init
	) &&
	check_config git-dir-bare.git true unset
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/git-dir-bare.git/
ok 5 - GIT_DIR bare
expecting success: 

	(
		sane_unset GIT_DIR GIT_WORK_TREE GIT_CONFIG &&
		mkdir init-bare.git &&
		cd init-bare.git &&
		git init --bare
	) &&
	check_config init-bare.git true unset
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/init-bare.git/

ok 6 - init --bare

expecting success: 

	(
		sane_unset GIT_CONFIG &&
		mkdir non-bare &&
		cd non-bare &&
		GIT_DIR=.git git init
	) &&
	check_config non-bare/.git false unset
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/non-bare/.git/
ok 7 - GIT_DIR non-bare
expecting success: 

	(
		sane_unset GIT_CONFIG &&
		mkdir git-dir-wt-1.git &&
		GIT_WORK_TREE=$(pwd) GIT_DIR=git-dir-wt-1.git git init
	) &&
	check_config git-dir-wt-1.git false "$(pwd)"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/git-dir-wt-1.git/
ok 8 - GIT_DIR & GIT_WORK_TREE (1)
expecting success: 

	if (
		sane_unset GIT_CONFIG &&
		mkdir git-dir-wt-2.git &&
		GIT_WORK_TREE=$(pwd) GIT_DIR=git-dir-wt-2.git git --bare init
	)
	then
		echo Should have failed -- --bare should not be used
		false
	fi

ok 9 - GIT_DIR & GIT_WORK_TREE (2)

expecting success: 

	(
		sane_unset GIT_CONFIG GIT_WORK_TREE GIT_CONFIG &&

		mkdir again &&
		cd again &&
		git init >out1 2>err1 &&
		git init >out2 2>err2
	) &&
	grep "Initialized empty" again/out1 &&
	grep "Reinitialized existing" again/out2 &&
	>again/empty &&
	test_cmp again/empty again/err1 &&
	test_cmp again/empty again/err2

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/again/.git/
Reinitialized existing Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/again/.git/

ok 10 - reinit

expecting success: 
	mkdir template-source &&
	echo content >template-source/file &&
	(
		mkdir template-custom &&
		cd template-custom &&
		git init --template=../template-source
	) &&
	test_cmp template-source/file template-custom/.git/file

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/template-custom/.git/

ok 11 - init with --template

expecting success: 
	(
		mkdir template-plain &&
		cd template-plain &&
		git init
	) &&
	test -f template-plain/.git/info/exclude &&
	(
		mkdir template-blank &&
		cd template-blank &&
		git init --template=
	) &&
	! test -f template-blank/.git/info/exclude

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/template-plain/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/template-blank/.git/

ok 12 - init with --template (blank)

expecting success: 
	mkdir templatedir-source &&
	echo Content >templatedir-source/file &&
	(
		test_config="${HOME}/.gitconfig" &&
		git config -f "$test_config"  init.templatedir "${HOME}/templatedir-source" &&
		mkdir templatedir-set &&
		cd templatedir-set &&
		sane_unset GIT_CONFIG_NOGLOBAL &&
		sane_unset GIT_TEMPLATE_DIR &&
		NO_SET_GIT_TEMPLATE_DIR=t &&
		export NO_SET_GIT_TEMPLATE_DIR &&
		git init
	) &&
	test_cmp templatedir-source/file templatedir-set/.git/file

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/templatedir-set/.git/

ok 13 - init with init.templatedir set

expecting success: 
	(
		test_config="$HOME"/.gitconfig &&
		sane_unset GIT_CONFIG_NOGLOBAL &&
		git config -f "$test_config" core.bare false &&
		git config -f "$test_config" core.sharedRepository 0640 &&
		mkdir init-bare-shared-override &&
		cd init-bare-shared-override &&
		git init --bare --shared=0666
	) &&
	check_config init-bare-shared-override true unset &&
	test x0666 = \
	x`git config -f init-bare-shared-override/config core.sharedRepository`

Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/init-bare-shared-override/

ok 14 - init --bare/--shared overrides system/global config

expecting success: 
	(
		test_config="$HOME"/.gitconfig &&
		sane_unset GIT_CONFIG_NOGLOBAL &&
		git config -f "$test_config" core.sharedRepository 0666 &&
		mkdir shared-honor-global &&
		cd shared-honor-global &&
		git init
	) &&
	test x0666 = \
	x`git config -f shared-honor-global/.git/config core.sharedRepository`

Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/shared-honor-global/.git/

ok 15 - init honors global core.sharedRepository

expecting success: 
	(
		insane=$(printf "x%09999dx" 1) &&
		mkdir test &&
		cd test &&
		test_must_fail git init --template=$insane
	)


ok 16 - init rejects insanely long --template

expecting success: 
	rm -fr newdir &&
	(
		git init newdir &&
		test -d newdir/.git/refs
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/.git/

ok 17 - init creates a new directory

expecting success: 
	rm -fr newdir &&
	(
		git init --bare newdir &&
		test -d newdir/refs
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/

ok 18 - init creates a new bare directory

expecting success: 
	rm -fr newdir &&
	(
		mkdir newdir &&
		git init newdir &&
		test -d newdir/.git/refs
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/.git/

ok 19 - init recreates a directory

expecting success: 
	rm -fr newdir &&
	(
		mkdir newdir &&
		git init --bare newdir &&
		test -d newdir/refs
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/

ok 20 - init recreates a new bare directory

expecting success: 
	rm -fr newdir &&
	git init newdir/a/b/c &&
	test -d newdir/a/b/c/.git/refs

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/a/b/c/.git/

ok 21 - init creates a new deep directory

expecting success: 
	rm -fr newdir &&
	(
		# Leading directories should honor umask while
		# the repository itself should follow "shared"
		umask 002 &&
		git init --bare --shared=0660 newdir/a/b/c &&
		test -d newdir/a/b/c/refs &&
		ls -ld newdir/a newdir/a/b > lsab.out &&
		! grep -v "^drwxrw[sx]r-x" lsab.out &&
		ls -ld newdir/a/b/c > lsc.out &&
		! grep -v "^drwxrw[sx]---" lsc.out
	)

Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/a/b/c/

ok 22 - init creates a new deep directory (umask vs. shared)

expecting success: 
	rm -fr newdir &&
	(
		>newdir &&
		test_must_fail git init newdir &&
		test -f newdir
	)


ok 23 - init notices EEXIST (1)

expecting success: 
	rm -fr newdir &&
	(
		mkdir newdir &&
		>newdir/a
		test_must_fail git init newdir/a/b &&
		test -f newdir/a
	)


ok 24 - init notices EEXIST (2)

expecting success: 
	rm -fr newdir &&
	(
		mkdir newdir &&
		chmod -w newdir &&
		test_must_fail git init newdir/a/b
	)


ok 25 - init notices EPERM

expecting success: 
	rm -rf newdir &&
	git --bare init newdir &&
	test -d newdir/refs

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/

ok 26 - init creates a new bare directory with global --bare

expecting success: 
	rm -rf newdir &&
	mkdir otherdir &&
	GIT_DIR=otherdir git --bare init newdir &&
	test -d newdir/refs &&
	! test -d otherdir/refs

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0001-init/newdir/

ok 27 - init prefers command line to GIT_DIR

# passed all 27 test(s)
1..27
