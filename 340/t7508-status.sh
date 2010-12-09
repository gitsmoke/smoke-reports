ok 1 - status -h in broken repository
ok 2 - commit -h in broken repository
ok 3 - setup
ok 4 - status (1)
ok 5 - status (2)
ok 6 - status (advice.statusHints false)
ok 7 - status -s
ok 8 - status -s -b
ok 9 - status -uno
ok 10 - status (status.showUntrackedFiles no)
ok 11 - status -uno (advice.statusHints false)
ok 12 - status -s -uno
ok 13 - status -s (status.showUntrackedFiles no)
ok 14 - status -unormal
ok 15 - status (status.showUntrackedFiles normal)
ok 16 - status -s -unormal
ok 17 - status -s (status.showUntrackedFiles normal)
ok 18 - status -uall
ok 19 - status (status.showUntrackedFiles all)
ok 20 - status -s -uall
ok 21 - status -s (status.showUntrackedFiles all)
ok 22 - status with relative paths
ok 23 - status -s with relative paths
ok 24 - status --porcelain ignores relative paths setting
ok 25 - setup unique colors
ok 26 - status with color.ui
ok 27 - status with color.status
ok 28 - status -s with color.ui
ok 29 - status -s with color.status
ok 30 - status -s -b with color.status
ok 31 - status --porcelain ignores color.ui
ok 32 - status --porcelain ignores color.status
ok 33 - status --porcelain ignores -b
ok 34 - status without relative paths
ok 35 - status -s without relative paths
ok 36 - dry-run of partial commit excluding new file in index
ok 37 - status refreshes the index
ok 38 - setup status submodule summary
ok 39 - status submodule summary is disabled by default
ok 40 - status --untracked-files=all does not show submodule
ok 41 - status -s submodule summary is disabled by default
ok 42 - status -s --untracked-files=all does not show submodule
ok 43 - status submodule summary
ok 44 - status -s submodule summary
ok 45 - status submodule summary (clean submodule)
ok 46 - status -s submodule summary (clean submodule)
ok 47 - commit --dry-run submodule summary (--amend)
ok 48 - status succeeds in a read-only repository
ok 49 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 50 - .gitmodules ignore=untracked suppresses submodules with untracked content
ok 51 - .git/config ignore=untracked suppresses submodules with untracked content
ok 52 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 53 - .gitmodules ignore=dirty suppresses submodules with untracked content
ok 54 - .git/config ignore=dirty suppresses submodules with untracked content
ok 55 - --ignore-submodules=dirty suppresses submodules with modified content
ok 56 - .gitmodules ignore=dirty suppresses submodules with modified content
ok 57 - .git/config ignore=dirty suppresses submodules with modified content
ok 58 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 59 - .gitmodules ignore=untracked doesn't suppress submodules with modified content
ok 60 - .git/config ignore=untracked doesn't suppress submodules with modified content
ok 61 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 62 - .gitmodules ignore=untracked doesn't suppress submodule summary
ok 63 - .git/config ignore=untracked doesn't suppress submodule summary
ok 64 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 65 - .gitmodules ignore=dirty doesn't suppress submodule summary
ok 66 - .git/config ignore=dirty doesn't suppress submodule summary
ok 67 - --ignore-submodules=all suppresses submodule summary
not ok 68 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 69 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# passed all remaining 67 test(s)
1..69
