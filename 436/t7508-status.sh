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
	: >dir3/untracked2

ok 9 - setup dir3
expecting success: 
	git status -uno >output &&
	test_cmp expect output

ok 10 - status -uno
expecting success: 
	git config status.showuntrackedfiles no
	test_when_finished "git config --unset status.showuntrackedfiles" &&
	git status >output &&
	test_cmp expect output

ok 11 - status (status.showUntrackedFiles no)
expecting success: 
	git status -uno >output &&
	test_cmp expect output

ok 12 - status -uno (advice.statusHints false)
expecting success: 
	git status -s -uno >output &&
	test_cmp expect output

ok 13 - status -s -uno
expecting success: 
	git config status.showuntrackedfiles no
	git status -s >output &&
	test_cmp expect output

ok 14 - status -s (status.showUntrackedFiles no)
expecting success: 
	git status -unormal >output &&
	test_cmp expect output

ok 15 - status -unormal
expecting success: 
	git config status.showuntrackedfiles normal
	test_when_finished "git config --unset status.showuntrackedfiles" &&
	git status >output &&
	test_cmp expect output

ok 16 - status (status.showUntrackedFiles normal)
expecting success: 
	git status -s -unormal >output &&
	test_cmp expect output

ok 17 - status -s -unormal
expecting success: 
	git config status.showuntrackedfiles normal
	git status -s >output &&
	test_cmp expect output

ok 18 - status -s (status.showUntrackedFiles normal)
expecting success: 
	git status -uall >output &&
	test_cmp expect output


ok 19 - status -uall

expecting success: 
	git config status.showuntrackedfiles all
	test_when_finished "git config --unset status.showuntrackedfiles" &&
	git status >output &&
	test_cmp expect output

ok 20 - status (status.showUntrackedFiles all)

expecting success: 
	rm -rf dir3


ok 21 - teardown dir3

expecting success: 
	git config --unset status.showuntrackedfiles
	git status -s -uall >output &&
	test_cmp expect output


ok 22 - status -s -uall

expecting success: 
	git config status.showuntrackedfiles all
	git status -s >output &&
	rm -rf dir3 &&
	git config --unset status.showuntrackedfiles &&
	test_cmp expect output

ok 23 - status -s (status.showUntrackedFiles all)

expecting success: 

	(cd dir1 && git status) >output &&
	test_cmp expect output



ok 24 - status with relative paths

expecting success: 

	(cd dir1 && git status -s) >output &&
	test_cmp expect output

ok 25 - status -s with relative paths
expecting success: 

	(cd dir1 && git status --porcelain) >output &&
	test_cmp expect output

ok 26 - status --porcelain ignores relative paths setting
expecting success: 

	git config status.color.untracked blue &&
	git config status.color.branch green

ok 27 - setup unique colors

expecting success: 

	git config color.ui always &&
	test_when_finished "git config --unset color.ui" &&
	git status | test_decode_color >output &&
	test_cmp expect output

ok 28 - status with color.ui

expecting success: 

	git config color.status always &&
	test_when_finished "git config --unset color.status" &&
	git status | test_decode_color >output &&
	test_cmp expect output

ok 29 - status with color.status
expecting success: 

	git config color.ui always &&
	git status -s | test_decode_color >output &&
	test_cmp expect output

ok 30 - status -s with color.ui
expecting success: 

	git config --unset color.ui &&
	git config color.status always &&
	git status -s | test_decode_color >output &&
	test_cmp expect output

ok 31 - status -s with color.status

expecting success: 

	git status -s -b | test_decode_color >output &&
	test_cmp expect output



ok 32 - status -s -b with color.status
expecting success: 

	git config --unset color.status &&
	git config color.ui always &&
	git status --porcelain | test_decode_color >output &&
	test_cmp expect output

ok 33 - status --porcelain ignores color.ui

expecting success: 

	git config --unset color.ui &&
	git config color.status always &&
	git status --porcelain | test_decode_color >output &&
	test_cmp expect output

ok 34 - status --porcelain ignores color.status
expecting success: 

	git status --porcelain -b >output &&
	test_cmp expect output

ok 35 - status --porcelain ignores -b
expecting success: 

	git config status.relativePaths false &&
	test_when_finished "git config --unset status.relativePaths" &&
	(cd dir1 && git status) >output &&
	test_cmp expect output

ok 36 - status without relative paths
expecting success: 

	git config status.relativePaths false &&
	test_when_finished "git config --unset status.relativePaths" &&
	(cd dir1 && git status -s) >output &&
	test_cmp expect output

ok 37 - status -s without relative paths
expecting success: 
	git commit --dry-run dir1/modified >output

ok 38 - dry-run of partial commit excluding new file in index
expecting success: 
	test_cmp expect output

ok 39 - dry-run of partial commit excluding new file in index: output
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

ok 40 - status refreshes the index

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

ok 41 - setup status submodule summary
expecting success: 
	git status >output &&
	test_cmp expect output

ok 42 - status submodule summary is disabled by default
expecting success: 
	git status --untracked-files=all >output &&
	test_cmp expect output

ok 43 - status --untracked-files=all does not show submodule
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 44 - status -s submodule summary is disabled by default
expecting success: 
	git status -s --untracked-files=all >output &&
	test_cmp expect output

ok 45 - status -s --untracked-files=all does not show submodule
expecting success: 
	git config status.submodulesummary 10 &&
	git status >output &&
	test_cmp expect output

ok 46 - status submodule summary
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 47 - status -s submodule summary
expecting success: 
	git commit -m "commit submodule"
[master b1a12bb] commit submodule
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 dir2/added
 create mode 160000 sm

ok 48 - status submodule summary (clean submodule): commit
expecting success: 
	git config status.submodulesummary 10 &&
	test_must_fail git commit --dry-run >output &&
	test_cmp expect output &&
	git status >output &&
	test_cmp expect output

ok 49 - status submodule summary (clean submodule): output
expecting success: 
	git status -s >output &&
	test_cmp expect output

ok 50 - status -s submodule summary (clean submodule)
expecting success: 
	git config status.submodulesummary 10 &&
	git commit --dry-run --amend >output &&
	test_cmp expect output

ok 51 - commit --dry-run submodule summary (--amend)
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
ok 52 - status succeeds in a read-only repository
expecting success: 
	echo modified > sm/untracked &&
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output

ok 53 - --ignore-submodules=untracked suppresses submodules with untracked content
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

ok 54 - .gitmodules ignore=untracked suppresses submodules with untracked content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config --remove-section -f .gitmodules submodule.subname

ok 55 - .git/config ignore=untracked suppresses submodules with untracked content

expecting success: 
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output

ok 56 - --ignore-submodules=dirty suppresses submodules with untracked content

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

ok 57 - .gitmodules ignore=dirty suppresses submodules with untracked content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 58 - .git/config ignore=dirty suppresses submodules with untracked content

expecting success: 
	echo modified > sm/foo &&
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output

ok 59 - --ignore-submodules=dirty suppresses submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 60 - .gitmodules ignore=dirty suppresses submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 61 - .git/config ignore=dirty suppresses submodules with modified content

expecting success: 
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output

ok 62 - --ignore-submodules=untracked doesn't suppress submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore untracked &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 63 - .gitmodules ignore=untracked doesn't suppress submodules with modified content

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname


ok 64 - .git/config ignore=untracked doesn't suppress submodules with modified content

expecting success: 
	git status --ignore-submodules=untracked > output &&
	test_cmp expect output


ok 65 - --ignore-submodules=untracked doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore untracked &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 66 - .gitmodules ignore=untracked doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore untracked &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname


ok 67 - .git/config ignore=untracked doesn't suppress submodule summary

expecting success: 
	git status --ignore-submodules=dirty > output &&
	test_cmp expect output


ok 68 - --ignore-submodules=dirty doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 69 - .gitmodules ignore=dirty doesn't suppress submodule summary

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore dirty &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname

ok 70 - .git/config ignore=dirty doesn't suppress submodule summary
expecting success: 
	git status --ignore-submodules=all > output &&
	test_cmp expect output

ok 71 - --ignore-submodules=all suppresses submodule summary
checking known breakage: 
	git config --add -f .gitmodules submodule.subname.ignore all &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config -f .gitmodules  --remove-section submodule.subname
--- expect	2011-01-09 04:09:23.000000000 +0000
+++ output	2011-01-09 04:09:23.000000000 +0000
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

not ok 72 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage

checking known breakage: 
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sm &&
	git config --add submodule.subname.ignore all &&
	git config --add submodule.subname.path sm &&
	git status > output &&
	test_cmp expect output &&
	git config --remove-section submodule.subname &&
	git config -f .gitmodules  --remove-section submodule.subname
--- expect	2011-01-09 04:09:23.000000000 +0000
+++ output	2011-01-09 04:09:23.000000000 +0000
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

not ok 73 - .git/config ignore=all suppresses submodule summary # TODO known breakage

# still have 2 known breakage(s)
# passed all remaining 71 test(s)
1..73
