not ok - 1 status -h in broken repository
#	
#		mkdir broken &&
#		test_when_finished "rm -fr broken" &&
#		(
#			cd broken &&
#			git init &&
#			echo "[status] showuntrackedfiles = CORRUPT" >>.git/config &&
#			test_expect_code 129 git status -h >usage 2>&1
#		) &&
#		grep "[Uu]sage" broken/usage
#	
not ok - 2 commit -h in broken repository
#	
#		mkdir broken &&
#		test_when_finished "rm -fr broken" &&
#		(
#			cd broken &&
#			git init &&
#			echo "[status] showuntrackedfiles = CORRUPT" >>.git/config &&
#			test_expect_code 129 git commit -h >usage 2>&1
#		) &&
#		grep "[Uu]sage" broken/usage
#	
ok 3 - setup
ok 4 - status (1)
not ok - 5 status (2)
#	
#	
#		git status >output &&
#		test_cmp expect output
#	
#	
not ok - 6 status (advice.statusHints false)
#	
#	
#		git status >output &&
#		test_cmp expect output
#	
#	
ok 7 - status -s
ok 8 - status -s -b
ok 9 - setup dir3
not ok - 10 status -uno
#	
#		git status -uno >output &&
#		test_cmp expect output
#	
not ok - 11 status (status.showUntrackedFiles no)
#	
#		git config status.showuntrackedfiles no
#		test_when_finished "git config --unset status.showuntrackedfiles" &&
#		git status >output &&
#		test_cmp expect output
#	
not ok - 12 status -uno (advice.statusHints false)
#	
#		git status -uno >output &&
#		test_cmp expect output
#	
ok 13 - status -s -uno
ok 14 - status -s (status.showUntrackedFiles no)
not ok - 15 status -unormal
#	
#		git status -unormal >output &&
#		test_cmp expect output
#	
not ok - 16 status (status.showUntrackedFiles normal)
#	
#		git config status.showuntrackedfiles normal
#		test_when_finished "git config --unset status.showuntrackedfiles" &&
#		git status >output &&
#		test_cmp expect output
#	
ok 17 - status -s -unormal
ok 18 - status -s (status.showUntrackedFiles normal)
not ok - 19 status -uall
#	
#		git status -uall >output &&
#		test_cmp expect output
#	
not ok - 20 status (status.showUntrackedFiles all)
#	
#		git config status.showuntrackedfiles all
#		test_when_finished "git config --unset status.showuntrackedfiles" &&
#		git status >output &&
#		test_cmp expect output
#	
ok 21 - teardown dir3
ok 22 - status -s -uall
ok 23 - status -s (status.showUntrackedFiles all)
not ok - 24 status with relative paths
#	
#	
#		(cd dir1 && git status) >output &&
#		test_cmp expect output
#	
#	
ok 25 - status -s with relative paths
ok 26 - status --porcelain ignores relative paths setting
ok 27 - setup unique colors
not ok - 28 status with color.ui
#	
#	
#		git config color.ui always &&
#		test_when_finished "git config --unset color.ui" &&
#		git status | test_decode_color >output &&
#		test_cmp expect output
#	
#	
not ok - 29 status with color.status
#	
#	
#		git config color.status always &&
#		test_when_finished "git config --unset color.status" &&
#		git status | test_decode_color >output &&
#		test_cmp expect output
#	
#	
ok 30 - status -s with color.ui
ok 31 - status -s with color.status
ok 32 - status -s -b with color.status
ok 33 - status --porcelain ignores color.ui
ok 34 - status --porcelain ignores color.status
ok 35 - status --porcelain ignores -b
not ok - 36 status without relative paths
#	
#	
#		git config status.relativePaths false &&
#		test_when_finished "git config --unset status.relativePaths" &&
#		(cd dir1 && git status) >output &&
#		test_cmp expect output
#	
#	
ok 37 - status -s without relative paths
ok 38 - dry-run of partial commit excluding new file in index
ok 39 - dry-run of partial commit excluding new file in index: output
ok 40 - status refreshes the index
ok 41 - setup status submodule summary
not ok - 42 status submodule summary is disabled by default
#	
#		git status >output &&
#		test_cmp expect output
#	
not ok - 43 status --untracked-files=all does not show submodule
#	
#		git status --untracked-files=all >output &&
#		test_cmp expect output
#	
ok 44 - status -s submodule summary is disabled by default
ok 45 - status -s --untracked-files=all does not show submodule
not ok - 46 status submodule summary
#	
#		git config status.submodulesummary 10 &&
#		git status >output &&
#		test_cmp expect output
#	
ok 47 - status -s submodule summary
ok 48 - status submodule summary (clean submodule): commit
not ok - 49 status submodule summary (clean submodule): output
#	
#		git config status.submodulesummary 10 &&
#		test_must_fail git commit --dry-run >output &&
#		test_cmp expect output &&
#		git status >output &&
#		test_cmp expect output
#	
ok 50 - status -s submodule summary (clean submodule)
not ok - 51 commit --dry-run submodule summary (--amend)
#	
#		git config status.submodulesummary 10 &&
#		git commit --dry-run --amend >output &&
#		test_cmp expect output
#	
ok 52 # skip status succeeds in a read-only repository (missing SANITY of POSIXPERM,SANITY)
not ok - 53 --ignore-submodules=untracked suppresses submodules with untracked content
#	
#		echo modified > sm/untracked &&
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 54 .gitmodules ignore=untracked suppresses submodules with untracked content
#	
#		git config diff.ignoreSubmodules dirty &&
#		git status >output &&
#		test_cmp expect output &&
#		git config --add -f .gitmodules submodule.subname.ignore untracked &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname &&
#		git config --unset diff.ignoreSubmodules
#	
not ok - 55 .git/config ignore=untracked suppresses submodules with untracked content
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore untracked &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config --remove-section -f .gitmodules submodule.subname
#	
not ok - 56 --ignore-submodules=dirty suppresses submodules with untracked content
#	
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 57 .gitmodules ignore=dirty suppresses submodules with untracked content
#	
#		git config diff.ignoreSubmodules dirty &&
#		git status >output &&
#		! test -s actual &&
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname &&
#		git config --unset diff.ignoreSubmodules
#	
not ok - 58 .git/config ignore=dirty suppresses submodules with untracked content
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore dirty &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 59 --ignore-submodules=dirty suppresses submodules with modified content
#	
#		echo modified > sm/foo &&
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 60 .gitmodules ignore=dirty suppresses submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 61 .git/config ignore=dirty suppresses submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore dirty &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 62 --ignore-submodules=untracked doesn't suppress submodules with modified content
#	
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 63 .gitmodules ignore=untracked doesn't suppress submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore untracked &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 64 .git/config ignore=untracked doesn't suppress submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore untracked &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 65 --ignore-submodules=untracked doesn't suppress submodule summary
#	
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 66 .gitmodules ignore=untracked doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore untracked &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 67 .git/config ignore=untracked doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore untracked &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 68 --ignore-submodules=dirty doesn't suppress submodule summary
#	
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 69 .gitmodules ignore=dirty doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 70 .git/config ignore=dirty doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git config --add submodule.subname.ignore dirty &&
#		git config --add submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config --remove-section submodule.subname &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 71 --ignore-submodules=all suppresses submodule summary
#	
#		git status --ignore-submodules=all > output &&
#		test_cmp expect output
#	
not ok 72 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 73 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# failed 39 among remaining 71 test(s)
1..73
