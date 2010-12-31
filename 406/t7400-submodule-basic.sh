Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/.git/
expecting success: 
	>t &&
	git add t &&
	git commit -m "initial commit" &&
	git branch initial
[master (root-commit) 744c7d1] initial commit
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 t

ok 1 - setup - initial commit

expecting success: 
	mkdir init &&
	(
		cd init &&
		git init &&
		echo a >a &&
		git add a &&
		git commit -m "submodule commit 1" &&
		git tag -a -m "rev-1" rev-1
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/init/.git/
[master (root-commit) 35a6cf5] submodule commit 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a

ok 2 - setup - repository in init subdirectory

expecting success: 
	echo a >a &&
	echo z >z &&
	git add a init z &&
	git commit -m "super commit 1"

[master 08db51a] super commit 1
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 a
 create mode 160000 init
 create mode 100644 z

ok 3 - setup - commit with gitlink

expecting success: 
	mv init .subrepo


ok 4 - setup - hide init subdirectory

expecting success: 
	git init addtest &&
	git init addtest-ignore

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/addtest/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/addtest-ignore/.git/

ok 5 - setup - repository to add submodules to

expecting success: 
	echo "refs/heads/master" >expect &&
	>empty &&

	(
		cd addtest &&
		git submodule add "$submodurl" submod &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/submod ../.. &&
	test_cmp expect heads &&
	test_cmp expect head &&
	test_cmp empty untracked

Cloning into submod...
done.
Submodule 'submod' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'submod'

ok 6 - submodule add

expecting success: 
	(
		cd addtest-ignore &&
		cat <<-\EOF >expect &&
		The following path is ignored by one of your .gitignore files:
		submod
		Use -f if you really want to add it.
		EOF
		# Does not use test_commit due to the ignore
		echo "*" > .gitignore &&
		git add --force .gitignore &&
		git commit -m"Ignore everything" &&
		! git submodule add "$submodurl" submod >actual 2>&1 &&
		test_cmp expect actual
	)

[master (root-commit) 9d5e282] Ignore everything
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore

ok 7 - submodule add to .gitignored path fails

expecting success: 
	(
		cd addtest-ignore &&
		git submodule add --force "$submodurl" submod
	)

Cloning into submod...
done.

ok 8 - submodule add to .gitignored path with --force

expecting success: 
	echo "refs/heads/initial" >expect-head &&
	cat <<-\EOF >expect-heads &&
	refs/heads/initial
	refs/heads/master
	EOF
	>empty &&

	(
		cd addtest &&
		git submodule add -b initial "$submodurl" submod-branch &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/submod-branch ../.. &&
	test_cmp expect-heads heads &&
	test_cmp expect-head head &&
	test_cmp empty untracked

Cloning into submod-branch...
done.
Branch initial set up to track remote branch initial from origin.
Submodule 'submod-branch' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'submod-branch'

ok 9 - submodule add --branch

expecting success: 
	echo "refs/heads/master" >expect &&
	>empty &&

	(
		cd addtest &&
		git submodule add "$submodurl" ././dotsubmod/./frotz/./ &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/dotsubmod/frotz ../../.. &&
	test_cmp expect heads &&
	test_cmp expect head &&
	test_cmp empty untracked

Cloning into dotsubmod/frotz...
done.
Submodule 'dotsubmod/frotz' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'dotsubmod/frotz'

ok 10 - submodule add with ./ in path

expecting success: 
	echo "refs/heads/master" >expect &&
	>empty &&

	(
		cd addtest &&
		git submodule add "$submodurl" slashslashsubmod///frotz// &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/slashslashsubmod/frotz ../../.. &&
	test_cmp expect heads &&
	test_cmp expect head &&
	test_cmp empty untracked
Cloning into slashslashsubmod/frotz...
done.
Submodule 'slashslashsubmod/frotz' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'slashslashsubmod/frotz'

ok 11 - submodule add with // in path

expecting success: 
	echo "refs/heads/master" >expect &&
	>empty &&

	(
		cd addtest &&
		git submodule add "$submodurl" dotdotsubmod/../realsubmod/frotz/.. &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/realsubmod ../.. &&
	test_cmp expect heads &&
	test_cmp expect head &&
	test_cmp empty untracked

Cloning into realsubmod...
done.
Submodule 'realsubmod' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'realsubmod'

ok 12 - submodule add with /.. in path

expecting success: 
	echo "refs/heads/master" >expect &&
	>empty &&

	(
		cd addtest &&
		git submodule add "$submodurl" dot/dotslashsubmod/./../..////realsubmod2/a/b/c/d/../../../../frotz//.. &&
		git submodule init
	) &&

	rm -f heads head untracked &&
	inspect addtest/realsubmod2 ../.. &&
	test_cmp expect heads &&
	test_cmp expect head &&
	test_cmp empty untracked

Cloning into realsubmod2...
done.
Submodule 'realsubmod2' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic) registered for path 'realsubmod2'

ok 13 - submodule add with ./, /.. and // in path

expecting success: 
	GIT_CONFIG=.gitmodules \
	git config submodule.example.url git://example.com/init.git


ok 14 - setup - add an example entry to .gitmodules

expecting success: 
	test_must_fail git submodule status

ok 15 - status should fail for unmapped paths

expecting success: 
	cat <<\EOF >expect &&
[submodule "example"]
	url = git://example.com/init.git
	path = init
EOF

	GIT_CONFIG=.gitmodules git config submodule.example.path init &&

	test_cmp expect .gitmodules


ok 16 - setup - map path in .gitmodules

expecting success: 
	git submodule status >lines &&
	test $(wc -l <lines) = 1
ok 17 - status should only print one line

expecting success: 
	rev1=$(cd .subrepo && git rev-parse HEAD) &&
	printf "rev1: %s
" "$rev1" &&
	test -n "$rev1"
rev1: 35a6cf5e358cbfba87c68cbac5597eee68ebf19e

ok 18 - setup - fetch commit name from submodule

expecting success: 
	git submodule status >lines &&
	grep "^-$rev1" lines
-35a6cf5e358cbfba87c68cbac5597eee68ebf19e init

ok 19 - status should initially be "missing"

expecting success: 
	echo git://example.com/init.git >expect &&

	git submodule init &&
	git config submodule.example.url >url &&
	git config submodule.example.url ./.subrepo &&

	test_cmp expect url
Submodule 'example' (git://example.com/init.git) registered for path 'init'

ok 20 - init should register submodule url in .git/config

expecting success: 
	echo hello >expect &&

	echo "hello" >init &&
	test_must_fail git submodule update &&

	test_cmp expect init


ok 21 - update should fail when path is used by a file

expecting success: 
	echo hello >expect &&

	rm -fr init &&
	mkdir init &&
	echo "hello" >init/a &&

	test_must_fail git submodule update &&

	test_cmp expect init/a

ok 22 - update should fail when path is used by a nonempty directory

expecting success: 
	rm -fr init &&
	rm -f head-sha1 &&
	echo "$rev1" >expect &&

	mkdir init &&
	git submodule update &&

	inspect init &&
	test_cmp expect head-sha1

Cloning into init...
done.
Submodule path 'init': checked out '35a6cf5e358cbfba87c68cbac5597eee68ebf19e'
ok 23 - update should work when path is an empty dir

expecting success: 
	git submodule status >list &&
	grep "^ $rev1" list
 35a6cf5e358cbfba87c68cbac5597eee68ebf19e init (rev-1)

ok 24 - status should be "up-to-date" after update

expecting success: 
	(
		cd init &&
		echo b >b &&
		git add b &&
		git commit -m "submodule commit 2"
	) &&

	rev2=$(cd init && git rev-parse HEAD) &&
	test -n "$rev2" &&
	git submodule status >list &&

	grep "^+$rev2" list
[detached HEAD 87eab67] submodule commit 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b
+87eab67975686e340495709b0fc89ab952bfca52 init (rev-1-1-g87eab67)

ok 25 - status should be "modified" after submodule commit
expecting success: 
	git submodule --cached status >list &&
	grep "^+$rev1" list
+35a6cf5e358cbfba87c68cbac5597eee68ebf19e init (rev-1)
ok 26 - the --cached sha1 should be rev1
expecting success: 
	git diff >diff &&
	grep "^+Subproject commit $rev2" diff
+Subproject commit 87eab67975686e340495709b0fc89ab952bfca52

ok 27 - git diff should report the SHA1 of the new submodule commit

expecting success: 
	rm -f head-sha1 &&
	echo "$rev1" >expect &&

	git submodule update init &&
	inspect init &&

	test_cmp expect head-sha1
Submodule path 'init': checked out '35a6cf5e358cbfba87c68cbac5597eee68ebf19e'
ok 28 - update should checkout rev1
expecting success: 
	git submodule status >list &&
	grep "^ $rev1" list
 35a6cf5e358cbfba87c68cbac5597eee68ebf19e init (rev-1)

ok 29 - status should be "up-to-date" after update

expecting success: 
	git checkout initial &&
	git checkout master
ok 30 - checkout superproject with subproject already present
expecting success: 
	>empty &&

	git branch second &&
	(
		cd init &&
		echo s >s &&
		git add s &&
		git commit -m "change subproject"
	) &&
	git update-index --add init &&
	git commit -m "change init" &&
	git format-patch -1 --stdout >P.diff &&
	git checkout second &&
	git apply --index P.diff &&

	git diff --cached master >staged &&
	test_cmp empty staged
[detached HEAD 809e078] change subproject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 s
[master dd89d9e] change init
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	init
ok 31 - apply submodule diff
expecting success: 
	mv init init2 &&
	git config -f .gitmodules submodule.example.url "$(pwd)/init2" &&
	git config --remove-section submodule.example &&
	test_must_fail git config submodule.example.url &&

	git submodule update init > update.out &&
	cat update.out &&
	grep "not initialized" update.out &&
	! test -d init/.git &&

	git submodule update --init init &&
	test -d init/.git
Submodule path 'init' not initialized
Maybe you want to use 'update --init'?
Submodule path 'init' not initialized
Submodule 'example' (/Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/init2) registered for path 'init'
Cloning into init...
done.
Submodule path 'init': checked out '809e078b877566529a27123b643049fe75672fcf'

ok 32 - update --init

expecting success: 

	git reset --hard &&
	test_must_fail git add init/a
HEAD is now at 08db51a super commit 1
ok 33 - do not add files from a submodule
expecting success: 

	git reset --hard &&
	git commit -m "commit subproject" init &&
	(cd init &&
	 echo b > a) &&
	git add init/ &&
	git diff --exit-code --cached init &&
	commit=$(cd init &&
	 git commit -m update a >/dev/null &&
	 git rev-parse HEAD) &&
	git add init/ &&
	test_must_fail git diff --exit-code --cached init &&
	test $commit = $(git ls-files --stage |
		sed -n "s/^160000 \([^ ]*\).*/\1/p")
HEAD is now at 08db51a super commit 1
[second bf23b55] commit subproject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/init b/init
index 809e078..90f1558 160000
--- a/init
+++ b/init
@@ -1 +1 @@
-Subproject commit 809e078b877566529a27123b643049fe75672fcf
+Subproject commit 90f155814d26598c2edf0b5a6b6972712debdd27

ok 34 - gracefully add submodule with a trailing slash

expecting success: 

	test "init" = "$(git ls-files init/)"

ok 35 - ls-files gracefully handles trailing slash

expecting success: 
	rm -rf init &&
	mkdir init &&
	git reset --hard &&
	git checkout initial &&
	test ! -d init &&
	git checkout second
HEAD is now at bf23b55 commit subproject

ok 36 - moving to a commit without submodule does not leave empty dir

expecting success: 

	git submodule no-such-submodule 2> output.err &&
	grep "^error: .*no-such-submodule" output.err


error: pathspec 'no-such-submodule' did not match any file(s) known to git.

ok 37 - submodule <invalid-path> warns

expecting success: 
	mkdir repo &&
	(
		cd repo &&
		git init &&
		echo r >r &&
		git add r &&
		git commit -m "repo commit 1"
	) &&
	git clone --bare repo/ bare.git &&
	(
		cd addtest &&
		git submodule add "$submodurl/repo" &&
		git config -f .gitmodules submodule.repo.path repo &&
		git submodule add "$submodurl/bare.git" &&
		git config -f .gitmodules submodule.bare.path bare
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7400-submodule-basic/repo/.git/
[master (root-commit) 5b6e875] repo commit 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 r
Cloning into bare repository bare.git...
done.
Cloning into repo...
done.
Cloning into bare...
done.
ok 38 - add submodules without specifying an explicit path
expecting success: 
	(
		cd addtest &&
		touch file &&
		test_must_fail	git submodule add "$submodurl/repo" file
	)
ok 39 - add should fail when path is used by a file
expecting success: 
	(
		cd addtest &&
		mkdir empty-dir &&
		test_must_fail git submodule add "$submodurl/repo" empty-dir
	)
ok 40 - add should fail when path is used by an existing directory
# passed all 40 test(s)
1..40
