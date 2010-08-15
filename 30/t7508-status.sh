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
ok 41 - status submodule summary
ok 42 - status -s submodule summary
ok 43 - status submodule summary (clean submodule)
ok 44 - status -s submodule summary (clean submodule)
ok 45 - commit --dry-run submodule summary (--amend)
not ok - 46 status succeeds in a read-only repository
#	
#		(
#			chmod a-w .git &&
#			# make dir1/tracked stat-dirty
#			>dir1/tracked1 && mv -f dir1/tracked1 dir1/tracked &&
#			git status -s >output &&
#			! grep dir1/tracked output &&
#			# make sure "status" succeeded without writing index out
#			git diff-files | grep dir1/tracked
#		)
#		status=$?
#		chmod 775 .git
#		(exit $status)
#	
ok 47 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 48 - .gitmodules ignore=untracked suppresses submodules with untracked content
ok 49 - .git/config ignore=untracked suppresses submodules with untracked content
ok 50 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 51 - .gitmodules ignore=dirty suppresses submodules with untracked content
ok 52 - .git/config ignore=dirty suppresses submodules with untracked content
ok 53 - --ignore-submodules=dirty suppresses submodules with modified content
ok 54 - .gitmodules ignore=dirty suppresses submodules with modified content
ok 55 - .git/config ignore=dirty suppresses submodules with modified content
ok 56 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 57 - .gitmodules ignore=untracked doesn't suppress submodules with modified content
ok 58 - .git/config ignore=untracked doesn't suppress submodules with modified content
ok 59 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 60 - .gitmodules ignore=untracked doesn't suppress submodule summary
ok 61 - .git/config ignore=untracked doesn't suppress submodule summary
ok 62 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 63 - .gitmodules ignore=dirty doesn't suppress submodule summary
ok 64 - .git/config ignore=dirty doesn't suppress submodule summary
ok 65 - --ignore-submodules=all suppresses submodule summary
not ok 66 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 67 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# failed 1 among remaining 65 test(s)
1..67
