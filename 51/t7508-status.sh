ok 1 - setup
ok 2 - status (1)
ok 3 - status (2)
ok 4 - status (advice.statusHints false)
ok 5 - status -s
ok 6 - status -s -b
ok 7 - status -uno
ok 8 - status (status.showUntrackedFiles no)
ok 9 - status -uno (advice.statusHints false)
ok 10 - status -s -uno
ok 11 - status -s (status.showUntrackedFiles no)
ok 12 - status -unormal
ok 13 - status (status.showUntrackedFiles normal)
ok 14 - status -s -unormal
ok 15 - status -s (status.showUntrackedFiles normal)
ok 16 - status -uall
ok 17 - status (status.showUntrackedFiles all)
ok 18 - status -s -uall
ok 19 - status -s (status.showUntrackedFiles all)
ok 20 - status with relative paths
ok 21 - status -s with relative paths
ok 22 - status --porcelain ignores relative paths setting
ok 23 - setup unique colors
ok 24 - status with color.ui
ok 25 - status with color.status
ok 26 - status -s with color.ui
ok 27 - status -s with color.status
ok 28 - status -s -b with color.status
ok 29 - status --porcelain ignores color.ui
ok 30 - status --porcelain ignores color.status
ok 31 - status --porcelain ignores -b
ok 32 - status without relative paths
ok 33 - status -s without relative paths
ok 34 - dry-run of partial commit excluding new file in index
ok 35 - status refreshes the index
ok 36 - setup status submodule summary
ok 37 - status submodule summary is disabled by default
ok 38 - status --untracked-files=all does not show submodule
ok 39 - status -s submodule summary is disabled by default
ok 40 - status -s --untracked-files=all does not show submodule
not ok - 41 status submodule summary
#	
#		git config status.submodulesummary 10 &&
#		git status >output &&
#		test_cmp expect output
#	
ok 42 - status -s submodule summary
ok 43 - status submodule summary (clean submodule)
ok 44 - status -s submodule summary (clean submodule)
not ok - 45 commit --dry-run submodule summary (--amend)
#	
#		git config status.submodulesummary 10 &&
#		git commit --dry-run --amend >output &&
#		test_cmp expect output
#	
ok 46 # skip status succeeds in a read-only repository (missing SANITY,POSIXPERM of POSIXPERM,SANITY)
not ok - 47 --ignore-submodules=untracked suppresses submodules with untracked content
#	
#		echo modified > sm/untracked &&
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 48 .gitmodules ignore=untracked suppresses submodules with untracked content
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
not ok - 49 .git/config ignore=untracked suppresses submodules with untracked content
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
not ok - 50 --ignore-submodules=dirty suppresses submodules with untracked content
#	
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 51 .gitmodules ignore=dirty suppresses submodules with untracked content
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
not ok - 52 .git/config ignore=dirty suppresses submodules with untracked content
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
not ok - 53 --ignore-submodules=dirty suppresses submodules with modified content
#	
#		echo modified > sm/foo &&
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 54 .gitmodules ignore=dirty suppresses submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 55 .git/config ignore=dirty suppresses submodules with modified content
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
not ok - 56 --ignore-submodules=untracked doesn't suppress submodules with modified content
#	
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 57 .gitmodules ignore=untracked doesn't suppress submodules with modified content
#	
#		git config --add -f .gitmodules submodule.subname.ignore untracked &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 58 .git/config ignore=untracked doesn't suppress submodules with modified content
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
not ok - 59 --ignore-submodules=untracked doesn't suppress submodule summary
#	
#		git status --ignore-submodules=untracked > output &&
#		test_cmp expect output
#	
not ok - 60 .gitmodules ignore=untracked doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore untracked &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 61 .git/config ignore=untracked doesn't suppress submodule summary
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
not ok - 62 --ignore-submodules=dirty doesn't suppress submodule summary
#	
#		git status --ignore-submodules=dirty > output &&
#		test_cmp expect output
#	
not ok - 63 .gitmodules ignore=dirty doesn't suppress submodule summary
#	
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sm &&
#		git status > output &&
#		test_cmp expect output &&
#		git config -f .gitmodules  --remove-section submodule.subname
#	
not ok - 64 .git/config ignore=dirty doesn't suppress submodule summary
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
not ok - 65 --ignore-submodules=all suppresses submodule summary
#	
#		git status --ignore-submodules=all > output &&
#		test_cmp expect output
#	
not ok 66 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 67 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# failed 21 among remaining 65 test(s)
1..67
