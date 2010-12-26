Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7508-status/.git/
expecting success: 
	mkdir broken &&
	test_when_finished "rm -fr broken" &&
	(
		cd broken &&
		git init &&
		echo "[status] showuntrackedfiles = CORRUPT" >>.git/config &&
		test_expect_code 129 git status -h >usage 2>&1
	) &&
	grep "[Uu]sage" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7508-status/broken/.git/
usage: git status [options] [--] <filepattern>...
ok 1 - status -h in broken repository
expecting success: 
	mkdir broken &&
	test_when_finished "rm -fr broken" &&
	(
		cd broken &&
		git init &&
		echo "[status] showuntrackedfiles = CORRUPT" >>.git/config &&
		test_expect_code 129 git commit -h >usage 2>&1
	) &&
	grep "[Uu]sage" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7508-status/broken/.git/
usage: git commit [options] [--] <filepattern>...
ok 2 - commit -h in broken repository
expecting success: 
	: >tracked &&
	: >modified &&
	mkdir dir1 &&
	: >dir1/tracked &&
	: >dir1/modified &&
	mkdir dir2 &&
	: >dir1/tracked &&
	: >dir1/modified &&
	git add . &&

	git status >output &&

	test_tick &&
	git commit -m initial &&
	: >untracked &&
	: >dir1/untracked &&
	: >dir2/untracked &&
	echo 1 >dir1/modified &&
	echo 2 >dir2/modified &&
	echo 3 >dir2/added &&
	git add dir2/added
[master (root-commit) c867210] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 dir1/modified
 create mode 100644 dir1/tracked
 create mode 100644 modified
 create mode 100644 tracked

ok 3 - setup

expecting success: 

	grep "use \"git rm --cached <file>\.\.\.\" to unstage" output
#   (use "git rm --cached <file>..." to unstage)

ok 4 - status (1)
expecting success: 

	git status >output &&
	test_cmp expect output

ok 5 - status (2)
expecting success: 

	git status >output &&
	test_cmp expect output

ok 6 - status (advice.statusHints false)
expecting success: 

	git status -s >output &&
	test_cmp expect output

ok 7 - status -s
expecting success: 

	git status -s -b >output &&
	test_cmp expect output

ok 8 - status -s -b
expecting success: 
	mkdir dir3 &&
	: >dir3/untracked1 &&
	: >dir3/untracked2 &&
	git status -uno >output &&
	test_cmp expect output

ok 9 - status -uno

expecting success: 
	git config status.showuntrackedfiles no
	git status >output &&
	test_cmp expect output

ok 10 - status (status.showUntrackedFiles no)
expecting success: 
	git status -uno >output &&
	test_cmp expect output

ok 11 - status -uno (advice.statusHints false)
expecting success: 
	git config --unset status.showuntrackedfiles
	git status -s -uno >output &&
	test_cmp expect output

ok 12 - status -s -uno
expecting success: 
	git config status.showuntrackedfiles no
	git status -s >output &&
	test_cmp expect output

ok 13 - status -s (status.showUntrackedFiles no)
expecting success: 
	git status -unormal >output &&
	test_cmp expect output

ok 14 - status -unormal
expecting success: 
	git config status.showuntrackedfiles normal
	git status >output &&
	test_cmp expect output

ok 15 - status (status.showUntrackedFiles normal)
expecting success: 
	git config --unset status.showuntrackedfiles
	git status -s -unormal >output &&
	test_cmp expect output

ok 16 - status -s -unormal

expecting success: 
	git config status.showuntrackedfiles normal
	git status -s >output &&
	test_cmp expect output


ok 17 - status -s (status.showUntrackedFiles normal)
expecting success: 
	git status -uall >output &&
	test_cmp expect output

ok 18 - status -uall
expecting success: 
	git config status.showuntrackedfiles all
	git status >output &&
	rm -rf dir3 &&
	git config --unset status.showuntrackedfiles &&
	test_cmp expect output

ok 19 - status (status.showUntrackedFiles all)

expecting success: 
	git config --unset status.showuntrackedfiles
	git status -s -uall >output &&
	test_cmp expect output

ok 20 - status -s -uall

expecting success: 
	git config status.showuntrackedfiles all
	git status -s >output &&
	rm -rf dir3 &&
	git config --unset status.showuntrackedfiles &&
	test_cmp expect output

ok 21 - status -s (status.showUntrackedFiles all)
expecting success: 

	(cd dir1 && git status) >output &&
	test_cmp expect output

ok 22 - status with relative paths
expecting success: 

	(cd dir1 && git status -s) >output &&
	test_cmp expect output

ok 23 - status -s with relative paths
expecting success: 

	(cd dir1 && git status --porcelain) >output &&
	test_cmp expect output

ok 24 - status --porcelain ignores relative paths setting
expecting success: 

	git config status.color.untracked blue &&
	git config status.color.branch green

ok 25 - setup unique colors

expecting success: 

	git config color.ui always &&
	git status | test_decode_color >output &&
	test_cmp expect output

ok 26 - status with color.ui

expecting success: 

	git config --unset color.ui &&
	git config color.status always &&
	git status | test_decode_color >output &&
	test_cmp expect output

ok 27 - status with color.status

expecting success: 

	git config --unset color.status &&
	git config color.ui always &&
	git status -s | test_decode_color >output &&
	test_cmp expect output

ok 28 - status -s with color.ui

expecting success: 

	git config --unset color.ui &&
	git config color.status always &&
	git status -s | test_decode_color >output &&
	test_cmp expect output

ok 29 - status -s with color.status

expecting success: 

	git status -s -b | test_decode_color >output &&
	test_cmp expect output

ok 30 - status -s -b with color.status
expecting success: 

	git config --unset color.status &&
	git config color.ui always &&
	git status --porcelain | test_decode_color >output &&
	test_cmp expect output

ok 31 - status --porcelain ignores color.ui

expecting success: 

	git config --unset color.ui &&
	git config color.status always &&
	git status --porcelain | test_decode_color >output &&
	test_cmp expect output

ok 32 - status --porcelain ignores color.status
expecting success: 

	git status --porcelain -b >output &&
	test_cmp expect output

ok 33 - status --porcelain ignores -b
expecting success: 

	git config status.relativePaths false
	(cd dir1 && git status) >output &&
	test_cmp expect output

ok 34 - status without relative paths
expecting success: 

	(cd dir1 && git status -s) >output &&
	test_cmp expect output

ok 35 - status -s without relative paths
expecting success: 
	git commit --dry-run dir1/modified >output &&
	test_cmp expect output

ok 36 - dry-run of partial commit excluding new file in index
expecting success: 
	touch dir2/added &&
	git status &&
	git diff-files >output &&
	test_cmp expect output
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	new file:   dir2/added
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   dir1/modified
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	dir1/untracked
#	dir2/modified
#	dir2/untracked
#	expect
#	output
#	untracked

ok 37 - status refreshes the index

expecting success: 
	test_create_repo sm && (
		cd sm &&
		>foo &&
		git add foo &&
		git commit -m "Add foo"
	) &&
	git add sm
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7508-status/sm/.git/
[master (root-commit) 4c2ba33] Add foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 38 - setup status submodule summary
expecting success: 
	git status >output &&
	test_cmp expect output

ok 39 - status submodule summary is disabled by default
expecting success: 
	git status --untracked-files=all >output &&
	test_cmp expect output

ok 40 - status --untracked-files=all does not show submodule
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 41 - status -s submodule summary is disabled by default
expecting success: 
	git status -s --untracked-files=all >output &&
	test_cmp expect output

ok 42 - status -s --untracked-files=all does not show submodule
expecting success: 
	git config status.submodulesummary 10 &&
	git status >output &&
	test_cmp expect output

ok 43 - status submodule summary
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 44 - status -s submodule summary

expecting success: 
	git commit -m "commit submodule" &&
	git config status.submodulesummary 10 &&
	test_must_fail git commit --dry-run >output &&
	test_cmp expect output &&
	git status >output &&
	test_cmp expect output
[master b1a12bb] commit submodule
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 dir2/added
 create mode 160000 sm

ok 45 - status submodule summary (clean submodule)
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 46 - status -s submodule summary (clean submodule)
expecting success: 
	git config status.submodulesummary 10 &&
	git commit --dry-run --amend >output &&
	test_cmp expect output

ok 47 - commit --dry-run submodule summary (--amend)
expecting success: 
	(
		chmod a-w .git &&
		# make dir1/tracked stat-dirty
		>dir1/tracked1 && mv -f dir1/tracked1 dir1/tracked &&
		git status -s >output &&
		! grep dir1/tracked output &&
		# make sure "status" succeeded without writing index out
		git diff-files | grep dir1/tracked
	)
	status=$?
	chmod 775 .git
	(exit $status)
:100644 100644 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0000000000000000000000000000000000000000 M	dir1/tracked
ok 48 - status succeeds in a read-only repository
expecting success: 
	echo modified > sm/untracked &&
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output

ok 49 - --ignore-submodules=untracked suppresses submodules with untracked content
expecting success: 
	git config diff.ignoreSubmodules dirty &&
	git status >output &&
	test_cmp expect output &&
	git config --add -f .gitmodules submodule.subname.ignore untracked &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname &&
	git config --unset diff.ignoreSubmodules

ok 50 - .gitmodules ignore=untracked suppresses submodules with untracked content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config --remove-section -f .gitmodules submodule.subname

ok 51 - .git/config ignore=untracked suppresses submodules with untracked content

expecting success: 
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output

ok 52 - --ignore-submodules=dirty suppresses submodules with untracked content

expecting success: 
	git config diff.ignoreSubmodules dirty &&
	git status >output &&
	! test -s actual &&
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname &&
	git config --unset diff.ignoreSubmodules

ok 53 - .gitmodules ignore=dirty suppresses submodules with untracked content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 54 - .git/config ignore=dirty suppresses submodules with untracked content

expecting success: 
	echo modified > sm/foo &&
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output

ok 55 - --ignore-submodules=dirty suppresses submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 56 - .gitmodules ignore=dirty suppresses submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 57 - .git/config ignore=dirty suppresses submodules with modified content
expecting success: 
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output

ok 58 - --ignore-submodules=untracked doesn't suppress submodules with modified content
expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore untracked &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 59 - .gitmodules ignore=untracked doesn't suppress submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 60 - .git/config ignore=untracked doesn't suppress submodules with modified content
expecting success: 
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output

ok 61 - --ignore-submodules=untracked doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore untracked &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 62 - .gitmodules ignore=untracked doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname


ok 63 - .git/config ignore=untracked doesn't suppress submodule summary

expecting success: 
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output


ok 64 - --ignore-submodules=dirty doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 65 - .gitmodules ignore=dirty doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname


ok 66 - .git/config ignore=dirty doesn't suppress submodule summary

expecting success: 
	git status --ignore-submodules=all > output &&
	test_cmp expect output


ok 67 - --ignore-submodules=all suppresses submodule summary

checking known breakage: 
	git config --add -f .gitmodules submodule.subname.ignore all &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname
--- expect	2010-12-26 04:02:49.000000000 +0000
+++ output	2010-12-26 04:02:49.000000000 +0000
@@ -5,6 +5,16 @@
 #
 #	modified:   dir1/modified
 #
+# Submodule changes to be committed:
+#
+# * sm 4c2ba33...2fb508f (1):
+#   > Add bar
+#
+# Submodules changed but not updated:
+#
+# * sm 2fb508f...2897915 (1):
+#   > 2nd commit
+#
 # Untracked files:
 #   (use "git add <file>..." to include in what will be committed)
 #

not ok 68 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage

checking known breakage: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore all &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname
--- expect	2010-12-26 04:02:49.000000000 +0000
+++ output	2010-12-26 04:02:50.000000000 +0000
@@ -5,6 +5,16 @@
 #
 #	modified:   dir1/modified
 #
+# Submodule changes to be committed:
+#
+# * sm 4c2ba33...2fb508f (1):
+#   > Add bar
+#
+# Submodules changed but not updated:
+#
+# * sm 2fb508f...2897915 (1):
+#   > 2nd commit
+#
 # Untracked files:
 #   (use "git add <file>..." to include in what will be committed)
 #

not ok 69 - .git/config ignore=all suppresses submodule summary # TODO known breakage

# still have 2 known breakage(s)
# passed all remaining 67 test(s)
1..69
